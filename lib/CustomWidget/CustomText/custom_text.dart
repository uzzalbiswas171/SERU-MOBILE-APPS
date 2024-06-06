
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.text_color,
    this.textAlign,
  });
  String text;
  double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final Color?  text_color;
  @override
  Widget build(BuildContext context) {
    return Text("$text",
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight:fontWeight,
          color: text_color,
          letterSpacing: 0.3,
        ));
  }
}


