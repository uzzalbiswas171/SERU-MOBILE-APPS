import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seru_test_project/View/Auth/Login/bloc/login_bloc.dart';
import 'package:seru_test_project/View/Auth/Login/bloc/login_event.dart';
import 'package:seru_test_project/View/Auth/Login/bloc/login_state.dart';
import 'package:seru_test_project/View/Auth/RegisterScreen/register_screem.dart';
import 'package:seru_test_project/View/BootomBar/HomeScreen/home_screen.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/bloc/profile_bloc.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/bloc/profile_event.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/prfile_screen.dart';
import 'package:seru_test_project/custom_const.dart';
import 'package:seru_test_project/utils/seru_log_print.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../CustomWidget/CustomTextFromField/custom_text_from_fild.dart';
import '../../../BootomBar/bootombar.dart';
import '../utils/text_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is UserAuthenticated) {
          seruLogPrint(state.loginData.toJson());
          // BlocProvider.of<ProfileBloc>(context).add(FetchProfile());

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BttotomBarScreen(index: 2,)),
          );
        }
      },
      child: _buildLoginForm(context),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: BootomBarColor,
        ),
        padding: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h * 0.28,
                width: h * 0.30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Icons/onride.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 15),
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
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color(0xff000000),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomTExtFromField(
                        controller: _emailController,
                        hintText: "Enter Email",
                        text: "Email",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        text_color: main_text_blac_color.withOpacity(0.8),
                        suffixIcon: Icon(
                          Icons.email,
                          color: main_text_blac_color.withOpacity(0.6),
                        ),
                        obscureText: false,
                      ),
                      SizedBox(height: 15),
                      CustomTExtFromField(
                        controller: _passwordController,
                        hintText: "Enter Password",
                        text: "Password",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        text_color: main_text_blac_color.withOpacity(0.8),
                        obscureText: is_show_pass,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              is_show_pass = !is_show_pass;
                            });
                          },
                          icon: Icon(
                            is_show_pass ? Icons.visibility_off : Icons.visibility,
                            color: main_text_blac_color.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            is_check = !is_check;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: BootomBarColor,
                                image: DecorationImage(
                                  image: AssetImage(is_check
                                      ? "assets/Icons/check 1.png"
                                      : ""),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomText(
                                text: "Remember Me,",
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomButton(
                        onTap: () {
                          onLogin(context);
                        },
                        text: is_clicked_login_button
                            ? "Login Processing"
                            : "Sign In",
                        button_text_fontSize: 22,
                        button_height: 45,
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Don’t have an account?",
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              CustomText(
                                text: "Sign up here",
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
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
  bool is_clicked_login_button = false;

  onLogin(BuildContext context) async {
    String email = 'mahbubu@gmail.com';
    String password = '123456';
    BlocProvider.of<LoginBloc>(context).add(LoginSubmitEvent(email: email, password: password));
  }
}