import 'package:flutter/material.dart';

import '../../custom_const.dart';
import '../CustomTextFromField/custom_text_from_fild.dart';

class CustomApplyVaucherSection extends StatelessWidget {
  CustomApplyVaucherSection({Key? key,required this.applyCuponController,required this.onTap}) : super(key: key);
   TextEditingController applyCuponController=TextEditingController();
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 47,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Expanded(child: CustomTExtFromField(controller: applyCuponController, hintText: "Enter Apply Cupone", text: "Apply Vaucher", fontSize: 16, fontWeight: FontWeight.w500, text_color: main_text_blac_color,
              suffixIcon:InkWell(
                onTap: onTap,
                child: Container(
                  height: 60,width: 140,
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ) ,
                      image: DecorationImage(image: AssetImage("assets/Gif/applynow.gif"),fit: BoxFit.fill)
                  ),
                ),
              ), obscureText: false))
        ],
      ),
    );
  }
}
