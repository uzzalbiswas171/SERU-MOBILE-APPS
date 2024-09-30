import 'dart:async';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import 'package:seru_test_project/CustomWidget/CustomButton/custom_button.dart';

import '../../../../Controller/answerSubmitController.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../custom_const.dart';

class LiveExamScreen extends StatefulWidget {
    LiveExamScreen({super.key,required this.randomNumber});
    var randomNumber;
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
List<int?> selectedIndexes = [];
@override
Widget build(BuildContext context) {
  final data= Provider.of<ProfileController>(context).MOCID_WISE_QUESTION_LIST_GET;

  // Ensure data is not null or empty before initializing `selectedIndexes`
  if (data != null && selectedIndexes.isEmpty) {
    selectedIndexes = List<int?>.filled(data.length, null);  // Initialize with null values
  }

  return Scaffold(
    appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
      // Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have to finish or submit")));
    }, title: "Expire Time ${count}")),
    body: RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          Duration(seconds: 1),
              () {},
        );
      },
      child: data == null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Gif/carmoving.gif",
              height: 100,
              width: 100,
            ),
            CustomText(
              text: "Loading...",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            )
          ],
        ),
      )
          : data.isEmpty
          ? Center(
          child: CustomText(
            text: "Data not found..",
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ))
          : Container(
        decoration: BoxDecoration(
            gradient: customBackground()
        ),
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            double question_textfont_size=15.0;
            double question_title_textfont_size=16.0;
            return Card(
              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: Colors.black.withOpacity(0.5))),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text:
                        "Q${index + 1} . ${Bidi.stripHtmlIfNeeded("${data[index]["question_description"] ?? ""}").replaceAll("\n", " ")} ",
                        fontSize: question_title_textfont_size,
                        fontWeight: FontWeight.w600),
                    Divider(),
                    InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndexes[index] = 1;
                            Provider.of<AnswerSubmitController>(context, listen: false)
                                .AnswerSubmitProvider(
                                context,
                                "${data[index]["mocktest_id"]}",
                                "${data[index]["mocktest_question_id"]}",
                                "1",
                                "${widget.randomNumber}");
                          });
                        },
                        child: Container(
                          padding:selectedIndexes[index] == 1? EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2):EdgeInsets.all(0),
                          width: double.infinity,
                          decoration: selectedIndexes[index] == 1?BoxDecoration(
                              border: Border.all(
                                color: Selected_question_color ,
                              )
                          ):BoxDecoration(),
                          child: CustomText(
                            text: "A . ${data[index]["option_1"] ?? ""}",
                            text_color: selectedIndexes[index] == 1
                                ? Selected_question_color
                                : Colors.black87,
                            fontSize:selectedIndexes[index] == 1?question_textfont_size+1 : question_textfont_size,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(height: 7),
                    InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndexes[index] = 2;
                            Provider.of<AnswerSubmitController>(context, listen: false)
                                .AnswerSubmitProvider(
                                context,
                                "${data[index]["mocktest_id"]}",
                                "${data[index]["mocktest_question_id"]}",
                                "2",
                                "${widget.randomNumber}");
                          });
                        },
                        child: Container(
                          padding:selectedIndexes[index] == 2? EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2):EdgeInsets.all(0),
                          width: double.infinity,
                          decoration: selectedIndexes[index] == 2?BoxDecoration(
                              border: Border.all(
                                color: Selected_question_color  ,
                              )
                          ):BoxDecoration(),
                          child: CustomText(
                            text: "B . ${data[index]["option_2"] ?? ""}",
                            text_color: selectedIndexes[index] == 2
                                ? Selected_question_color
                                : Colors.black87,
                            fontSize:selectedIndexes[index] == 2?question_textfont_size+1 : question_textfont_size,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(height: 7),
                    InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndexes[index] = 3;
                            Provider.of<AnswerSubmitController>(context, listen: false)
                                .AnswerSubmitProvider(
                                context,
                                "${data[index]["mocktest_id"]}",
                                "${data[index]["mocktest_question_id"]}",
                                "3",
                                "${widget.randomNumber}");
                          });
                        },
                        child: Container(
                          padding:selectedIndexes[index] == 3? EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2):EdgeInsets.all(0),
                          width: double.infinity,
                          decoration: selectedIndexes[index] == 3?BoxDecoration(
                              border: Border.all(
                                color: Selected_question_color  ,
                              )
                          ):BoxDecoration(),
                          child: CustomText(
                            text: "C . ${data[index]["option_3"] ?? ""}",
                            text_color: selectedIndexes[index] == 3
                                ?Selected_question_color
                                : Colors.black87,
                            fontSize:selectedIndexes[index] == 3?question_textfont_size+1 : question_textfont_size,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(height: 7),
                    InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndexes[index] = 4;
                            Provider.of<AnswerSubmitController>(context, listen: false)
                                .AnswerSubmitProvider(
                                context,
                                "${data[index]["mocktest_id"]}",
                                "${data[index]["mocktest_question_id"]}",
                                "4",
                                "${widget.randomNumber}");
                          });
                        },
                        child: Container(
                          padding:selectedIndexes[index] == 4? EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2):EdgeInsets.all(0),
                          width: double.infinity,
                          decoration: selectedIndexes[index] == 4?BoxDecoration(
                              border: Border.all(
                                color: Selected_question_color  ,
                              )
                          ):BoxDecoration(),
                          child: CustomText(
                            text: "D . ${data[index]["option_4"] ?? ""}",
                            text_color: selectedIndexes[index] == 4
                                ? Selected_question_color
                                : Colors.black87,
                            fontSize:selectedIndexes[index] == 4?question_textfont_size+1 : question_textfont_size,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),

    bottomNavigationBar: Card(
      elevation: 9,
      child: CustomButton(
          onTap: () {
            Navigator.pop(context);
            ElegantNotification(
              borderRadius: BorderRadius.circular(11),
              width: 380,
              iconSize: 25,
              background: Colors.lightGreenAccent,
              progressIndicatorBackground: Colors.lightGreenAccent,
              progressIndicatorColor: Colors.red,
              title: Text("Answer Submit successfull"),
              description:
              const Text("Please check your result on your profile"),
              onDismiss: () {
                print('Message when the notification is dismissed');
              },
              icon: Icon(
                Icons.info_outlined,
                color: Colors.black,
              ),
            ).show(context);
          },
          text: "Submit Answer",
          button_text_fontSize: 16,
          button_height: 60),
    ),
  );
}
}
