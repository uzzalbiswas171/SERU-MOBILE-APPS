import 'package:seru_test_project/model/login_model.dart';
import 'package:seru_test_project/utils/seru_log_print.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String TOKEN_KEY = "authToken";
const String REFRESH_TOKEN_KEY = "refreshToken";
const String NUMBER_KEY = "NUMBER";
const String KYC_ID_KEY = "kycID";

class UserSecret {
  UserSecret();

  static bool isFirstTime = true;
  static String secrectValue = "";
  static String otpValue = "";
  static String ?deviceID;

  var topUpLables = [
    'Prepaid',
    'Postpaid',
  ];

  var checkStatusLables = [
    'Single',
    'Multuiple',
  ];




  static String? appVersion;
  static String? releaseVersion;
  static String? pos;
  static String? platform;
  static String? deviceName;
  static String? pushID;

  static String? otp;
  static String? otpType;
  static String? requestId;
  static int? buildNumber;
  static String? webTokenId;
  static bool mobileNumberRequired = true;
  static bool emailAddressRequired = true;
  static bool userPasswordRequired = true;
  static bool userDateOfBirthRequired = true;
  static bool isName = true;
  static bool isDob = true;
  static bool isNid = true;
  static bool isEmail = true;

  static String? token;

  static List<String>? banners;
  static LoginModel? masterToken;

  static String? storeId;
  static String? storePassword;
  static String? ipnUrl;

  saveUserName(val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_name", val);
  }

  saveWhatsNewVersion(val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("version", val);
  }

  Future<String> getSavedVersion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("version")!;
  }

  savePrivacyPolicy(val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("user_privacy_policy", val);
  }

  Future<bool> getsavePrivacyPolicy() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("user_privacy_policy") ?? false;
  }

  clearSavedUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user_name");
  }

  Future<String> getSavedUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_name")!;
  }

  static setToken(val) {
    token = val;
    seruLogPrint(token);
  }

  static String? getToken() {
    return token;
  }

  static setMasterToken(val) {
    masterToken = val;
  }

  //static UserInfoModel? userInfo;
  static LoginModel? agentInfo;

  // static setUserInfo(val) {
  //   userInfo = val;
  // }

  static  setAgentInfo(val){
    agentInfo = val;
  }

  static LoginModel? getAgentInfo(){
    return agentInfo;
  }

  //static ClientInfoModel? clientInfo;

  // static setClientInfo(val) {
  //   clientInfo = val;
  // }

  static String? username;

  static setUsername(val) {
    username = val;
  }



  clearData() {

    masterToken = null;
    token = null;
    otp = null;
    username = null;
    banners = null;

  }


  logoutAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove(TOKEN_KEY);
  }

  setAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN_KEY, token);
  }

  Future<String> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.get(TOKEN_KEY)
    as String); // channged from prefs.get(TOKEN_KEY) ?? "" during null safety migration

    return token;
  }

  setRefreshToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(REFRESH_TOKEN_KEY, token);
  }

  Future<String> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.get(REFRESH_TOKEN_KEY)
    as String); // channged from prefs.get(REFRESH_TOKEN_KEY) ?? "" during null safety migration

    return token;
  }

  setPhoneNumber(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(NUMBER_KEY, number);
  }

  Future<String> getPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String number = (prefs.get(NUMBER_KEY)
    as String); // changed from prefs.get(NUMBER_KEY) ?? "" during null safety migration

    return number;
  }


}
