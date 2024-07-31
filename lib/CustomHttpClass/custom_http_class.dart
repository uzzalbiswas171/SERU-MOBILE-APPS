


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Routes/routes.dart';

class CustomHttp{

 /// Custom Header  --------------------------------------------------
 //  Map<String, String> headers= <String,String>{
 //    "accept": "application/json",
 //    'Authorization': 'Bearer ${GetStorage().read("Api_token")}'
 //  };
 //


  /// Get All Package-------------------------------
  ///Get All hub list
  List getAllPackageList=[];
  getAllPackageFunction(BuildContext context)async{
    String url="${BASEURL}${GETALLPACKAGRE}";

    try{
      Response response=await http.get(Uri.parse(url), );
      final data=jsonDecode(response.body);
      getAllPackageList=data["data"];

    }catch(e){
      print("getAllPackageFunction catch error-----------------------------------------> $e");
    }
    return getAllPackageList;
  }


  ///Get Profile------------------------------------------------------------------------
  dynamic getProfile;
  getProfileFunction(BuildContext context)async{
    String url="${BASEURL}${PROFILE}?api_token=${GetStorage().read("Api_token")}";

    try{
      Response response=await http.get(Uri.parse(url), );
      final data=jsonDecode(response.body);
      getProfile=data["data"];

    }catch(e){
      print("getProfileFunction catch error-----------------------------------------> $e");
    }
    return getProfile;
  }



  /// Get MOCK TEST-------------------------------
  List getAllMockTestList=[];
  getAllMockTestFunction(BuildContext context)async{
    String url="${BASEURL}${MOCKTEST}?api_token=${GetStorage().read("Api_token")}";
    try{
      Response response=await http.get(Uri.parse(url), );
      final data=jsonDecode(response.body);
      getAllMockTestList=data["data"];

    }catch(e){
      print("getAllMockTestFunction catch error--- > $e");
    }
    return getAllMockTestList;
  }



  /// MY SUBSCRIPTION-------------------------------
  List getAllMySubscriptionList=[];
  getAllMySubscriptionFunction(BuildContext context)async{
    String url="${BASEURL}${MYSUBSCRIPTION}?api_token=${GetStorage().read("Api_token")}";
    try{
      Response response=await http.get(Uri.parse(url), );
      final data=jsonDecode(response.body);
      getAllMySubscriptionList=data["data"];

    }catch(e){
      print("getAllMySubscriptionList catch error > $e");
    }
    return getAllMySubscriptionList;
  }

  ///   Mock id wise moc test question list get-------------------------------
  List getAllMyMOCID_WISE_QUESTION_LIST_GET=[];
  getAllMyMOCID_WISE_QUESTION_LIST_GETFunction(BuildContext context, String id)async{
    String url="${BASEURL}${MOCID_WISE_QUESTION_LIST_GET}$id?api_token=${GetStorage().read("Api_token")}";
    try{
      Response response=await http.get(Uri.parse(url), );
      final data=jsonDecode(response.body);
      getAllMyMOCID_WISE_QUESTION_LIST_GET=data["data"];

    }catch(e){
      print("getAllMyMOCID_WISE_QUESTION_LIST_GET catch error > $e");
    }
    return getAllMyMOCID_WISE_QUESTION_LIST_GET;
  }

}