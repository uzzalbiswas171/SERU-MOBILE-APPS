import 'package:flutter/material.dart';
import '../../custom_const.dart';
import '../CustomText/custom_text.dart';

class CustomTermsAndConditionPart extends StatelessWidget {
  const CustomTermsAndConditionPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: CustomText(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              text: "By proceeding further you are agreeing with our",
              ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              CustomText(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              text: "Terms & Conditions",
                text_color: Main_Theme_textColor_tir_Condition,

            ),
            CustomText(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              text: " and ",
            ),
            CustomText(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              text: "Privacy Policy",
              text_color: Main_Theme_textColor_tir_Condition,
            ),
          ],
        ),
      ],
    );
  }
}
