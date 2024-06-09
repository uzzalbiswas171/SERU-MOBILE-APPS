import 'package:flutter/material.dart';

import '../../CustomWidget/CustomAppbar/custom_appbar.dart';

class RegistrationForBuyScreen extends StatefulWidget {
  const RegistrationForBuyScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationForBuyScreen> createState() => _RegistrationForBuyScreenState();
}

class _RegistrationForBuyScreenState extends State<RegistrationForBuyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize:Size.fromHeight(75), child: CustomAppbar()),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
      ),
    );
  }
}
