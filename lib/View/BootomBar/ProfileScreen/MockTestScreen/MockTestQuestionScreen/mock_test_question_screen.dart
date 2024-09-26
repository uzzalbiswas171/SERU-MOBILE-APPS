

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';

import '../../../../../Controller/answerSubmitController.dart';
import '../../../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../custom_const.dart'; 

class MockTestQuestionScreen extends StatefulWidget {
  MockTestQuestionScreen({super.key,required this.moc_test_no,required this.randomNumber});
  String moc_test_no;
  var randomNumber;
  @override
  State<MockTestQuestionScreen> createState() => _MockTestQuestionScreenState();
}

class _MockTestQuestionScreenState extends State<MockTestQuestionScreen> {
  int _selectedIndex=-1;
  String _selectedIndex2="";
  String option="";
  final List<int> selectedIndexes = [];
  final List<String> selectedIndexesString = [];
  @override
  Widget build(BuildContext context) {
    print("rrrrrrrrrrrrrrrrrrrrrrrrrrrr =========> ${widget.randomNumber}");
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
          child: ListView.builder(
              itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child:data==null?Center(child: CircularProgressIndicator(backgroundColor: Colors.red,),):
                Container(
                  // margin: EdgeInsets.only(bottom: 7),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    // color:   selectedIndexes.contains(index)
                    //       ? redColor.withOpacity(0.2)
                    //       : Color(0xffF4F4F6) ,
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
                      InkWell(
                          onTap: () {
                            setState(() {



                              ///------------------------------------------------------------------


                                  selectedIndexes.add(index);

                              ///------------------------------------------------------------------
                              _selectedIndex=index;
                              _selectedIndex2="${data[index]["mocktest_question_id"]}";
                                  selectedIndexesString.add(data[index]["option_1"]);
                              option="1";
                              Provider.of<AnswerSubmitController>(context,listen: false).AnswerSubmitProvider(
                                  context,
                                  "${data[index]["mocktest_id"]}",
                                  "${data[index]["mocktest_question_id"]}",
                                  "1",
                                 "${widget.randomNumber}"
                              );
                            });
                          },
                          child: CustomText(text:"A . ${data[index]["option_1"]??""}", text_color:  selectedIndexes.contains(index) && option=="1"? Colors.green:Colors.black87,fontSize: 11, fontWeight: FontWeight.w400 ,)),



                      SizedBox(height: 7,),
                      InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndexes.add(index);
                              selectedIndexesString.add(data[index]["option_2"]);////
                              _selectedIndex=index;
                              _selectedIndex2="${data[index]["mocktest_question_id"]}";
                              option="2";
                              Provider.of<AnswerSubmitController>(context,listen: false).AnswerSubmitProvider(
                                  context,
                                  "${data[index]["mocktest_id"]}",
                                  "${data[index]["mocktest_question_id"]}",
                                  "2",
                                  "${widget.randomNumber}"
                              );
                            });
                          },
                          child: CustomText(text: "B . ${data[index]["option_2"]??""}",text_color: selectedIndexes.contains(index)&&  option=="2"? Colors.green:Colors.black87, fontSize: 11, fontWeight: FontWeight.w400)),
                      SizedBox(height: 7,),
                      InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndexes.add(index);
                              selectedIndexesString.add(data[index]["option_3"]);
                              _selectedIndex=index;
                              _selectedIndex2="${data[index]["mocktest_question_id"]}";
                              option="3";
                              Provider.of<AnswerSubmitController>(context,listen: false).AnswerSubmitProvider(
                                  context,
                                  "${data[index]["mocktest_id"]}",
                                  "${data[index]["mocktest_question_id"]}",
                                  "3",
                                  "${widget.randomNumber}"
                              );
                            });
                          },
                          child: CustomText(text: "C . ${data[index]["option_3"]??""}",text_color: selectedIndexes.contains(index)&&  option=="3"? Colors.green:Colors.black87, fontSize: 11, fontWeight: FontWeight.w400 ,)),
                      SizedBox(height: 7,),
                      InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndexes.add(index);
                              selectedIndexesString.add(data[index]["option_4"]);
                              _selectedIndex=index;
                              _selectedIndex2="${data[index]["mocktest_question_id"]}";
                              option="4";
                              Provider.of<AnswerSubmitController>(context,listen: false).AnswerSubmitProvider(
                                  context,
                                  "${data[index]["mocktest_id"]}",
                                  "${data[index]["mocktest_question_id"]}",
                                  "4",
                                  "${widget.randomNumber}"
                              );
                            });
                          },
                          child: CustomText(text: "D . ${data[index]["option_4"]??""}",text_color: selectedIndexes.contains(index)&&  option=="4"? Colors.green:Colors.black87, fontSize:11,   fontWeight: FontWeight.w400 )),

                    ],
                  ),
                ),
              );
            },),
        ),
      ),
      bottomNavigationBar: CustomButton(onTap: () {
        Navigator.pop(context);
        ElegantNotification(
          borderRadius: BorderRadius.circular(11),
          width: 380,
          iconSize: 25,
          background: Colors.lightGreenAccent,
          progressIndicatorBackground: Colors.lightGreenAccent,
          progressIndicatorColor: Colors.red,
          // position: Alignment.center,
          title: Text("Answer Submit successfull"),
          description:const Text("Please checl your result on your profile"),
          onDismiss: () {
            print('Message when the notification is dismissed');
          }, icon: Icon(Icons.info_outlined,color:Colors.black,),
        ).show(context);
      }, text: "Submit Answer", button_text_fontSize: 16, button_height: 60),
    );
  }
  bool is_check=false;
}

