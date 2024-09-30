import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';
import 'package:seru_test_project/CustomWidget/Question/question_part_a.dart';

import '../../../../Controller/profile_controller.dart';
import '../../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../../custom_const.dart';

class ModelTestScreen extends StatefulWidget {
  const ModelTestScreen({super.key});

  @override
  State<ModelTestScreen> createState() => _ModelTestScreenState();
}

class _ModelTestScreenState extends State<ModelTestScreen> {
  @override
  void initState() {
    Provider.of<ProfileController>(context,listen: false).getMyMOCID_WISE_QUESTION_LIST_GETProvider(
        context, "4");
    // TODO: implement initState
    super.initState();
  }
  int count=2;
  @override
  Widget build(BuildContext context) {
    final data= Provider.of<ProfileController>(context).MOCID_WISE_QUESTION_LIST_GET;

    return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
          Navigator.pop(context);
          //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have to finish or submit")));
        }, title: "Model Test")),
        body : RefreshIndicator(
          onRefresh:() {
            setState(() {
              if(count==5){
                count=1;
              }else
              count++;
            });
            return Future.delayed(Duration(seconds: 1),() {
              Provider.of<ProfileController>(context,listen: false).getMyMOCID_WISE_QUESTION_LIST_GETProvider(
                  context, "$count");
            },);
          },
          child:
          "${data}"=="null"?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/Gif/carmoving.gif",height: 100,width: 100,),
                CustomText(text: "Loading...", fontSize: 22, fontWeight: FontWeight.w700,fontStyle:FontStyle.italic ,)
              ],
            ),
          )

              :"${data}"=="[]"?
          Center(child: CustomText(text: "Data not found..",fontSize: 18,fontWeight: FontWeight.w500,)):

          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: customBackground()
            ),
            child: ListView.builder(
               itemCount: data.length,
              //   itemCount: 5,
              itemBuilder: (context, index) {
                double question_textfont_size=15.0;
                double question_title_textfont_size=16.0;
                return Card(
                  elevation: 2,
                  child: Stack(
                    children: [
                      Container(
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
                            CustomText(text: "Q$index} . ${data[index]["question_description"]??""}", fontSize: question_title_textfont_size, fontWeight: FontWeight.w400),
                            Divider(),
                            Container(
                                width: double.infinity,
                                child: CustomText(text:"A . ${data[index]["option_1"]??""}", fontSize: question_textfont_size, fontWeight: FontWeight.w400 ,  text_color: "${data[index]["answer_list"]??""}"=="1"  ? Colors.green:"${data[index]["answer_list"]??""}"=="1" && "${data[index]["answer_selected"]??""}"==1?Colors.green:"${data[index]["answer_selected"]??""}"=="1"?Colors.red: Colors.black,)),
                            SizedBox(height: 7,),
                            Container(
                                width: double.infinity,
                                child: CustomText(text: "B . ${data[index]["option_2"]??""}", fontSize:question_textfont_size, fontWeight: FontWeight.w400 , text_color: "${data[index]["answer_list"]??""}"=="2" ? Colors.green:"${data[index]["answer_list"]??""}"=="2" && "${data[index]["answer_selected"]??""}"==2?Colors.green:"${data[index]["answer_selected"]??""}"=="2"?Colors.red: Colors.black,)),
                            SizedBox(height: 7,),
                            Container(
                                width: double.infinity,
                                child: CustomText(text: "C . ${data[index]["option_3"]??""}",fontSize: question_textfont_size, fontWeight: FontWeight.w400 , text_color: "${data[index]["answer_list"]??""}"=="3"  ? Colors.green: "${data[index]["answer_list"]??""}"=="3" && "${data[index]["answer_selected"]??""}"==3?Colors.green:"${data[index]["answer_selected"]??""}"=="3"?Colors.red: Colors.black,)),
                            SizedBox(height: 7,),
                            Container(
                                width: double.infinity,
                                child: CustomText(text: "D . ${data[index]["option_4"]??""}",fontSize: question_textfont_size,   fontWeight: FontWeight.w400 , text_color: "${data[index]["answer_list"]??""}"=="4" ? Colors.green: "${data[index]["answer_list"]??""}"=="4" && "${data[index]["answer_selected"]??""}"==4?Colors.green:"${data[index]["answer_selected"]??""}"=="4"?Colors.red: Colors.black,)),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                          bottom: 10,
                          child: Container(
                        height: 27,
                        width: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: customBackground()),
                            alignment: Alignment.center,
                            child: CustomText(text:
                            "${data[index]["answer_list"]??""}"=="1" ?
                            "A"
                                :
                            "${data[index]["answer_list"]??""}"=="2" ?
                            "B"
                                :
                            "${data[index]["answer_list"]??""}"=="3" ?
                            "C"
                                :
                            "${data[index]["answer_list"]??""}"=="4" ?
                            "D"  :
                            "${data[index]["answer_list"]??""}"  ,





                              fontSize: 16, fontWeight: FontWeight.w600,),
                      ))
                    ],
                  ),
                );
              },),
          ),
        )
    );
  }
}
