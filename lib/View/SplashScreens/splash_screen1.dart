import 'package:flutter/material.dart'; 
import 'package:seru_test_project/CustomWidget/CustomSplashMenue/custom_splash_menue.dart';
import 'package:seru_test_project/custom_const.dart';

import '../../CustomWidget/CustomImageScetion/custom_image_section.dart';
import '../../CustomWidget/CustomText/custom_text.dart';
import '../../CustomWidget/TermsAndCondition/terms_and_condition_part.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    double c_h = MediaQuery.of(context).size.height;
    double c_w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: main_text_white_color,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 69,),
              SizedBox(
                height: c_h * 0.084,
              ),
              CustomImageSection(image: AssetImage("$Seru_Test_logo"), img_height: 98, img_width: 100, img_margin: 0, Img_radius: 11),
              SizedBox(
                height: c_h * 0.025,
              ),
              // SizedBox(height: 20,),
              CustomText(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  text: "Welcome to SERU TEST ONLINE",
                  ),
              SizedBox(
                height: c_h * 0.024,
              ),
              Stack(
                children: [
                  CustomImageSection(image: AssetImage("assets/Gif/first_splashcsreen.gif"), img_height: 390, img_width: 430, img_margin: 0, Img_radius: 11),
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 80.0, right: 64),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                              text: "Next Generation Driving & Training",
                              ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.only(left:15, right: 15),
                        alignment: Alignment.center,
                        child: CustomSplashMenue(
                            image1: "assets/circle_count1.png",
                            text1: "Employee Profile",
                            image2: "assets/circle_count1.png",
                            text2: "Notice & Notifications")),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.only(left:15, right: 15),
                  alignment: Alignment.center,
                  child: CustomSplashMenue(
                      image1: "assets/circle_count3.png",
                      text1: "Driving",
                      image2: "assets/circle_count4.png",
                      text2: "Incentive")),
              SizedBox(
                height: 15,
              ),


              SizedBox(
                height: c_h * 0.035,
              ),

              Align(
                alignment: Alignment.center,
                child:    Container(height: 20,width: 25,child: Image.asset("assets/SeruTestBanner/480px-Orange_animated_left_arrow.gif",fit: BoxFit.fill,),),
              ),

              SizedBox(
                height: c_h * 0.035,
              ),

 
             
             CustomTermsAndConditionPart(),
              SizedBox(
                height: c_h * 0.035,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
