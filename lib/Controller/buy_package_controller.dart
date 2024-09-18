import 'package:flutter/material.dart';

import '../CustomHttpClass/custom_http_class.dart';

class BuyPackageController with ChangeNotifier{

  ///   Get All package ///
  dynamic buyPackageWithoutVouche;
  buyPackageWithoutVoucherProvider(
      BuildContext context,
      int package_id,
      int subscription_structure_id,
      String voucher_gift,
      String friend_relative_email,
      String name,
      String surname,
      String address,
      String address_2,
      String city,
      String country,
      String postal_code,
      String personal_email,
      String date_for_physical,
      )async{
    buyPackageWithoutVouche= await CustomHttp().buyPackageWithoutVoucherHttpFunction(
        context, package_id, subscription_structure_id, voucher_gift, friend_relative_email, name, surname, address, address_2, city, country, postal_code, personal_email, date_for_physical
    );
    notifyListeners();
  }
}