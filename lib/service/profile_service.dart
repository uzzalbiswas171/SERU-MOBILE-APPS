
import 'dart:convert';

import 'package:seru_test_project/constraints/service_endpoint.dart';
import 'package:seru_test_project/data/api_request.dart';
import 'package:seru_test_project/model/package_all_model.dart';
import 'package:seru_test_project/model/profile_model.dart';
import 'package:seru_test_project/utils/seru_log_print.dart';

class ProfileService {
  Future<ProfileModel> getProfileData() async {
    var response;

    try {
      response = await ApiRequest.get(ServiceEndPoint.Profile_ENDPOINT);

      seruLogPrint(response);


      var jsonResponse = json.decode(response);
      ProfileModel profileResponse = ProfileModel.fromJson(jsonResponse);

      seruLogPrint(profileResponse);

      return profileResponse;
    } catch (e) {
      seruLogPrint('Error: $e');

      throw Exception('Failed to load package data');

    }
  }
}

