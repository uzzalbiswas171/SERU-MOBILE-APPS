import 'package:flutter/material.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';

import '../../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../custom_const.dart';

class MockTestScreen extends StatefulWidget {
  const MockTestScreen({super.key});

  @override
  State<MockTestScreen> createState() => _MockTestScreenState();
}

class _MockTestScreenState extends State<MockTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
        Navigator.pop(context);
      }, title: "Mock Test")),
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
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    color: question_color
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "i am uzzal Biswas .From Sadhuhali Lorem Ipsam", fontSize: 15, fontWeight: FontWeight.w500),
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
                                          image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":""),fit: BoxFit.fill)
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

                                          image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":""),fit: BoxFit.fill)
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

                                          image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":""),fit: BoxFit.fill)
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
                                          image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":""),fit: BoxFit.fill)
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
      bottomNavigationBar: CustomButton(onTap: () {

      }, text: "Submit Answer", button_text_fontSize: 16, button_height: 60),

    );
  }
  bool is_check=false;
}
