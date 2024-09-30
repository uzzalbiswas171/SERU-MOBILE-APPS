
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import '../../Controller/homeController.dart';
import '../../CustomWidget/CustomAppbar/custom_appbar.dart';
import '../../custom_const.dart';
import '../Auth/Login/screens/login_screen.dart';
import 'HomeScreen/home_screen.dart';
import 'PackageScreen/package_screen.dart';
import 'ProfileScreen/prfile_screen.dart';

class BttotomBarScreen extends StatefulWidget {
  BttotomBarScreen({super.key,required this.index});
  int index;
  @override
  State<BttotomBarScreen> createState() => _BttotomBarScreenState();
}

class _BttotomBarScreenState extends State<BttotomBarScreen> {


  int maxCount = 3;
  bool is_get_profie=false;
  dynamic getDynamicSliderData;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  /// Controller to handle PageView and also handles initial page
  var _pageController = PageController(initialPage:0);

  /// Controller to handle bottom nav bar and also handles initial page
  var _controller = NotchBottomBarController(index:1);
  @override
  void initState() { /// Controller to handle PageView and also handles initial page
    Provider.of<HomeController>(context,listen: false).getAllPackageProvider(context);
    _pageController = PageController(initialPage:widget.index);

    /// Controller to handle bottom nav bar and also handles initial page
    _controller = NotchBottomBarController(index: int.parse("${widget.index}"));
    // TODO: implement initState
    super.initState();
  }

  /// widget list
  final List<Widget> bottomBarPages = [

    HomeScreen( ),
    PackageScreen(),
    "${GetStorage().read("Api_token")}"=="" || "${GetStorage().read("Api_token")}"=="null"?  LoginScreen() : ProfileScreen( ),



  ];
  final _scaffoldkey=GlobalKey<ScaffoldState>();

  int Select_index=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    key: _scaffoldkey,
    body: WillPopScope(
      onWillPop: () => Future(() => false),
      child: bottomBarPages[Select_index],
    ),
    extendBody: true,
    bottomNavigationBar: Container( 
     height: 60,
     width: double.infinity,
     decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(11),
        topRight: Radius.circular(11)
      ),
   //   gradient: customBackground()
     color: Main_Theme_white
     ),
     child: BottomNavigationBar( 
      backgroundColor:BootomBarColor.withOpacity(0.6),
        currentIndex: Select_index,
        selectedItemColor: Main_Theme_white,
        unselectedItemColor: Colors.purple,
        selectedLabelStyle: TextStyle(
          fontSize: 15
        ),
        onTap: (index) {
          setState(() {
            Select_index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', 
          ),
       
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Package',
          ),
             BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    )
     
    );
  }
}