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
  MockTestQuestionScreen(
      {super.key, required this.moc_test_no, required this.randomNumber});

  String moc_test_no;
  var randomNumber;

  @override
  State<MockTestQuestionScreen> createState() => _MockTestQuestionScreenState();
}

class _MockTestQuestionScreenState extends State<MockTestQuestionScreen> {
  List<int?> selectedIndexes = [];

  @override
  void initState() {
    super.initState();
    // Don't initialize `selectedIndexes` here, do it when data is available in the build method.
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the data from the provider
    final data = Provider.of<ProfileController>(context).MOCID_WISE_QUESTION_LIST_GET;

    // Ensure data is not null or empty before initializing `selectedIndexes`
    if (data != null && selectedIndexes.isEmpty) {
      selectedIndexes = List<int?>.filled(data.length, null);  // Initialize with null values
    }

    return SafeArea(
      child: Scaffold(
        // appBar: PreferredSize(
        //     preferredSize: Size.fromHeight(75),
        //     child: CustomIndividualAppbar(
        //         onPress: () {
        //           Navigator.pop(context);
        //         },
        //         title: "Mock test no - ${widget.moc_test_no}")),
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
                return Card(
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
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        Divider(height: 5),
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
                            child: CustomText(
                              text: "A . ${data[index]["option_1"] ?? ""}",
                              text_color: selectedIndexes[index] == 1
                                  ? Colors.green
                                  : Colors.black87,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
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
                            child: CustomText(
                              text: "B . ${data[index]["option_2"] ?? ""}",
                              text_color: selectedIndexes[index] == 2
                                  ? Colors.green
                                  : Colors.black87,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
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
                            child: CustomText(
                              text: "C . ${data[index]["option_3"] ?? ""}",
                              text_color: selectedIndexes[index] == 3
                                  ? Colors.green
                                  : Colors.black87,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
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
                            child: CustomText(
                              text: "D . ${data[index]["option_4"] ?? ""}",
                              text_color: selectedIndexes[index] == 4
                                  ? Colors.green
                                  : Colors.black87,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
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
      ),
    );
  }
}

