import 'package:seru_test_project/constraints/service_endpoint.dart';
import 'package:seru_test_project/data/api_request.dart';

class RegistrationService {
  Future<dynamic> submitRegistration(String userName, String password) async {
    Map<String, String> body = {
      "name": "mahbub",
      "surname": "alam",
      "email": "mahbubu@gmail.com",
      "password": "123456",
      "password_confirmation": "123456",
      "address": "mirpur",
      "currentworking": "sdcsdc",
      "currentworking_other": "sefs",
      "qualification": "ssc",
      "qualification_other": "inter",
      "phone_id": "1234"
    };

    var response;

    try {
      response =
      await ApiRequest.postVerification(ServiceEndPoint.REGISTRATION_ENDPOINT, body);

      if (response != 401) {
        // LoginModel tokenModel = tokenModelFromJson(response);
        //  UserSecret.setToken(tokenModel);
        //  UserSecret.setAgentInfo(tokenModel);
        //  UserSecret.setUsername(userName);
        //  return tokenModel;
      } else {
        return response;
      }
    } catch (e) {
      return response;
    }
  }}