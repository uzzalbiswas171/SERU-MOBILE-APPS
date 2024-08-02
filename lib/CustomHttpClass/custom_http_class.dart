


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../Routes/routes.dart';

class CustomHttp{

 /// Custom Header  --------------------------------------------------
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
 //   'Authorization': 'Bearer ${GetStorage().read("Api_token")}'
  };



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

  ///  All_MyMARK_RESULT_LIST_GET list get-------------------------------
  List getAllMy_MARKRESULTList=[];
  get_AllMy_MARK_RESULT_function(BuildContext context )async{
    String url="${BASEURL}${MARKRESULT}?api_token=${GetStorage().read("Api_token")}";
    try{
      Response response=await http.get(Uri.parse(url), headers: headers);
      final data=jsonDecode(response.body);
      getAllMy_MARKRESULTList=data["data"];

    }catch(e){
      print("getAllMy_MARKRESULTList catch error > $e");
    }
    return getAllMy_MARKRESULTList;
  }

  ///  All_MyMARK_RESULT_LIST_GET list History  get-------------------------------
  List getAllMy_MARKRESULT_HistoryList=[];
  get_AllMy_MARK_RESULT_HISTORY_function(BuildContext context,String question_set)async{
    String url="${BASEURL}${MARKRESULT_HISTORY}/${question_set}?api_token=${GetStorage().read("Api_token")}";
    try{
      Response response=await http.get(Uri.parse(url), headers: headers);
      final data=jsonDecode(response.body);
      getAllMy_MARKRESULT_HistoryList=data["data"];

    }catch(e){
      print("getAllMy_MARKRESULT_HistoryList catch error > $e");
    }
    return getAllMy_MARKRESULT_HistoryList;
  }

}