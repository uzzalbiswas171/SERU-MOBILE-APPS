import 'package:flutter/material.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';

import '../../../../CustomWidget/CustomImageScetion/custom_image_section.dart';
import '../../../../custom_const.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool  is_cliced=false;
  bool  is_cliced_for_own=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 190
              ), itemBuilder: (context, index) {
              return InkWell(
                onTap: () {

                },
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                    ,color: Main_Theme_Color,
                  ),
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
              );
            },),
          ),
        ),
      ),
    );
  }
}
