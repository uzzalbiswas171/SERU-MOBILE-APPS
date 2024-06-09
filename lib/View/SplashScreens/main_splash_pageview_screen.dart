import 'package:flutter/material.dart';
import 'package:seru_test_project/View/SplashScreens/splash_screen1.dart';
import 'package:seru_test_project/View/SplashScreens/splash_screen2.dart';
import 'package:seru_test_project/View/SplashScreens/splash_screen3.dart';

class MainSplashPageViewScreen extends StatefulWidget {
  const MainSplashPageViewScreen({super.key});

  @override
  State<MainSplashPageViewScreen> createState() => _MainSplashPageViewScreenState();
}

class _MainSplashPageViewScreenState extends State<MainSplashPageViewScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage:0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children:[
          SplashScreen1(),
          SplashScreen2(),
          SplashScreen3(),
        ],
      ),
    );
  }
}
