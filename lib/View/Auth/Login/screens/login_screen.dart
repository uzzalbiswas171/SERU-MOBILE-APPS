import 'dart:convert';
import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
 import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:seru_test_project/View/Auth/RegisterScreen/register_screem.dart';
import 'package:seru_test_project/custom_const.dart'; 
import '../../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../HomeScreen/home_screen.dart';
import '../utils/text_utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController=TextEditingController();
  final _psswordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  void initState() {
    GetStorage().erase();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(

        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: BootomBarColor,
         // image: DecorationImage(image: AssetImage("assets/SeruTestBanner/seru_banner.jpg"),fit: BoxFit.fill),
        ),
        padding: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h*0.28,
                width: h*0.30,
                decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage("assets/Icons/onride.png"),fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height*0.7,
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
                      Text("Welcome To ${Login_text}",style: GoogleFonts.roboto(
                    //  Text("Welcome To Ocado Courier",style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff000000)
                      ),),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Enter your email address",
                            hintStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xff555556)
                            ),
                            suffixIcon: IconButton(onPressed: () {
                              
                            }, icon: Icon(Icons.email,color: Colors.grey,)),
                            contentPadding: EdgeInsets.only(left: 15),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(
                                Radius.circular(10)))
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        controller: _psswordController,
                        obscureText: is_show_pass,
                        decoration: InputDecoration(
                            hintText: "Type your password",
                            hintStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Color(0xff555556)
                            ),
                            suffixIcon: IconButton(onPressed: () {
                              setState(() {
                                is_show_pass=!is_show_pass;
                              });
                            }, icon: Icon(Icons.lock,color: Colors.grey,)),
                            contentPadding: EdgeInsets.only(left: 15),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(
                                Radius.circular(10)))
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
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
                                  color: BootomBarColor,
                                  image: DecorationImage(image: AssetImage(is_check?"assets/Icons/check 1.png":""),fit: BoxFit.fill)
                              ),
                            ),
                            const  SizedBox(width: 10,),
                            Expanded(child: CustomText(text: "Remember Me,",fontSize:15 ,fontWeight: FontWeight.w400,))
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      CustomButton(onTap: () {

                      }, text: is_clicked_loginbutton==true? "Login Processing" : "Sign In", button_text_fontSize: 22, button_height: 45)
                      ,SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: "Don’t have an account?", fontSize: 15, fontWeight:FontWeight.w400),
                              InkWell(
                                  onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                                  },
                                  child: CustomText(text: "Sign up here", fontSize: 15, fontWeight:FontWeight.w400,))
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
  bool is_check=true;
  bool is_show_pass=true;
  bool is_clicked_loginbutton=false;
}
