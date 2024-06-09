import 'package:flutter/material.dart';
import '../../../CustomWidget/TermsAndCondition/terms_and_condition_part.dart';
import '../../CustomWidget/CustomSplashMenue/custom_image.dart';
import '../../CustomWidget/CustomSplashMenue/custom_splash_menue.dart';
import '../../CustomWidget/CustomText/custom_text.dart';
import '../../custom_const.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {


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
              CustomImageSction(
                  height: 98,
                  width: 100,
                  radius: 11,
                  image: "$Seru_Test_logo"),
              SizedBox(
                height: c_h * 0.025,
              ),
              // SizedBox(height: 20,),
              CustomText(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  text: "Auto Attendance Process", ),
              SizedBox(
                height: c_h * 0.025,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 450,
                      width: 500,
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/Gif/second_splashcsreen.gif",
                        height: 300,
                        width: 400,
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            alignment: Alignment.center,
                            child: CustomSplashMenue(
                                image1: "assets/circle_count1.png",
                                text1: "Auto Data Training",
                                image2: "assets/circle_count2.png",
                                text2: "Auto Roster")),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            alignment: Alignment.center,
                            child: CustomSplashMenue(
                                image1: "assets/circle_count3.png",
                                text1: "Auto Process",
                                image2: "assets/circle_count4.png",
                                text2: "Auto Shift Change")),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 80,
                          child: Column(
                            children: [
                              CustomText(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  text: "Driving", )
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          child: Column(
                            children: [
                              CustomText(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  text: "Training", )
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          child: Column(
                            children: [
                              CustomText(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  text: "Exam", )
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          child: Column(
                            children: [
                              CustomText(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  text: "Licence", )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
