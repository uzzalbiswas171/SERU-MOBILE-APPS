import 'package:flutter/material.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        alignment: Alignment.center,
        child: CustomText(text: "Subscription", fontSize: 33, fontWeight: FontWeight.bold),
      ),
    );
  }
}
