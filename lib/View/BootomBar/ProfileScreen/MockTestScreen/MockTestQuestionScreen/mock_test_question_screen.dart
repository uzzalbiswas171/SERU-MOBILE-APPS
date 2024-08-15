

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';

import '../../../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../custom_const.dart'; 

class MockTestQuestionScreen extends StatefulWidget {
  MockTestQuestionScreen({super.key,required this.moc_test_no});
  String moc_test_no;
  @override
  State<MockTestQuestionScreen> createState() => _MockTestQuestionScreenState();
}

class _MockTestQuestionScreenState extends State<MockTestQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final data= Provider.of<ProfileController>(context).MOCID_WISE_QUESTION_LIST_GET;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
        Navigator.pop(context);
      }, title: "Mock test no - ${widget.moc_test_no}")),
      body: RefreshIndicator(
        onRefresh:() {
          return Future.delayed(Duration(seconds: 1),() {

          },);
        },
        child:
        "${data}"=="null"?
        Center(child:  CircularProgressIndicator(),):"${data}"=="[]"?
        Center(child: CustomText(text: "Data not found..",fontSize: 18,fontWeight: FontWeight.w500,)):

        Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            //   itemCount: data.length,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: Container(
                  // margin: EdgeInsets.only(bottom: 7),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      //  color: appbarcollor.withOpacity(0.5),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.5)
                      )
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomText(text: "Q${index+1} . ${Bidi.stripHtmlIfNeeded("${data[index]["question_description"]??""}").replaceAll( "\n", " " )} ", fontSize: 14, fontWeight: FontWeight.w400),
                      Divider(height: 5,),
                      CustomText(text:"A . ${data[index]["option_1"]??""}", fontSize: 11, fontWeight: FontWeight.w400 ,),
                      SizedBox(height: 7,),
                      CustomText(text: "B . ${data[index]["option_2"]??""}", fontSize: 11, fontWeight: FontWeight.w400),
                      SizedBox(height: 7,),
                      CustomText(text: "C . ${data[index]["option_3"]??""}",fontSize: 11, fontWeight: FontWeight.w400 ,),
                      SizedBox(height: 7,),
                      CustomText(text: "D . ${data[index]["option_4"]??""}",fontSize:11,   fontWeight: FontWeight.w400 ),

                    ],
                  ),
                ),
              );
            },),
        ),
      ),
      bottomNavigationBar: CustomButton(onTap: () {

      }, text: "Submit Answer", button_text_fontSize: 16, button_height: 60),
    );
  }
  bool is_check=false;
}

