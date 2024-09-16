import 'dart:convert';
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/CustomWidget/CustomBootomBar/SplashBootomBar/splash_bootom_bar.dart';
import 'package:seru_test_project/CustomWidget/CustomTextFromField/custom_text_from_fild.dart';
import 'package:seru_test_project/View/Auth/Login/screens/login_screen.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/MockTestScreen/mock_test_screen.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/SubsCriptionScreen/subscription_screen.dart';

import '../../../Controller/profile_controller.dart';
import '../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../custom_const.dart';
import 'ExamResultScreen/exam_result_screen.dart';
import 'LiveExamScreen/live_exam_screen.dart';
import 'ModelTestScreen/model_test_screen.dart';
import 'VideoClassScreen/VideoListScreen/video_list_screen.dart';
import 'VideoClassScreen/video_class_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Provider.of<ProfileController>(context,listen: false).getProfileProvider(context) ;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final getProfile=Provider.of<ProfileController>(context).getProfile;
  //  print("prrrrrrrrrrrrrrrrrrrrrrr $getProfile}");
    return Scaffold(
      body: Container(
        color: Main_Theme_Color.withOpacity(0.7),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Main_Theme_Color.withOpacity(0.2),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 40,left: 15),
                          alignment: Alignment.centerLeft,
                          child: CustomText(text: "Profile", fontSize: 28, fontWeight: FontWeight.w600, ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 15,
                            top: 35
                          ),
                          child: InkWell(
                            onTap: () {
                              GetStorage().erase();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              alignment: Alignment.center,
                              child: CustomText(text: "Logout", fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    )   ,
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 56,
                        backgroundImage: NetworkImage("https://media.licdn.com/dms/image/D4E03AQE75diCZ3zYhA/profile-displayphoto-shrink_800_800/0/1715787558634?e=1724889600&v=beta&t=FRpgbPUzUtC2G5_vOF4e2SFUxhmHVTHrhPUSpKysS4w"),
                      ),
                    ),
                    CustomText(text:getProfile==null?"Name : ...":getProfile["name"] ==""?"Name : ":"${getProfile["name"]}", fontSize: 35, fontWeight: FontWeight.w600, ),
                    CustomText(text: getProfile==null?"Email :... ":getProfile["email"] ==""?"Email : ":"${getProfile["email"]}", fontSize: 20, fontWeight: FontWeight.w400, )
                  ],
                ),
              ),
              Container(
           height: 310,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(44)),
                color: Colors.white
            ),
            padding: EdgeInsets.only(
                left: 20,right: 20,top: 32
            ),

            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 100),
            alignment: Alignment.center,
            child:GridView.builder(
              itemCount: profileaccess.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if(index==0){
                      Provider.of<ProfileController>(context,listen: false).getMySubscriptionProvider(context) ;
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => SubscriptionScreen(),));
                    }
                    else if(index==1){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => VideoListScreen(),));
                    }
                    else if(index==2){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ModelTestScreen(),));
                    }
                    else if(index==3){
                      Provider.of<ProfileController>(context,listen: false).getMockTestProvider(context) ;
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => MockTestScreen(),));
                    }
                    else if(index==4){
                    showDialog(context: context, builder: (context) => AlertDialog(
                      actions: [
                        ActionChip(onPressed: () {
                          Navigator.pop(context);
                        },label: Text("No",style: TextStyle(color: Colors.black),)),

                        ActionChip(onPressed: () {
                          var rng = new Random();
                          var code = rng.nextInt(900000) + 100000;
                          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LiveExamScreen(
                            randomdata: code,
                          ),));

                        },label: Text("Yes",style: TextStyle(color: Colors.black),)),

                      ],
                      title: Text("Are you ready for live exam"),),);
                    }else{
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => ExamResultScreen(),));
                    }
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Main_Theme_Color,
                    ),
                    alignment: Alignment.center,
                    child: CustomText(text: "${profileaccess[index]}",
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                );
              },) ,
          )

            ],
          ),
        ),
      ),
    );
  }

  List profileaccess=[
    "Subscription",
    "Video Class",
    "Model Test",
    "Mock Test",
    "Live Exam",
    "Exam Result",

  ];

  bool is_clicked=false;
  bool is_clicked_register=false;
}








