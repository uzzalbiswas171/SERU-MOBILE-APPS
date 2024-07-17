
import 'package:flutter/material.dart';
import 'View/BootomBar/bootombar.dart';
import 'View/SplashScreens/main_splash_pageview_screen.dart';

import 'package:seru_test_project/View/Auth/Login/bloc/login_bloc.dart';
import 'package:seru_test_project/View/Auth/RegisterScreen/bloc/registration_bloc.dart';
import 'package:seru_test_project/View/BootomBar/HomeScreen/bloc/banner_bloc/banner_bloc.dart';
import 'package:seru_test_project/View/BootomBar/HomeScreen/bloc/home_bloc.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/bloc/profile_bloc.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/prfile_screen.dart';
import 'package:seru_test_project/View/BootomBar/bootombar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      /// Main Route --------------------------
      home:MainSplashPageViewScreen(),

      /// Working route -----------------------
      // home:BttotomBarScreen(index: 0,),

     // home:BttotomBarScreen(index: 0,),
    home:MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => RegistrationBloc()),
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => ProfileBloc()),
          BlocProvider(create: (context) => BannerBloc()),

        ],
        child:
        //ProfileScreen()),
        //RegisterScreen())
        BttotomBarScreen(index: 0,)),
    );
  }
}
