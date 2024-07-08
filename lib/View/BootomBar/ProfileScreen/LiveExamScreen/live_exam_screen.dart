import 'dart:async';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import 'package:seru_test_project/CustomWidget/CustomButton/custom_button.dart';

import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../custom_const.dart';

class LiveExamScreen extends StatefulWidget {
  const LiveExamScreen({super.key});

  @override
  State<LiveExamScreen> createState() => _LiveExamScreenState();
}

class _LiveExamScreenState extends State<LiveExamScreen> {
int count=10;
void itmer(){
  Timer.periodic(const Duration(seconds: 1), (timer) {
    print("timeeeee  eee   e eee ${timer.tick}");
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
          print('Message when the notification is dismissed');
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
          print('Message when the notification is dismissed');
        }, icon: Icon(Icons.info_outlined,color:Colors.black,),
      ).show(context);
    }else{
      setState(() {
        count--;
      });
    }
  });
}
@override
void initState() {
  itmer();
  // TODO: implement initState
  super.initState();
}


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
        // Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have to finish or submit")));
      }, title: "Expire Time ${count}")),
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
        Navigator.pop(context);
      }, text: "Submit Answer", button_text_fontSize: 16, button_height: 60),

    );
  }
  bool is_check=false;
}
