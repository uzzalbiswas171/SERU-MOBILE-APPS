

import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/registrationController.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';
import 'package:seru_test_project/CustomWidget/CustomTextFromField/custom_text_from_fild.dart';
import 'package:seru_test_project/View/Auth/Login/screens/login_screen.dart';

import '../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../custom_const.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _psswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController name =TextEditingController();
  TextEditingController surname =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
  TextEditingController cpassword =TextEditingController();
  TextEditingController address =TextEditingController();
  TextEditingController currentworking =TextEditingController();
  TextEditingController qualification =TextEditingController();
  TextEditingController qualification_other =TextEditingController();
  String? _deviceId;
  @override
  void initState() {
    deviceInfo();
    // TODO: implement initState
    super.initState();
  }
  deviceInfo()async{

    if(Platform.isAndroid){
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      _deviceId = androidInfo.id;
      print('Running on ${androidInfo.id}');
    }

    if(Platform.isIOS){
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      _deviceId = iosInfo.model;
      print('Running on ${iosInfo.utsname.machine}');
    }

  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
           gradient: customBackground(),
          // image: DecorationImage(image: AssetImage("assets/SeruTestBanner/seru_banner.jpg"),fit: BoxFit.fill),
        ),
        padding: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 50,right: 50,bottom: 30,top: 30),
                height: h*0.20,
                width: h*0.19,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Icons/onride.png"),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: main_text_white_color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(44),
                    topRight: Radius.circular(44),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome To ${Login_text}",
                        style: GoogleFonts.roboto(
                            //  Text("Welcome To Ocado Courier",style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xff000000)),
                      ),
                      SizedBox(
                        height: 20,
                      ), 
                      CustomTExtFromField(controller: name, hintText: "Enter Name", text: "NAme", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTExtFromField(controller: email, hintText: "Enter Email", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.email,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTExtFromField(controller: password, hintText: "Enter Password", text: "passwod", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), obscureText: is_show_pass, suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            is_show_pass=!is_show_pass;
                          });
                        },
                        icon:Icon(is_show_pass==true?Icons.visibility_off:Icons.visibility,color:  main_text_blac_color.withOpacity(0.6),),color: main_text_blac_color.withOpacity(0.6),)),

                      SizedBox(
                        height: 15,
                      ),
                      CustomTExtFromField(controller: cpassword, hintText: "Enter Password", text: "passwod", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), obscureText: is_show_pass, suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            is_show_pass=!is_show_pass;
                          });
                        },
                        icon:Icon(is_show_pass==true?Icons.visibility_off:Icons.visibility,color:  main_text_blac_color.withOpacity(0.6),),color: main_text_blac_color.withOpacity(0.6),)),

                      SizedBox(
                        height: 40,
                      ),


                      CustomButton(
                          onTap: () {
                            if(password.text==cpassword.text){
                              Provider.of<RegistrationController>(context,listen: false).getRegistrationInfoProvider(
                                  "${name.text}",
                                  "${surname.text}",
                                  "${email.text}",
                                  "${password.text}",
                                  "${address.text}",
                                  "${currentworking.text}",
                                  "${qualification.text}",
                                  "${qualification_other.text}",
                                  _deviceId!,
                                  context
                              );
                          }else{
                              quickAlertWrong(context, "Warning", "Password doesn't match", 2);
                            }



                          },
                          text: is_clicked_loginbutton == true
                              ? "Login Processing"
                              : "Register",
                          button_text_fontSize: 22,
                          button_height: 45),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: "have an account?",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  },
                                  child: CustomText(
                                    text: " Login in here",
                                    fontSize: 15,
                                    text_color: redColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool is_check = true;
  bool is_show_pass = true;
  bool is_clicked_loginbutton = false;
}
