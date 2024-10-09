

import 'package:seru_test_project/custom_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double button_text_fontSize,button_height;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.button_text_fontSize,
    required this.button_height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
       //   color: Color(0xffffa152),
        //  color: BootomBarColor,
          gradient: customBackground(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,

            style:  GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: button_text_fontSize),
          ),
        ),
      ),
    );
  }
}