import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seru_test_project/CustomWidget/CalosolSelalider/carosal_silaider.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_appbar.dart';
import 'package:seru_test_project/CustomWidget/CustomApplySection/custom_apply_section.dart';
import 'package:seru_test_project/CustomWidget/CustomCompany/costom_company_info.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';
import 'package:seru_test_project/CustomWidget/CustomTextFromField/custom_text_from_fild.dart';
import 'package:seru_test_project/CustomWidget/SelectionOptions/selection_option.dart';

import '../../custom_const.dart';
import '../Auth/Login/screens/login_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(preferredSize:Size.fromHeight(75), child: CustomAppbar()),
     body: Container(
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
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: GridView.builder(
                 shrinkWrap: true,
                 itemCount: 6,
                 physics: NeverScrollableScrollPhysics(),
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 10,
                 mainAxisSpacing: 10,
               ), itemBuilder: (context, index) {
                 return InkWell(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                   },
                   child: Card(
                     color: BootomBarColor.withOpacity(0.8),
                     child: Padding(
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
                          CircleAvatar(
                             radius: 30,
                             backgroundImage: AssetImage("assets/Gif/buynowcircle.gif"),
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
             CalosolSelalider(custom_height: 130, carousal_list: carosal, carousal_onTab: () {
             },),
             SizedBox(height: h*0.010,),
             /// Company Payment way
             Container(
               height: 100,
               width: double.infinity,
               padding: EdgeInsets.only(left: 10,right: 10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                   color: BootomBarColor.withOpacity(0.4),
             ),
               child: ListView.builder(
                 itemCount:imageList.length ,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index) {
                 return Card(
                   child: Image.asset("${imageList[index]}",height: 80,width: 100,),
                 );
               },),
             ),

             SizedBox(height: 15,),
             /// Company Information
             CustomInfoScreen(),
             SizedBox(height: 15,),
           ],
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
