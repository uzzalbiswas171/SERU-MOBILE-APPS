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
import 'package:seru_test_project/model/banner_model.dart';
import 'package:seru_test_project/model/package_all_model.dart';
import 'package:seru_test_project/utils/seru_log_print.dart';

class HomeService {
  Future<PackageAllModel> getPackageAllData() async {
    var response;

    try {
      response = await ApiRequest.get(ServiceEndPoint.packageAll);

      seruLogPrint(response);


      var jsonResponse = json.decode(response);
      PackageAllModel packageAllResponse = PackageAllModel.fromJson(jsonResponse);

      seruLogPrint(packageAllResponse);

      return packageAllResponse;
    } catch (e) {
      seruLogPrint('Error: $e');


      throw Exception('Failed to load package data');


    }
  }

  Future<BannerModel> getAllBanner() async {
    var response;

    try {
      response = await ApiRequest.get(ServiceEndPoint.ALL_BANNER_ENDPOINT);

      seruLogPrint(response);


      var jsonResponse = json.decode(response);
      BannerModel allBannerResponse = BannerModel.fromJson(jsonResponse);

      seruLogPrint(allBannerResponse);

      return allBannerResponse;
    } catch (e) {
      seruLogPrint('Error: $e');


      throw Exception('Failed to load package data');


    }
  }

}

