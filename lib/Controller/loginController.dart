import 'package:flutter/material.dart';

import '../CustomHttpClass/custom_http_class.dart';

class LoginController with ChangeNotifier{


  ///   Get All package ///
  dynamic logininfo;
  getLoginInfoProvider(
  String email,String pass,String phoneid,BuildContext context
      )async{
    logininfo= await CustomHttp().loginCustomHttpRequest(email, pass, phoneid,context);
    notifyListeners();
  }



}