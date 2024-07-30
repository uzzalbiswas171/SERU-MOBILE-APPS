
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'Controller/homeController.dart';
import 'Controller/profile_controller.dart';
import 'View/BootomBar/bootombar.dart';
import 'View/SplashScreens/main_splash_pageview_screen.dart';


// void main() {
//   HttpOverrides.global = MyHttpOverrides();
//   runApp(const MyApp());
// }
//
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main()async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
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
