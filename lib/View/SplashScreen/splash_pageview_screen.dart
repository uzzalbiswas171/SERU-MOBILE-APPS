import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seru_test_project/CustomWidget/CustomBootomBar/SplashBootomBar/splash_bootom_bar.dart';
import 'package:seru_test_project/CustomWidget/CustomButton/custom_button.dart';
import 'package:seru_test_project/CustomWidget/CustomImageScetion/custom_image_section.dart';

import '../../CustomWidget/CustomText/custom_text.dart';
import '../../custom_const.dart';
import '../Auth/Login/screens/login_screen.dart';

class SplashPageViewScreen extends StatefulWidget {
  const SplashPageViewScreen({Key? key}) : super(key: key);

  @override
  State<SplashPageViewScreen> createState() => _SplashPageViewScreenState();
}

class _SplashPageViewScreenState extends State<SplashPageViewScreen> {
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);
  var currentPageValue = 0.0;
  var mItemCount = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page!;
      });
    });
  }

  void changePageViewPostion(int whichPage) {
    if (controller != null) {
      whichPage = whichPage + 1; // because position will start from 0
      double jumpPosition = MediaQuery.of(context).size.width / 2;
      double orgPosition = MediaQuery.of(context).size.width / 2;
      for (int i = 0; i < mItemCount; i++) {
        controller.jumpTo(jumpPosition);
        if (i == whichPage) {
          break;
        }
        jumpPosition = jumpPosition + orgPosition;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop:() => Future(() => false),
      child: Scaffold(
          bottomNavigationBar: CustomSplashBootomBar(),
          body: PageView.builder(
            controller: controller,
            itemBuilder: (context, position) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.1,
                      ),
                      CustomImageSection(
                        image: AssetImage( "assets/Gif/qloading.gif" ),
                        img_margin: 10,
                        Img_radius: 10,
                        img_height: 120,
                        img_width: w,
                      ),
                      SizedBox(
                        height: h * 0.15,
                      ),
                     CustomText(
                          text:  position==0?"$Splash2_text":position==1?"$Splash2_text":"$Splash3_text",
                          textAlign: TextAlign.justify,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        height: h * 0.15,
                      ),
                      position==2?Container(
                        child: CustomButton(onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                        }, text: "GET STARTED", button_text_fontSize: 16, button_height: 40),
                      ) :    Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            color: BootomBarColor.withOpacity(0.5),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: "Slide to Next",text_color: main_text_white_color ,fontSize: 14, fontWeight: FontWeight.w400),
                              CustomImageSection(image: AssetImage("assets/SeruTestBanner/480px-Orange_animated_left_arrow.gif"), img_height: 20, img_width: 30, img_margin: 0, Img_radius: 0)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.15,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: mItemCount,
          )),
    );
  }
}
