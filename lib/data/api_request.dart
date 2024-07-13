import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:seru_test_project/CustomWidget/seru_alert_dialogue.dart';
import 'package:seru_test_project/constraints/build_context.dart';
import 'package:seru_test_project/constraints/service_endpoint.dart';
import 'package:seru_test_project/utils/seru_log_print.dart';
import 'package:seru_test_project/utils/user_secret.dart';

class ApiRequest{
String accessToken =UserSecret.token!;
  //------------------------- Get ----------------------------------//
  static Future get(url,{accessToken}) async {
    String? baseUrl;
    baseUrl = ServiceEndPoint.BASE_PATH;
    Map<String, String> headers = {};
    seruLogPrint("Getting Headers $headers");
    seruLogPrint(url);
   // headers = await getHeaders();
    seruLogPrint("Headers Done :> $headers");


    try {
      Uri uri;

      uri = Uri.parse(baseUrl + url);

      seruLogPrint(uri);

      var response = await http.get(
        uri,
        headers: headers,
      );

   //   if (response.statusCode == 401) {
        // var res = await getAccessToken(request);
        //
        // if (res != null) {
        //   agbLogPrint("res ok");
        //   return _response(res);
        // } else {
        //   agbLogPrint("Response Null  ->############");
        //   return null;
        // }
    //  }

      seruLogPrint("_____+++++++++_______ ResStatus: ${response.statusCode}");
      seruLogPrint('--------->$response');
      return _response(response);
    } on SocketException {
      seruLogPrint("Socket Exception");

      return;
    } catch (e) {
      seruLogPrint(e);
      return;
    }
  }

//------------------------Get------------------------------------------

  //------------------------post verification----------------------------------------

  static Future<dynamic> postVerification(url, body) async {

    String? baseUrl;
    baseUrl = ServiceEndPoint.BASE_PATH;

    try {
      seruLogPrint("###########################SERVER Hiting.....");

      var uri = Uri.parse(baseUrl + url);


      var response = await http.post(uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body),
          encoding: Encoding.getByName("utf-8"));

      seruLogPrint("status code: ${response.statusCode}");
      seruLogPrint("response: ${response}");

      return _response(response);
    } on SocketException {
      Navigator.of(SeruContext.context!).pop(false);



      return;
    }

  }

  //-------------------------post verification-----------------------------------------


  //-----------------------Getting headers -----------------
  // static getHeaders({bool isNew = false}) async {
  //   String device = "";
  //   String deviceID = "";
  //   seruLogPrint("Header ...");
  //   dynamic release;
  //   if (Platform.isAndroid && (UserSecret.deviceID == null || isNew)) {
  //     seruLogPrint("GET ANDROID DEVICE DATA ");
  //
  //     device = "ANDROID";
  //
  //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //     release = await deviceInfo.androidInfo.then((value) {
  //       return value.version.release;
  //     });
  //     UserSecret.releaseVersion = release.toString();
  //     UserSecret.platform = device;
  //     deviceID = await deviceInfo.androidInfo.then((value) {
  //       return value.id;
  //     });
  //     UserSecret.deviceID = deviceID;
  //
  //     var sdkInt = await deviceInfo.androidInfo.then((value) {
  //       return value.version.sdkInt;
  //     });
  //     var manufacturer = await deviceInfo.androidInfo.then((value) {
  //       return value.manufacturer;
  //     });
  //     var model = await deviceInfo.androidInfo.then((value) {
  //       return value.model;
  //     });
  //
  //     UserSecret.deviceName = model;
  //
  //     agbLogPrint('Android $release (SDK $sdkInt), $manufacturer $model');
  //   }
  //
  //   if (Platform.isIOS && (UserSecret.deviceID == null || isNew)) {
  //     agbLogPrint("GET IOS DEVICE DATA ");
  //     device = "IOS";
  //     UserSecret.platform = device;
  //
  //     var iosInfo = await DeviceInfoPlugin().iosInfo;
  //     var systemName = iosInfo.systemName;
  //     var version = iosInfo.systemVersion;
  //
  //     var name = iosInfo.name;
  //     release = iosInfo.utsname.release;
  //     var model = iosInfo.model;
  //     deviceID = iosInfo.identifierForVendor!;
  //     UserSecret.releaseVersion = release.toString();
  //     UserSecret.platform = device;
  //     UserSecret.deviceID = deviceID;
  //
  //     UserSecret.deviceName = model;
  //
  //     agbLogPrint('$systemName $version, $name $model $release');
  //   }
  //
  //   agbLogPrint("END OF DEVICE INFO");
  //
  //   Map<String, String> headers = {
  //     "content-type": "application/json",
  //     "apisecret": CommonConstants.API_SECRET,
  //     "requestchannel": UserSecret.platform.toString(),
  //     "terminal": "${UserSecret.deviceID}",
  //     "client_id": CommonConstants.KC_CLIENT_ID,
  //     "client_secret": CommonConstants.KC_CLIENT_SECRET!,
  //     "browser": "Application version ${UserSecret.appVersion}",
  //     "operatingSystem":
  //     "${UserSecret.platform} ${UserSecret.releaseVersion.toString()}",
  //   };
  //
  //   agbLogPrint(headers.toString());
  //
  //   if (UserSecret.token != null) {
  //     if (UserSecret.token!.accessToken != null) {
  //       headers.addAll({
  //         'Authorization': "Bearer ${UserSecret.token!.accessToken}",
  //       });
  //     }
  //   }
  //
  //   if (UserSecret.otp != null) {
  //     headers.addAll({
  //       "otp": UserSecret.otp == null ? "" : UserSecret.otp!,
  //       "otpType": UserSecret.otpType!,
  //       "requestId": UserSecret.requestId!,
  //     });
  //
  //     UserSecret.otp = null;
  //   }
  //
  //   return headers;
  // }

  //-----------------------getting headers -----------------



  //---------------------------- Response ------------------------------------//
  static dynamic _response(var response) async {
    seruLogPrint(response);

    seruLogPrint("REs-COde-> ${response.statusCode}");


    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);

        seruLogPrint("Decoded REsponse >$responseJson");

        return responseJson;

      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        seruLogPrint("Decoded REsponse >$responseJson");

        return responseJson;

      case 202:
        seruLogPrint("Res-202>");
        var responseJson = utf8.decode(response.bodyBytes).toString();
        seruLogPrint("Res_202: $responseJson");

        return responseJson;

      case 204:
        var responseJson = utf8.decode(response.bodyBytes).toString();
        seruLogPrint(responseJson);

        return "OK";
      case 400:
        Navigator.of(SeruContext.context!).pop(false);
        seruAlertDialog("400!\n" +
            "Undefined Error");
        return null;
      case 401:
        seruLogPrint(response.body.toString());
        Navigator.of(SeruContext.context!).pop(false);


       // UserSecret.token = null;

      case 403:
        Navigator.of(SeruContext.context!).pop(false);

      case 404:
        Navigator.of(SeruContext.context!).pop(false);
        seruAlertDialog("404!\n" +
            "Server not found");
        return null;


      case 405:
        var responseJson = utf8.decode(response.bodyBytes);
        seruLogPrint("Decoded REsponse >$responseJson");

        return responseJson;

      case 500:
        seruLogPrint("Error-Code:500+${response.body.toString()}");

        Navigator.of(SeruContext.context!).pop(false);
        seruAlertDialog("500!\n" +
            "Internal Server Error");


      case 496:
        var responseJson = utf8.decode(response.bodyBytes);
        seruLogPrint("Decoded REsponse >$responseJson");

        return responseJson;

      case 497:
        var responseJson = utf8.decode(response.bodyBytes);
        seruLogPrint("Decoded REsponse >$responseJson");

        return responseJson;
      case 498:

        seruLogPrint("KYC_Status:>>>>>> ${response.headers}");

        return "FAIL";
      case 499:
        var responseJson = utf8.decode(response.bodyBytes);
        seruLogPrint("Decoded REsponse >$responseJson");
        seruLogPrint("KYC_Status:>>>>>> ${response.headers}");


        if (responseJson != "") {
          return responseJson;
        }

        return "OTP";
      case 979:
        var responseJson = utf8.decode(response.bodyBytes).toString();
        seruLogPrint(responseJson);

        String status = responseJson.replaceAll('"', "");

        return status;
      default:

        var responseJson = utf8.decode(response.bodyBytes);
        seruLogPrint("Decoded REsponse >$responseJson");

        return responseJson;
    }
  }

}