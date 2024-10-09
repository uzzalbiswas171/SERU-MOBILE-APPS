

import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
  


/// Custom Logo Lin
//const Seru_Test_logo = "assets/SeruTestLogo/serulogo.jpg";
const Seru_Test_logo = "assets/SeruTestLogo/appstore.png";

/// Base Url Need  for Show Image
 String BaseUrl="https://sitibd.com";
  String Login_text="Seru test";
 String Splash1_text="PCO Driver \nFind your all solutions in here...";
 String Splash2_text="TFL SERU online training Platform is online based self-learning training platform for PHV drivers.Based on TFL's new announcement to introduce the SERU assessment to demonstrate and understanding of safety, equality, and regulatory matters for new and renewal applicants.We believe a huge number of private hire driver's may find difficulties and worry about the new test.";
 String Splash3_text="We believe a huge number of private hire driver's may find difficulties and worry about the new test.";

const BootomBarColor=Color(0xff07DD6A);
const Selected_question_color=Color(0xff11ac11);
// const BootomBarColor=Color(0xffee5124);
 const main_text_blac_color=Color(0xff333333);
 const main_text_white_color=Color(0xffffffff);
const redColor=Color(0xffEA4C62);
 const bootomNavigationbarBackgrountcolor=Color(0xff24a5de);
//const bootomNavigationbarBackgrountcolor=Color(0xff90EE90);
///Text form color boarder
// const textFieldBoarderColorC=Color(0xff7ab4f8);
const textFieldBoarderColorC=bootomNavigationbarBackgrountcolor;
const appbarcollor =BootomBarColor;
const appBackgroundcolor = BootomBarColor;
const defaultBackgroundColor = Color(0xffe5e3df);

const icons_orrange_color =bootomNavigationbarBackgrountcolor;
const icons_green_color = bootomNavigationbarBackgrountcolor;
//const Main_Theme_Color = Color(0xffACC027);
const Main_Theme_Color = bootomNavigationbarBackgrountcolor;
//const Main_Theme_Color = Color(0xfff3f8ea);
  const Main_Theme_blac = main_text_blac_color;
  const Main_Theme_textColor =main_text_blac_color;
  const question_color =main_text_white_color;
  const Main_Theme_white =main_text_white_color;


  //GetStorage().read("Api_token")


LinearGradient customBackground() {
  return LinearGradient(
    colors: [
      Colors.teal, BootomBarColor,],
  );
}

final List<Color> listColors = [
  Colors.yellow[200]!,
  Colors.lightGreen[200]!,
  Colors.orange[200]!,
  Colors.pink[200]!,
  Colors.blue[200]!,
  Colors.purple[200]!,
  Colors.teal[200]!,
  Colors.cyan[200]!,
];

/// Quick Alert ---------------------------------------------------------- ///
quickAlertWrong(BuildContext context,String title,String text,int second,) async {
  QuickAlert.show(
      context: context,
      title: '$title',
      text: '$text',
      type: QuickAlertType.warning,
      confirmBtnColor: appbarcollor,
      autoCloseDuration: Duration(seconds: second),
    showConfirmBtn: false,
  );
}
/// Quick Alert ---------------------------------------------------------- ///
quickAlertsuccess(BuildContext context,String title,String text,int second,) async {
  QuickAlert.show(
      context: context,
      title: '$title',
      text: '$text',
      type: QuickAlertType.success,
      confirmBtnColor: appbarcollor,
      autoCloseDuration: Duration(seconds: second),
      showConfirmBtn: false,
  );
}