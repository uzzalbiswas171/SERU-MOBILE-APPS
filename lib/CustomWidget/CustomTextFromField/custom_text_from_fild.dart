import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTExtFromField extends StatelessWidget {
  CustomTExtFromField({Key? key,
    required this.controller,
    required this.hintText,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.text_color,
    required this.suffixIcon,
    required this.obscureText,
    this.keyboardType, 
  }) : super(key: key);
   TextEditingController controller;
   String hintText;
  String text;
  double fontSize;
  final FontWeight fontWeight;
  final Color?  text_color;
  final Widget?  suffixIcon;
      TextInputType? keyboardType;
  bool obscureText; 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       keyboardType:keyboardType ,
      obscureText:obscureText ,
      controller: controller, 
      decoration: InputDecoration(
          labelText: "$hintText",
          hintStyle: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight:fontWeight,
        color: text_color,
        letterSpacing: 0.3,),
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.only(left: 15),
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10)))
      ),
    );
  }
}




class CustomTExtFromFieldforreadonly extends StatelessWidget {
  CustomTExtFromFieldforreadonly({Key? key,
    required this.controller,
    required this.hintText,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.text_color,
    required this.suffixIcon,
    required this.obscureText,
    required this.readOnly,
    this.keyboardType, 
  }) : super(key: key);
   TextEditingController controller;
   String hintText;
  String text;
  double fontSize;
  final FontWeight fontWeight;
  final Color?  text_color;
  final Widget?  suffixIcon;
      TextInputType? keyboardType;
  bool obscureText; 
  bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
       keyboardType:keyboardType ,
      obscureText:obscureText ,
      controller: controller, 
      decoration: InputDecoration(
          labelText: "$hintText",
          hintStyle: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight:fontWeight,
        color: text_color,
        letterSpacing: 0.3,),
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.only(left: 15),
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10)))
      ),
    );
  }
}

