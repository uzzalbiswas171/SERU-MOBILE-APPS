import 'package:flutter/material.dart';

import '../CustomHttpClass/custom_http_class.dart';

class ProfileController with ChangeNotifier{


  ///   Get All package ///
  dynamic getProfile;
  getProfileProvider(
      BuildContext context,
      )async{
    getProfile= await CustomHttp().getProfileFunction(context);
    notifyListeners();
  }


  ///   Mock Test ///
  dynamic MockTest;
  getMockTestProvider(
      BuildContext context,
      )async{
    MockTest= await CustomHttp().getAllMockTestFunction(context);
    notifyListeners();
  }


  ///   Mock Test ///
  dynamic MySubscription;
  getMySubscriptionProvider(
      BuildContext context,
      )async{
    MySubscription= await CustomHttp().getAllMySubscriptionFunction(context);
    notifyListeners();
  }



}