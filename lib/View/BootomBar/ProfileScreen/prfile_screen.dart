import 'dart:collection';
import 'dart:convert'; 
import 'dart:math';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_appbar.dart';
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
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    print("dddddddddddddddddddddddddddddddddd  $h");
    return Scaffold(
  appBar: PreferredSize(preferredSize:Size.fromHeight(70), child: CustomAppbar()),
      body: Container(
        width: double.infinity,
        color: Main_Theme_white,
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height:h<700?140: 188,
                         decoration: BoxDecoration(
                           gradient: customBackground(),
                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
                         ),
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ Container(
                            alignment: Alignment.centerLeft,
                            child: CustomText(text: "Profile", fontSize:h<700?22: 28, fontWeight: FontWeight.w600, ),
                          ),

                            CircleAvatar(
                              radius: h<700?30:50,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                radius: h<700?35:45,
                                backgroundImage: NetworkImage("https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8"),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Positioned(
                          bottom: h<700?50:60,
                          right: 10,
                          child:   Container(
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
                                height:h<700?30: 40,
                                width:h<700?80:  100,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                alignment: Alignment.center,
                                child: CustomText(text: "Logout", fontSize:h<700?14:  18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                Spacer()
              ],
            ),

            Positioned(
              top:h<700?110: 150,
              child:    Container(
                height: 604,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        elevation: 9,
                        color: Main_Theme_white,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                  
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( "Name", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600,letterSpacing: 2),),
                              CustomText(text:getProfile==null?"":getProfile["name"] ==""?"Name : ":"${getProfile["name"]}", fontSize: 20, fontWeight: FontWeight.w500, ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        elevation: 9,
                        color: Main_Theme_white,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                  
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( "Email", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600,letterSpacing: 2),),
                              CustomText(text:getProfile==null?"Email :... ":getProfile["email"] ==""?"Email : ":"${getProfile["email"]}", fontSize: 20, fontWeight: FontWeight.w500, ),
                            ],
                          ),
                        ),
                      ),
                  
                      SizedBox(height: h>700?25:10,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(44)),
                        ),
                        margin: EdgeInsets.only(left: 10,right: 10),
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
                            return Card(
                              elevation: 9,
                              child: InkWell(
                                onTap: () {
                                  if(index==0){
                                    Provider.of<ProfileController>(context,listen: false).getMySubscriptionProvider(context) ;
                                    Navigator.push(context, CupertinoPageRoute(builder: (context) => SubscriptionScreen(),));
                                  }
                                  else if(index==1){
                                    Navigator.push(context, CupertinoPageRoute(builder: (context) => VideoClassScreen(),));
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
                                            randomNumber: code,
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
                                    gradient: customBackground(),
                                  ),
                                  alignment: Alignment.center,
                                  child: CustomText(text: "${profileaccess[index]}",
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },) ,
                      ),
                    ],
                  ),
                ),
              ),
            )

          ],
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








