import 'package:flutter/material.dart';

class CustomImageSction extends StatelessWidget {
    CustomImageSction({super.key,
    required this.height,
    required this.width,
    required this.radius,
      required this.image,
    });
  double   height;
  double width;
  double  radius;
  String ? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(image: AssetImage("$image"),fit: BoxFit.fill),
      ),
    );
  }
}
