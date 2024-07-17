import 'dart:convert';

import 'package:seru_test_project/constraints/service_endpoint.dart';
import 'package:seru_test_project/data/api_request.dart';
import 'package:seru_test_project/model/login_model.dart';
import 'package:seru_test_project/utils/seru_log_print.dart';
import 'package:seru_test_project/utils/user_secret.dart';

class Authentication {
  Future<dynamic> auth(String userName, String password) async {
    Map<String, String> body =
        // {
        //   "username": userName,
        //   "password": password,
        //   "phone_id": "1234"
        // }
        {
      "email": "mahbubu@gmail.com",
      "password": "123456",
      "phone_id": "1234"
    };

    var response;

    try {
      response = await ApiRequest.postVerification(
          ServiceEndPoint.LOGIN_ENDPOINT, body);

      if (response != 401) {
        // LoginModel tokenModel = tokenModelFromJson(response);
        //  UserSecret.setToken(tokenModel);
        //  UserSecret.setAgentInfo(tokenModel);
        //  UserSecret.setUsername(userName);
        //  return tokenModel;
        var jsonResponse = json.decode(response);
        LoginModel loginResponse = LoginModel.fromJson(jsonResponse);

        var apiToken = loginResponse.data!.apiToken!;
        UserSecret.setToken(apiToken);
        seruLogPrint('aaaaaaaaaa--->$apiToken');
        seruLogPrint('tttttttt--->${UserSecret.token}');
        return loginResponse;
      } else {
        return response;
      }
    } catch (e) {
      return response;
    }
  }
}
