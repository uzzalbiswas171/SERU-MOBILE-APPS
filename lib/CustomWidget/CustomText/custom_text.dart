
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.text_color,
    this.overflow,
    this.maxLines,
    this.fontStyle,
    this.textAlign, required  ,
  });
  String text;
  double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final Color?  text_color;
final TextOverflow? overflow;
final int? maxLines;
final FontStyle? fontStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
        maxLines: maxLines,
        "$text",
        textAlign: textAlign,
        overflow: overflow,
        style: GoogleFonts.roboto(
          fontSize: fontSize,
          fontWeight:fontWeight,
          color: text_color,
          letterSpacing: 0.3,
          fontStyle: fontStyle,
        ));
  }
}


