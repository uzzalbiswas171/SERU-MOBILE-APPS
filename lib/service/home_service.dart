// import 'dart:convert';
//
// import 'package:seru_test_project/constraints/service_endpoint.dart';
// import 'package:seru_test_project/data/api_request.dart';
// import 'package:seru_test_project/model/package_all_model.dart';
// import 'package:seru_test_project/utils/seru_log_print.dart';
//
// class HomeService {
//   Future<PackageAllModel> getPackageAllData() async {
//     var response;
//
//     try {
//       response = await ApiRequest.get(ServiceEndPoint.packageAll);
//
//       seruLogPrint(response);
//       PackageAllModel packageAllResponse = PackageAllModel.fromJson(response);
//
//       seruLogPrint(packageAllResponse);
//
//       return packageAllResponse;
//     } catch (e) {
//       return response;
//     }
//   }
// }

import 'dart:convert';

import 'package:seru_test_project/constraints/service_endpoint.dart';
import 'package:seru_test_project/data/api_request.dart';
import 'package:seru_test_project/model/package_all_model.dart';
import 'package:seru_test_project/utils/seru_log_print.dart';

class HomeService {
  Future<PackageAllModel> getPackageAllData() async {
    var response;

    try {
      response = await ApiRequest.get(ServiceEndPoint.packageAll);

      seruLogPrint(response);

      // Ensure response is decoded if it's a JSON string
      var jsonResponse = json.decode(response);
      PackageAllModel packageAllResponse = PackageAllModel.fromJson(jsonResponse);

      seruLogPrint(packageAllResponse);

      return packageAllResponse;
    } catch (e) {
      seruLogPrint('Error: $e');

      // Option 1: Throw an exception
      throw Exception('Failed to load package data');

      // Option 2: Return a default or empty PackageAllModel object
      // return PackageAllModel(data: []);
    }
  }
}

