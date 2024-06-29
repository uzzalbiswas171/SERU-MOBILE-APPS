import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seru_test_project/CustomWidget/CustomBootomBar/SplashBootomBar/splash_bootom_bar.dart';
import 'package:seru_test_project/CustomWidget/CustomTextFromField/custom_text_from_fild.dart';

import '../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../custom_const.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _b_name_controller=TextEditingController();
  TextEditingController _email_controller=TextEditingController();
  TextEditingController _primary_phone_controller=TextEditingController();
  TextEditingController _contact_number_controller=TextEditingController();
  TextEditingController _fbpage_controller=TextEditingController();
  TextEditingController _pickup_controller=TextEditingController();
  TextEditingController _payment_info_controller=TextEditingController();
  TextEditingController _password_controller=TextEditingController();
  TextEditingController _change_password_controller=TextEditingController();
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Main_Theme_textColor_tir_Condition.withOpacity(0.7),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Main_Theme_textColor_tir_Condition.withOpacity(0.2),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40,left: 15),
                      alignment: Alignment.centerLeft,
                      child: CustomText(text: "Profile", fontSize: 28, fontWeight: FontWeight.w600, ),
                    )   ,
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 56,
                        backgroundImage: NetworkImage("https://media.licdn.com/dms/image/D4E03AQE75diCZ3zYhA/profile-displayphoto-shrink_800_800/0/1715787558634?e=1724889600&v=beta&t=FRpgbPUzUtC2G5_vOF4e2SFUxhmHVTHrhPUSpKysS4w"),
                      ),
                    ),
                    CustomText(text: "Uzzal Biswas", fontSize: 35, fontWeight: FontWeight.w600, ),
                    CustomText(text: "ID:  112211", fontSize: 20, fontWeight: FontWeight.w400, )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.95,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(44),
                        topRight: Radius.circular(44)
                    ),
                    color: Colors.white
                ),
                padding: EdgeInsets.only(
                    left: 20,right: 20,top: 15
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 38,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: CustomText(text: "Business Name", fontSize: 15, fontWeight: FontWeight.w700, )),
                            Expanded(
                              flex: 3,
                              child: CustomTExtFromField(controller: _b_name_controller, hintText: "hintText", text: "text", fontSize: 15, fontWeight: FontWeight.w700, text_color: Colors.red
                                  , suffixIcon: Icon(Icons.abc), obscureText: false),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 38,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: CustomText(text: "Email", fontSize: 15, fontWeight: FontWeight.w700, )),
                            Expanded(
                              flex: 3,
                              child: CustomTExtFromField(controller: _b_name_controller, hintText: "hintText", text: "text", fontSize: 15, fontWeight: FontWeight.w700, text_color: Colors.red
                                  , suffixIcon: Icon(Icons.abc), obscureText: false),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 38,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: CustomText(text: "Primary phone", fontSize: 15, fontWeight: FontWeight.w700,  )),
                            Expanded(
                              flex: 3,
                              child: CustomTExtFromField(controller: _b_name_controller, hintText: "hintText", text: "text", fontSize: 15, fontWeight: FontWeight.w700, text_color: Colors.red
                                  , suffixIcon: Icon(Icons.abc), obscureText: false),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 38,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: CustomText(text: "Contact Number", fontSize: 15, fontWeight: FontWeight.w700, )),
                            Expanded(
                              flex: 3,
                              child: CustomTExtFromField(controller: _b_name_controller, hintText: "hintText", text: "text", fontSize: 15, fontWeight: FontWeight.w700, text_color: Colors.red
                                  , suffixIcon: Icon(Icons.abc), obscureText: false),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 38,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: CustomText(text: "FB Page/Website", fontSize: 15, fontWeight: FontWeight.w700, )),
                            Expanded(
                              flex: 3,
                              child: CustomTExtFromField(controller: _b_name_controller, hintText: "hintText", text: "text", fontSize: 15, fontWeight: FontWeight.w700, text_color: Colors.red
                                  , suffixIcon: Icon(Icons.abc), obscureText: false),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 86,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: CustomText(text: "Pick Up Address", fontSize: 15, fontWeight: FontWeight.w700, )),
                                Expanded(
                                  flex: 3,
                                  child: CustomTExtFromField(controller: _b_name_controller, hintText: "hintText", text: "text", fontSize: 15, fontWeight: FontWeight.w700, text_color: Colors.red
                                      , suffixIcon: Icon(Icons.abc), obscureText: false),
                                )
                              ],
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: Image(image: AssetImage("assets/edit-document 1.png"),fit: BoxFit.fill,height: 20,width: 20,),

                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 38,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: CustomText(text: "Payment Information", fontSize: 15, fontWeight: FontWeight.w700, )),
                                Expanded(
                                  flex: 3,
                                  child: CustomTExtFromField(controller: _b_name_controller, hintText: "hintText", text: "text", fontSize: 15, fontWeight: FontWeight.w700, text_color: Colors.red
                                      , suffixIcon: Icon(Icons.abc), obscureText: false),
                                )
                              ],
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: Image(image: AssetImage("assets/edit-document 1.png"),fit: BoxFit.fill,height: 20,width: 20,),

                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 38,
                        width: double.infinity,
                        child: Row(     children: [
                          Expanded(
                              flex: 2,
                              child: CustomText(text: "Confirm Password", fontSize: 15, fontWeight: FontWeight.w700,  )),
                          Expanded(
                            flex: 3,
                            child: CustomTExtFromField(controller: _b_name_controller, hintText: "hintText", text: "text", fontSize: 15, fontWeight: FontWeight.w700, text_color: Colors.red
                                , suffixIcon: Icon(Icons.abc), obscureText: false),
                          )
                        ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 38,
                        width: double.infinity,
                        child: Row(     children: [
                          Expanded(
                              flex: 2,
                              child: CustomText(text: "Confirm Password", fontSize: 15, fontWeight: FontWeight.w700,  )),
                          Expanded(
                            flex: 3,
                            child: CustomTExtFromField(controller: _b_name_controller, hintText: "hintText", text: "text", fontSize: 15, fontWeight: FontWeight.w700, text_color: Colors.red
                                , suffixIcon: Icon(Icons.abc), obscureText: false),
                          )
                        ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      is_clicked_register==true?CircularProgressIndicator(

                      ):  CustomButton(onTap: () {

                        if(_formkey.currentState!.validate()){

                          if(_password_controller.text.length>7){
                            if(_password_controller.text==_password_controller.text){
                              // marchentProfileUpdate();
                              setState(() {
                                is_clicked_register=true;
                              });
                            }else{
                              Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                title:  "Password did not matched",
                                message:  "Try again ...",
                                duration:  Duration(seconds: 1),
                              )..show(context);
                            }

                          }else{
                            Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              title:  "Password must be 8 diigit",
                              message:  "Try again ...",
                              duration:  Duration(seconds: 1),
                            )..show(context);
                          }

                        }else{
                          Flushbar(
                            flushbarPosition: FlushbarPosition.TOP,
                            title:  "Please fill all the field",
                            message:  "Try again ...",
                            duration:  Duration(seconds: 1),
                          )..show(context);
                        }

                      }, text: "Submit", button_text_fontSize: 18, button_height: 55),
                      Container(height: 140,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  bool is_clicked=false;
  bool is_clicked_register=false;
}
