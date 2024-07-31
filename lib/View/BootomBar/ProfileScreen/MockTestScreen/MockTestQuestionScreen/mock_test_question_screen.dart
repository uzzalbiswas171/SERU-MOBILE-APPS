

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';

import '../../../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../../custom_const.dart'; 

class MockTestQuestionScreen extends StatefulWidget {
  const MockTestQuestionScreen({super.key});

  @override
  State<MockTestQuestionScreen> createState() => _MockTestQuestionScreenState();
}

class _MockTestQuestionScreenState extends State<MockTestQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final moctest= Provider.of<ProfileController>(context).MOCID_WISE_QUESTION_LIST_GET;

    print("mmmmmmmmmmmmmmmmmmmmmmmmmmm------->${moctest}");


    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
        Navigator.pop(context);
      }, title: "Mock Test")),
      body: Consumer<ProfileController>(
        builder: (context, value, child)   => Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount:value.MOCID_WISE_QUESTION_LIST_GET==null?0: value.MOCID_WISE_QUESTION_LIST_GET.length,
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
                      CustomText(text: "${value.MOCID_WISE_QUESTION_LIST_GET[index]["question_description"]}", fontSize: 15, fontWeight: FontWeight.w500),
                      SizedBox(height: 7,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      is_check=!is_check;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 16,
                                        width: 16,

                                        decoration: BoxDecoration(
                                          //   color: Main_Theme_blac,
                                            border: Border.all(color:Main_Theme_blac.withOpacity(0.4) ),
                                            image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":"assets/Icons/check 1.png"),fit: BoxFit.fill)
                                        ),
                                      ),
                                      const  SizedBox(width: 10,),
                                      Expanded(child: CustomText(text: "A for apple",fontSize:15 ,fontWeight: FontWeight.w400,))
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      is_check=!is_check;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 16,
                                        width: 16,

                                        decoration: BoxDecoration(
                                            border: Border.all(color:Main_Theme_blac.withOpacity(0.4) ),

                                            image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":"assets/Icons/check 1.png"),fit: BoxFit.fill)
                                        ),
                                      ),
                                      const  SizedBox(width: 10,),
                                      Expanded(child: CustomText(text: "B for Ball",fontSize:15 ,fontWeight: FontWeight.w400,))
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 7,),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      is_check=!is_check;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 16,
                                        width: 16,

                                        decoration: BoxDecoration(
                                            border: Border.all(color:Main_Theme_blac.withOpacity(0.4) ),

                                            image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":"assets/Icons/check 1.png"),fit: BoxFit.fill)
                                        ),
                                      ),
                                      const  SizedBox(width: 10,),
                                      Expanded(child: CustomText(text: "C for cat",fontSize:15 ,fontWeight: FontWeight.w400,))
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      is_check=!is_check;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 16,
                                        width: 16,

                                        decoration: BoxDecoration(
                                            border: Border.all(color:Main_Theme_blac.withOpacity(0.4) ),
                                            image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":"assets/Icons/check 1.png"),fit: BoxFit.fill)
                                        ),
                                      ),
                                      const  SizedBox(width: 10,),
                                      Expanded(child: CustomText(text: "D for dog",fontSize:15 ,fontWeight: FontWeight.w400,))
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),),
        ),
      ),
      bottomNavigationBar: CustomButton(onTap: () {

      }, text: "Submit Answer", button_text_fontSize: 16, button_height: 60),

    );
  }
  bool is_check=false;
}
