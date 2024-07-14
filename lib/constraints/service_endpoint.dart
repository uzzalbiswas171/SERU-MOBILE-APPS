import 'package:seru_test_project/utils/user_secret.dart';

class ServiceEndPoint {


  static const String BASE_PATH = "https://tflserutest.co.uk/api";

  static const String packageAll = "/packages";
  static const String ALL_BANNER_ENDPOINT = "/banners";
  static const String LOGIN_ENDPOINT = "/login";
  static const String REGISTRATION_ENDPOINT = "/register";
  //static const String Profile_ENDPOINT = "/profile?api_token=${UserSecret.getToken()}";
  static String get Profile_ENDPOINT {
   return "/protected/profile?api_token=${UserSecret.getToken()}";
  }


}