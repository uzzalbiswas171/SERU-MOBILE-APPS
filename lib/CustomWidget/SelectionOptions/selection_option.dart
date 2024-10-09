 import 'package:flutter/material.dart';

import '../../custom_const.dart';
import '../CustomText/custom_text.dart';

class SelectionOptionsScreen extends StatelessWidget {
 SelectionOptionsScreen({super.key,this.leftText, this.rite_text});
  String ? leftText,rite_text;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Container(
      width: w * 0.95,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [

           CustomText(text: "$leftText", fontSize: 18, fontWeight: FontWeight.w700),
           Container(
               height: 30,
               width: 110,

               decoration: BoxDecoration(borderRadius: BorderRadius.circular(9) ,
                 color: defaultBackgroundColor,),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   CustomText(text: "$rite_text", fontSize: 15,
                       fontWeight: FontWeight.w500,text_color: bootomNavigationbarBackgrountcolor),
                   SizedBox(width: 6,),
                   Icon(Icons.arrow_circle_right_outlined,size: 18,color: bootomNavigationbarBackgrountcolor,),
                 ],
               )),
          ]),
    );
  }
}
