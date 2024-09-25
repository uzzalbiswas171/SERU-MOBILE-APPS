import 'dart:async';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import 'package:seru_test_project/CustomWidget/CustomButton/custom_button.dart';

import '../../../../Controller/answerSubmitController.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../custom_const.dart';

class LiveExamScreen extends StatefulWidget {
    LiveExamScreen({super.key,required this.randomdata});
    var randomdata;
  @override
  State<LiveExamScreen> createState() => _LiveExamScreenState();
}

class _LiveExamScreenState extends State<LiveExamScreen> {
int count=10;
void itmer(){
  Timer.periodic(const Duration(seconds: 1), (timer) {
  //  print("timeeeee  eee   e eee ${timer.tick}");
    if(timer.tick==10) {
      ElegantNotification(
        borderRadius: BorderRadius.circular(11),
        width: 380,
        iconSize: 25,
        background: Colors.green,
        progressIndicatorBackground: Colors.green,
        progressIndicatorColor: Colors.red,
        // position: Alignment.center,
        title: CustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Answer submitted successfully",  text_color: Colors.white),
        description: CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Please wait for result" , text_color: Colors.white),
        onDismiss: () {
      //    print('Message when the notification is dismissed');
        }, icon: Icon(Icons.info_outlined,color:Colors.black,),
      ).show(context);
      timer.cancel();
      Navigator.pop(context);
      ElegantNotification(
        borderRadius: BorderRadius.circular(11),
        width: 380,
        iconSize: 25,
        background: Colors.green,
        progressIndicatorBackground: Colors.green,
        progressIndicatorColor: Colors.red,
        // position: Alignment.center,
        title: CustomText(fontSize: 16, fontWeight: FontWeight.w500, text: "Answer submitted successfully",  text_color: Colors.white),
        description: CustomText(fontSize: 14, fontWeight: FontWeight.w400, text: "Please wait for result" , text_color: Colors.white),
        onDismiss: () {
        //  print('Message when the notification is dismissed');
        }, icon: Icon(Icons.info_outlined,color:Colors.black,),
      ).show(context);
    }else{
      setState(() {
        count--;
      });
    }
  });
}
void initState() {
  itmer();
  Provider.of<ProfileController>(context,listen: false).getMyMOCID_WISE_QUESTION_LIST_GETProvider(
      context, "4");
  // TODO: implement initState
  super.initState();
}
int countt=2;
int _selectedIndex=-1;
String _selectedIndex2="";
String option="";
@override
Widget build(BuildContext context) {
  final data= Provider.of<ProfileController>(context).MOCID_WISE_QUESTION_LIST_GET;

  return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
        // Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have to finish or submit")));
      }, title: "Expire Time ${count}")),
      body : RefreshIndicator(
        onRefresh:() {
          setState(() {
            if(countt==5){
              countt=1;
            }else
              countt++;
          });
          return Future.delayed(Duration(seconds: 1),() {
            Provider.of<ProfileController>(context,listen: false).getMyMOCID_WISE_QUESTION_LIST_GETProvider(
                context, "$countt");
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

                      CustomText(text: "Q1 . ${data[index]["question_description"]??""}", fontSize: 14, fontWeight: FontWeight.w400),
                      Divider(height: 5,),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex=index;
                              _selectedIndex2="${data[index]["mocktest_question_id"]}";
                              option="1";
                              Provider.of<AnswerSubmitController>(context,listen: false).AnswerSubmitProvider(
                                  context,
                                  "${data[index]["mocktest_id"]}",
                                  "${data[index]["mocktest_question_id"]}",
                                  "1",
                                  "${widget.randomdata}"
                              );
                            });
                          },
                          child: CustomText(text:"A . ${data[index]["option_1"]??""}", text_color: _selectedIndex==index &&  _selectedIndex2=="${data[index]["option_2"]}" && option=="1"? Colors.green:Colors.black87,fontSize: 11, fontWeight: FontWeight.w400 ,)),
                      SizedBox(height: 7,),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex=index;
                              _selectedIndex2="${data[index]["mocktest_question_id"]}";
                              option="2";
                              Provider.of<AnswerSubmitController>(context,listen: false).AnswerSubmitProvider(
                                  context,
                                  "${data[index]["mocktest_id"]}",
                                  "${data[index]["mocktest_question_id"]}",
                                  "2",
                                  "${widget.randomdata}"
                              );
                            });
                          },
                          child: CustomText(text: "B . ${data[index]["option_2"]??""}",text_color: _selectedIndex==index && option=="2"? Colors.green:Colors.black87, fontSize: 11, fontWeight: FontWeight.w400)),
                      SizedBox(height: 7,),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex=index;
                              _selectedIndex2="${data[index]["mocktest_question_id"]}";
                              option="3";
                              Provider.of<AnswerSubmitController>(context,listen: false).AnswerSubmitProvider(
                                  context,
                                  "${data[index]["mocktest_id"]}",
                                  "${data[index]["mocktest_question_id"]}",
                                  "3",
                                  "${widget.randomdata}"
                              );
                            });
                          },
                          child: CustomText(text: "C . ${data[index]["option_3"]??""}",text_color: _selectedIndex==index && option=="3"? Colors.green:Colors.black87, fontSize: 11, fontWeight: FontWeight.w400 ,)),
                      SizedBox(height: 7,),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex=index;
                              _selectedIndex2="${data[index]["mocktest_question_id"]}";
                              option="4";
                              Provider.of<AnswerSubmitController>(context,listen: false).AnswerSubmitProvider(
                                  context,
                                  "${data[index]["mocktest_id"]}",
                                  "${data[index]["mocktest_question_id"]}",
                                  "4",
                                  "${widget.randomdata}"
                              );
                            });
                          },
                          child: CustomText(text: "D . ${data[index]["option_4"]??""}",text_color: _selectedIndex==index && option=="4"? Colors.green:Colors.black87, fontSize:11,   fontWeight: FontWeight.w400 )),
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
