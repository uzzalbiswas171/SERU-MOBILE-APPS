import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';
import 'package:seru_test_project/custom_const.dart';

import '../../../../../Controller/profile_controller.dart';
import '../../../../../CustomWidget/CustomAppbar/custom_individual_appbar.dart';

class IndividualResultScreen extends StatefulWidget {
  const IndividualResultScreen({super.key});

  @override
  State<IndividualResultScreen> createState() => _IndividualResultScreenState();
}

class _IndividualResultScreenState extends State<IndividualResultScreen> {
  @override
  Widget build(BuildContext context) {
    final data=Provider.of<ProfileController>(context).All_MyMARK_RESULT_LIST_HISTORY_GET;

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
         Navigator.pop(context);
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have to finish or submit")));
      }, title: "Your result on 30/10/2024")),
    body : RefreshIndicator(
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
        itemCount: data.length,
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
                 //  CustomText(text: "Q1 . I am from sadhhali sn Lorem text is so damy datta from here", fontSize: 13, fontWeight: FontWeight.w400),
                 // Divider(height: 5,),
                 //  CustomText(text: "A . asvasvdjasv js as jajs djasdjagsdj", fontSize: 13, fontWeight: FontWeight.w400,text_color: Colors.green,),
                 //  SizedBox(height: 7,),
                 //  CustomText(text: "B . I am ,shdvucsd cusd cuadugscuagsudgasugduasgdu as du asud uasgfrom sadhhali   ", fontSize: 13, fontWeight: FontWeight.w400),
                 //  SizedBox(height: 7,),
                 //   CustomText(text: "C . I am from sadhhali   ", fontSize: 13, fontWeight: FontWeight.w400),
                 //  SizedBox(height: 7,),
                 //  CustomText(text: "D . I am from sadhhali  ", fontSize:13,text_color:index==3? Colors.red : Colors.black, fontWeight: FontWeight.w400),

                  CustomText(text: "Q1 . ${data[index]["question_description"].replaceAll( "\n", " " )??""}", fontSize: 13, fontWeight: FontWeight.w400),
                  Divider(height: 5,),
                  CustomText(text:"A . ${data[index]["option_1"]??""}", fontSize: 13, fontWeight: FontWeight.w400 ,  text_color: "${data[index]["answer_list"]??""}"=="1"  ? Colors.green:"${data[index]["answer_list"]??""}"=="1" && "${data[index]["answer_selected"]??""}"==1?Colors.green:"${data[index]["answer_selected"]??""}"=="1"?Colors.red: Colors.black,),
                  SizedBox(height: 7,),
                  CustomText(text: "B . ${data[index]["option_2"]??""}", fontSize: 13, fontWeight: FontWeight.w400 , text_color: "${data[index]["answer_list"]??""}"=="2" ? Colors.green:"${data[index]["answer_list"]??""}"=="2" && "${data[index]["answer_selected"]??""}"==2?Colors.green:"${data[index]["answer_selected"]??""}"=="2"?Colors.red: Colors.black,),
                  SizedBox(height: 7,),
                  CustomText(text: "C . ${data[index]["option_3"]??""}",fontSize: 13, fontWeight: FontWeight.w400 , text_color: "${data[index]["answer_list"]??""}"=="3"  ? Colors.green: "${data[index]["answer_list"]??""}"=="3" && "${data[index]["answer_selected"]??""}"==3?Colors.green:"${data[index]["answer_selected"]??""}"=="3"?Colors.red: Colors.black,),
                  SizedBox(height: 7,),
                  CustomText(text: "D . ${data[index]["option_4"]??""}",fontSize:13,   fontWeight: FontWeight.w400 , text_color: "${data[index]["answer_list"]??""}"=="4" ? Colors.green: "${data[index]["answer_list"]??""}"=="4" && "${data[index]["answer_selected"]??""}"==4?Colors.green:"${data[index]["answer_selected"]??""}"=="4"?Colors.red: Colors.black,),

                ],
              ),
            ),
          );
        },),
      ),
    )
    );

  }
}
