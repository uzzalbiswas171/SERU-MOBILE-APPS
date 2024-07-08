import 'package:flutter/material.dart';

import '../../custom_const.dart';
import '../CustomText/custom_text.dart';

class QuestionPartA extends StatelessWidget {
  QuestionPartA({super.key,
  required this.text_question,
  required this.is_check,
  required this.onTap,
  });
  VoidCallback ?onTap;
  String text_question;
  bool is_check;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              height: 16,
              width: 16,

              decoration: BoxDecoration(
                //   color: Main_Theme_blac,
                  border: Border.all(color:Main_Theme_blac.withOpacity(0.4) ),
                  image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":""),fit: BoxFit.fill)
              ),
            ),
            const  SizedBox(width: 10,),
            Expanded(child: CustomText(text: "$text_question",fontSize:15 ,fontWeight: FontWeight.w400,))
          ],
        ),
      ),
    );
  }
}
