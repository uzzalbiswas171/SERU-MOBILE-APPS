
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:seru_test_project/CustomWidget/CalosolSelalider/carosal_silaider.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_appbar.dart';
import 'package:seru_test_project/CustomWidget/CustomApplySection/custom_apply_section.dart';
import 'package:seru_test_project/CustomWidget/CustomCompany/costom_company_info.dart';
import 'package:seru_test_project/CustomWidget/CustomImageScetion/custom_image_section.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';
import 'package:seru_test_project/CustomWidget/SelectionOptions/selection_option.dart';
import 'package:seru_test_project/View/RegistrationForBuyScreen/registration_for_buy_screen.dart';
import '../../../custom_const.dart';
import '../../Auth/Login/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _applyCuponController=TextEditingController();
  List carosal=[
    "assets/SeruTestBanner/seru_banner.jpg",
    "assets/SeruTestBanner/seru_banner.jpg",
    "assets/SeruTestBanner/seru_banner.jpg",
  ];
bool  is_cliced=false;
 bool  is_cliced_for_own=true;
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(

     body: RefreshIndicator(
       onRefresh: () {
         return Future.delayed(Duration(seconds: 2),() {

         },);
       },
       child: Container(
         height: double.infinity,
         width: double.infinity,
         child: SingleChildScrollView(
           child: Column(
             children: [
               SizedBox(height: h*0.025,),
               /// Apply Sections
               CustomApplyVaucherSection(applyCuponController: _applyCuponController),
               SizedBox(height: h*0.025,),
               /// Slide Company Banner
               CalosolSelalider(custom_height: 130, carousal_list: carosal, carousal_onTab: () {

               },),
               SizedBox(height: h*0.025,),
               /// Select Options
               SelectionOptionsScreen(leftText: "Select Your Package",rite_text: "View all",),
               SizedBox(height: h*0.010,),
               Container(
                 height: 600,
                 padding: const EdgeInsets.all(10.0),
                 child: GridView.builder(
                   shrinkWrap: true,
                   itemCount: 6,
                   physics: NeverScrollableScrollPhysics(),
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   crossAxisSpacing: 10,
                   mainAxisSpacing: 10,
                     mainAxisExtent: 190
                 ), itemBuilder: (context, index) {
                   return InkWell(
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                     },
                     child: Card(
                       color: Main_Theme_textColor_tir_Condition.withOpacity(0.8),
                       child: Container(
                         height: 100,
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Align(
                               alignment: Alignment.centerRight,
                             child:  Container(
                               height: 30,
                               width: 100,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15),
                                 color: Colors.black
                               ),
                               alignment: Alignment.center,
                               child: CustomText(text: "\£ 29",text_color: main_text_white_color ,fontSize: 17, fontWeight: FontWeight.w500),
                             ),
                             ),
                             SizedBox(height: 5,),
                             CustomText(text: "✓ 20 Mocktest", fontSize: 18, fontWeight: FontWeight.w500)
                             ,
                             SizedBox(height: 5,),
                             CustomText(text: "✓ 20 Mocktest", fontSize: 16, fontWeight: FontWeight.w500)
                           ,SizedBox(height: 5,),
                            GestureDetector(
                              onTap: () {

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
                                                width: MediaQuery.of(context).size.width*0.8,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    ElevatedButton( style: ElevatedButton.styleFrom(
                                                backgroundColor:is_cliced_for_own==false? BootomBarColor :Colors.white
                                                ),
                                                        onPressed: () {

                                                      setState(() {
                                                        is_cliced_for_own=false;
                                                        is_cliced=true;
                                                      },);
                                                    }, child: CustomText(text: "FOR GIFT", fontSize: 16, fontWeight: FontWeight.w500)),
                                                    ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor:is_cliced_for_own==true? BootomBarColor:Colors.white
                                                        ),
                                                        onPressed: () {
                                                      setState(() {
                                                        is_cliced_for_own=true;
                                                        is_cliced=true;
                                                      },);
                                                    }, child: CustomText(text: "FOR OWN", fontSize: 16, fontWeight: FontWeight.w500)),
                                                  ],
                                                ),
                                              ),

                                              is_cliced==false?Container():   SizedBox(height: 20,),
                                              is_cliced==false?Container(): GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(),));
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
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(),));
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
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(),));
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
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(),));
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
                              child: CircleAvatar(
                                 radius: 30,
                                 backgroundImage: AssetImage("assets/Gif/buynowcircle.gif"),
                               ),
                            ),
                            // Image.asset("assets/Gif/buynow.webp",height: 40,width: 100,fit: BoxFit.fill,)
                           ],
                         ),
                       ),
                     ),
                   );
                 },),
               ),
               /// Slide Add
               CalosolSelalider(custom_height: 100, carousal_list: carosal, carousal_onTab: () {
               },),
               SizedBox(height: h*0.010,),
               /// Company Information
               CustomInfoScreen(),
               /// Company Payment way
               Container(
                 height: 50,
                 width: double.infinity,
                 padding: EdgeInsets.only(left: 10,right: 10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: ListView.builder(
                   itemCount:imageList.length ,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index) {
                     return Card(
                       child: Image.asset("${imageList[index]}",height: 40,width: 100,),
                     );
                   },),
               ),
               SizedBox(height: 90,),
             ],
           ),
         ),
       ),
     ),
    );
  }
  List imageList=[
    "assets/PymentImage/applepay.jpg",
    "assets/PymentImage/gpay.PNG",
    "assets/PymentImage/mastercad.PNG",
    "assets/PymentImage/mestro.PNG",
    "assets/PymentImage/payple.PNG",
    "assets/PymentImage/stripe.PNG",
    "assets/PymentImage/visa.PNG",
    "assets/PymentImage/visaElectron.PNG",
  ];
}
