import 'package:flutter/material.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';

class LiveExamScreen extends StatefulWidget {
  const LiveExamScreen({super.key});

  @override
  State<LiveExamScreen> createState() => _LiveExamScreenState();
}

class _LiveExamScreenState extends State<LiveExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
        Navigator.pop(context);
      }, title: "Live Exam")),
    );
  }
}
