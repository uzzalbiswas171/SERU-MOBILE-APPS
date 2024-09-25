import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/homeController.dart';
import 'package:seru_test_project/View/BootomBar/bootombar.dart';
import '../../../CustomWidget/TermsAndCondition/terms_and_condition_part.dart';
import '../../CustomWidget/CustomButton/custom_button.dart';
import '../../CustomWidget/CustomSplashMenue/custom_image.dart';
import '../../CustomWidget/CustomSplashMenue/custom_splash_menue.dart';
import '../../CustomWidget/CustomText/custom_text.dart';
import '../../custom_const.dart';
class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  void initState() {
  Provider.of<HomeController>(context,listen: false).getAllPackageProvider(context);
  if("${GetStorage().read("Api_token")}"=="" || "${GetStorage().read("Api_token")}"=="null"){
    print("${GetStorage().read("Api_token")}");
  }else{
    print("${GetStorage().read("Api_token")}");
    Future.delayed(Duration(seconds: 2),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => BttotomBarScreen(index: 0,),));
    },);
  }
  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double c_h = MediaQuery.of(context).size.height;
    double c_w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: "${GetStorage().read("Api_token")}"=="" || "${GetStorage().read("Api_token")}"=="null" ?
      Container(
        height: double.infinity,
        width: double.infinity,
        //  color: Main_3Theme_SplashScreenColor,
        color: main_text_white_color,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 69,),
              SizedBox(
                height:c_h<700? c_h * 0.044 :c_h * 0.084 ,
              ),
              CustomImageSction(
                  height: 98,
                  width: 100,
                  radius: 11,
                  image: "$Seru_Test_logo"),
              SizedBox(
                height:c_h<700? c_h * 0.015 : c_h * 0.025,
              ),
              // SizedBox(height: 20,),
              CustomText(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  text: "Auto Certified",
                ),
              SizedBox(
                height:c_h<700? c_h * 0.015 : c_h * 0.025,
              ),
             
              Stack(
                alignment: Alignment.center,
                children: [
                  Container( 
                    height:c_h<700?270: 340,
                    width: double.infinity,
                    child: Container(
                        height:  400,
                       width: double.infinity,

                        child: Container(
                          padding: EdgeInsets.only(top: 50),
                          child: Image.asset(
                            "assets/Gif/third_splashcsreen.gif",
                            height: 240,
                           width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        width: 369,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: CustomText(
                            fontSize: 14,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w400,
                            text:
                                "Mobile apps for small enterprises, web applications & mobile apps for large enterprises.",
                          )),
                  ),
                ],
              ),

              SizedBox(
                height: 13,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  alignment: Alignment.center,
                  child: CustomSplashMenue(
                      image1: "assets/circle_count1.png",
                      text1: "learn Rules of Driving",
                      image2: "assets/circle_count2.png",
                      text2: "Online Exam")),
              SizedBox(
                height: 13,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  alignment: Alignment.center,
                  child: CustomSplashMenue(
                      image1: "assets/circle_count3.png",
                      text1: "Way Fence",
                      image2: "assets/circle_count4.png",
                      text2: "Online Certificate")),

              SizedBox(
                height: c_h<700 ?c_h * 0.045 : c_h * 0.075,
              ),
              Container(
                height: 32,
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 
                    Container(
                      height: 100,
                      width: 110,
                      child: CustomButton(
                          onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => BttotomBarScreen(index: 0,),));
                          },
                          text: "Get Started",
                          button_text_fontSize: 13, 
                          button_height: 55,  
                        
                      ),
                    )
                  ],
                ),
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
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/Gif/carmoving.gif",height: 100,width: 100,),
            CustomText(text: "Loading...", fontSize: 22, fontWeight: FontWeight.w700,fontStyle:FontStyle.italic ,)
          ],
        ),
      )
    );
  }
}
