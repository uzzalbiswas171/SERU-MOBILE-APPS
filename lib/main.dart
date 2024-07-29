
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Controller/homeController.dart';
import 'Controller/profile_controller.dart';
import 'View/BootomBar/bootombar.dart';
import 'View/SplashScreens/main_splash_pageview_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<HomeController>(create: (context) => HomeController(),),
      ChangeNotifierProvider<ProfileController>(create: (context) => ProfileController(),),
    ],
    child: MaterialApp(
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

    ),
    );
  }
}
