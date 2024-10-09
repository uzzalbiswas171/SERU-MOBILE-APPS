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
      }, title: "Result")),
    body : RefreshIndicator(
      onRefresh:() {
      return Future.delayed(Duration(seconds: 1),() {

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
      ):"${data}"=="[]"?
      Center(child: CustomText(text: "Data not found..",fontSize: 18,fontWeight: FontWeight.w500,)):

      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: customBackground()
        ),
        padding: EdgeInsets.only(left: 10,right: 10,top: 0),
        child: ListView.builder(
        itemCount: data.length,
          itemBuilder: (context, index) {
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
                  padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Q${index+1} . ${data[index]["question_description"].replaceAll( "\n", " " )??""}", fontSize: 13, fontWeight: FontWeight.w400),
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
