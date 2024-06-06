import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seru_test_project/custom_const.dart';

import '../../CustomText/custom_text.dart';


class CustomSplashBootomBar extends StatelessWidget {
  const CustomSplashBootomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: BootomBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                
              },
              child: CustomText(text: "Help", fontSize: 16, fontWeight: FontWeight.w500)),
          GestureDetector(
              onTap: () {

              },child: CustomText(text: "About us", fontSize: 16, fontWeight: FontWeight.w500)),
          GestureDetector(
              onTap: () {

              }, child: CustomText(text: "Contact us", fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
