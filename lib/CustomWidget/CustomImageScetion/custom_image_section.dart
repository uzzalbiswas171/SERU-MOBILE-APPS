
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomImageSection extends StatelessWidget {
  CustomImageSection({
    Key? key,
    required this.image,
    required this.img_height,
    required this.img_width,
    required  this.img_margin,
    required  this.Img_radius,
    this.image_color,
  }) : super(key: key);
   double?   img_height;
   double?  img_width;
   double  img_margin;
   double   Img_radius;
   Color ? image_color;
  final ImageProvider image ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: img_height,
      width: img_width ,
      margin: EdgeInsets.all(img_margin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Img_radius),
          color: image_color,
          image: DecorationImage(image: image)
      )
    );
  }
}
