import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../../Controller/homeController.dart';
import '../../../CustomWidget/CustomAppbar/custom_appbar.dart';
import '../../../CustomWidget/CustomImageScetion/custom_image_section.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../custom_const.dart';
import '../../Auth/Login/screens/login_screen.dart';
import '../../RegistrationForBuyScreen/registration_for_buy_screen.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key}) : super(key: key);

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  bool  is_cliced=false;
  String  is_cliced_for_own="1";
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(preferredSize:Size.fromHeight(60), child: CustomAppbar()),
      body:  Consumer<HomeController>(
                 builder: (context, value, child)=>Container(
                   padding: const EdgeInsets.all(10.0),
                   child: GridView.builder(
                     shrinkWrap: true,
                     itemCount:value.getAllPackageList==null?0: value.getAllPackageList.length, 
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     crossAxisSpacing: 10,
                     mainAxisSpacing: 10,
                       mainAxisExtent: 145
                   ), itemBuilder: (context, index) {
                     return Card(
                       child: Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10)
                           ,
                           color: listColors[index % listColors.length],
                         ),
                         height: 70,
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                              //   CustomText(text: "Package: ${value.getAllPackageList[index]["subscription_structure_id"]??0}",text_color: main_text_blac_color ,fontSize: 12, fontWeight: FontWeight.w500),
                     Spacer(),
                                 Container(
                                   height: 25,
                                   width: 80,
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(15),
                                       gradient: customBackground()
                                   ),
                                   alignment: Alignment.center,
                                   child: CustomText(text: "\£ ${value.getAllPackageList[index]["amount"]??0}",text_color: main_text_white_color ,fontSize: 17, fontWeight: FontWeight.w500),
                                 ),
                               ],
                             ),
                             SizedBox(height: 5,),
                             CustomText(maxLines:2, text: "${value.getAllPackageList[index]["title"]??"0"}", fontSize: 14, fontWeight: FontWeight.w500)
                             // ,
                             // SizedBox(height: 5,),
                             // CustomText(text: "Package ${value.getAllPackageList[index]["subscription_structure_id"]??"0"}", fontSize: 16, fontWeight: FontWeight.w500)
                            ,SizedBox(height: 5,),
                             InkWell(
                               onTap: () {
                               
                         "${GetStorage().read("Api_token")}"=="" || "${GetStorage().read("Api_token")}"=="null"?

                         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),))
                             :
                         showDialog(context: context, builder: (context) {
                           return StatefulBuilder(
                             builder: (context, setState) {
                               return AlertDialog(
                                 title: CustomText(text: "For who do you want to buy ?..", fontSize: 18, fontWeight: FontWeight.w600),
                                 content: Container(
                                   height: is_cliced==true?265:60,
                                   child: Column(
                                     children: [
                                       Container(
                                         height: 60,
                                         width: MediaQuery.of(context).size.width*0.85,
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             ElevatedButton( style: ElevatedButton.styleFrom(
                                                 backgroundColor:is_cliced_for_own=="FOR GIFT"? BootomBarColor :Colors.white
                                             ),
                                                 onPressed: () {

                                                   setState(() {
                                                     is_cliced_for_own="FOR GIFT";
                                                     is_cliced=true;
                                                   },);
                                                 }, child: CustomText(text: "FOR GIFT", fontSize:h<700?10: 12, fontWeight: FontWeight.w500)),
                                             ElevatedButton(
                                                 style: ElevatedButton.styleFrom(
                                                     backgroundColor:is_cliced_for_own=="FOR OWN"? BootomBarColor:Colors.white
                                                 ),
                                                 onPressed: () {
                                                   setState(() {
                                                     is_cliced_for_own="FOR OWN";
                                                     is_cliced=true;
                                                   },);
                                                 }, child: CustomText(text: "FOR OWN", fontSize:h<700?10: 12, fontWeight: FontWeight.w500)),
                                           ],
                                         ),
                                       ),

                                       is_cliced==false?Container():
                                       SizedBox(height: 20,),
                                       is_cliced==false?Container():
                                       GestureDetector(
                                         onTap: () {
                                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(
                                             package_id: "${value.getAllPackageList[index]["subscription_structure_id"]??"0"}",
                                             subscription_structure_id:"${value.getAllPackageList[index]["subscription_structure_id"]??"0"}" ,
                                             is_cliced_for_own: is_cliced_for_own,
                                           ),));
                                         },
                                         child: Container(
                                           height: 60,
                                           width: MediaQuery.of(context).size.width*0.8,
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               CustomImageSection(image:AssetImage("assets/PymentImage/mastercad.PNG"), img_height: 90, img_width: 80, img_margin: 10, Img_radius: 11),
                                             ],
                                           ),
                                         ),
                                       ),
                                       is_cliced==false?Container():  Container(
                                         height: 60,
                                         width: MediaQuery.of(context).size.width*0.8,
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [

                                             GestureDetector(
                                                 onTap: () {
                                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(
                                                     package_id: "${value.getAllPackageList[index]["subscription_structure_id"]??"0"}",
                                                     subscription_structure_id:"${value.getAllPackageList[index]["subscription_structure_id"]??"0"}" ,
                                                      is_cliced_for_own: is_cliced_for_own,
                                                   ),));
                                               },
                                                 child: CustomImageSection(image:AssetImage("assets/PymentImage/payple.PNG"), img_height: 90, img_width: 80, img_margin: 0, Img_radius: 11)),
                                             CircleAvatar(
                                               radius: 30,
                                               backgroundColor: BootomBarColor.withOpacity(0.3),
                                               child: Text("??",style: TextStyle(
                                                 fontSize: 33,
                                               ),),
                                             ),
                                             GestureDetector(
                                                 onTap: () {
                                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(
                                                     package_id: "${value.getAllPackageList[index]["subscription_structure_id"]??"0"}",
                                                     subscription_structure_id:"${value.getAllPackageList[index]["subscription_structure_id"]??"0"}" ,
                                                      is_cliced_for_own: is_cliced_for_own,
                                                   ),));
                                                   },child: CustomImageSection(image:AssetImage("assets/PymentImage/gpay.PNG"), img_height: 90, img_width: 80, img_margin: 0, Img_radius: 11)),

                                           ],
                                         ),
                                       ),
                                       is_cliced==false?Container():  Container(
                                         height: 60,
                                         width: MediaQuery.of(context).size.width*0.8,
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             GestureDetector(
                                                 onTap: () {
                                                   Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(
                                                     package_id: "${value.getAllPackageList[index]["subscription_structure_id"]??"0"}",
                                                     subscription_structure_id:"${value.getAllPackageList[index]["subscription_structure_id"]??"0"}" ,
                                                      is_cliced_for_own: is_cliced_for_own,
                                                   ),));
                                                   },child: CustomImageSection(image:AssetImage("assets/PymentImage/mastercad.PNG"), img_height: 90, img_width: 80, img_margin: 10, Img_radius: 11)),
                                           ],
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               );
                             },
                           );
                         },);


                               },
                               child: Card(
                                 elevation: 9,
                                 child: Container(
                                   height: 26,
                                   width: double.infinity,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(
                                         6
                                     ),
                                     gradient: customBackground(),
                                   ),
                                   alignment: Alignment.center,
                                   child: CustomText(text: "Buy Now", fontSize: 16, fontWeight: FontWeight.w700,text_color: Main_Theme_white,),
                                 ),
                               ),
                               // child: CircleAvatar(
                               //    radius: 30,
                               //    backgroundImage: AssetImage("assets/Gif/buynowcircle.gif"),
                               //  ),
                             ),
                             // Image.asset("assets/Gif/buynow.webp",height: 40,width: 100,fit: BoxFit.fill,)
                         
                           ],
                         ),
                       ),
                     );
                   },),
                 ),
               ),
             
    );
  }
}
