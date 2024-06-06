import 'package:flutter/material.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(centerTitle: true,title: CustomText(text: "Home", fontSize: 18, fontWeight: FontWeight.w500),),
    );
  }
}
