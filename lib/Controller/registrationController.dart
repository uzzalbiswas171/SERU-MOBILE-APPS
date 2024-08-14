import 'package:flutter/material.dart';

import '../CustomHttpClass/custom_http_class.dart';

class RegistrationController with ChangeNotifier{


  ///   Get All registration data ///
  dynamic registrationdata;
  getRegistrationInfoProvider(
      String name,
      String surname,
      String email,
      String password,
      String address,
      String currentworking,
      String qualification,
      String qualification_other,
      String phone_id,
      BuildContext context
      )async{
    registrationdata= await CustomHttp().registrationCustomHttpRequest(
        name,
        surname,
        email,
        password,
        address,
        currentworking,
        qualification,
        qualification_other,
        phone_id,
        context
    );
    notifyListeners();
  }



}