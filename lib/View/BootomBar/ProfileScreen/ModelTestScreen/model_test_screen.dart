import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';
import 'package:seru_test_project/CustomWidget/Question/question_part_a.dart';

import '../../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../../custom_const.dart';

class ModelTestScreen extends StatefulWidget {
  const ModelTestScreen({super.key});

  @override
  State<ModelTestScreen> createState() => _ModelTestScreenState();
}

class _ModelTestScreenState extends State<ModelTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
        Navigator.pop(context);
      }, title: "Model Test")),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>
              Container(
                margin: EdgeInsets.only(bottom: 7),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color: question_color
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Q?${index+1} . I am uzzal Biswas .From Sadhuhali Lorem Ipsam", fontSize: 15, fontWeight: FontWeight.w500),
                    SizedBox(height: 7,),
                    Column(
                      children: [
                        Row(
                          children: [
                            QuestionPartA(text_question: "A for apple", is_check: index%2 ==0?true:false, onTap: () {

                            },) ,
                            QuestionPartA(text_question: "B for Ball", is_check: index%3 ==0?true:false, onTap: () {
                            },)
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          children: [
                            QuestionPartA(text_question: "C for apple", is_check: index%4 ==0?true:false, onTap: () {

                            },) ,
                            QuestionPartA(text_question: "D for Ball", is_check: index%5 ==0?true:false, onTap: () {

                            },)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
        ),),
      ),

    );
  }
  bool is_check=true;
  int selectced_index=-1;
}
