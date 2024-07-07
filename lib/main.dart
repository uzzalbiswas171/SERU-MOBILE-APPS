
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seru_test_project/View/Auth/Login/bloc/login_bloc.dart';
import 'package:seru_test_project/View/BootomBar/HomeScreen/bloc/home_bloc.dart';
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
      //   home:MainSplashPageViewScreen(),

      /// Working route -----------------------
     // home:BttotomBarScreen(index: 0,),
    home:MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => LoginBloc()),
        ],
        child: BttotomBarScreen(index: 0,)),
    );
  }
}
