import 'package:flutter/material.dart';

import '../CustomHttpClass/custom_http_class.dart';

class HomeController with ChangeNotifier{


  ///   Get All package ///
  dynamic getAllPackageList;
  getAllPackageProvider(
      BuildContext context,
      )async{
    getAllPackageList= await CustomHttp().getAllPackageFunction(context);
    notifyListeners();
  }



}