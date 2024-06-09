
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seru_test_project/View/PacageScreen/pacge_screen.dart';

import '../../custom_const.dart';
import '../HomeScreen/home_screen.dart';

class BttotomBarScreen extends StatefulWidget {
  BttotomBarScreen({super.key,required this.index});
  int index;
  @override
  State<BttotomBarScreen> createState() => _BttotomBarScreenState();
}

class _BttotomBarScreenState extends State<BttotomBarScreen> {


  int maxCount = 5;
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
    _pageController = PageController(initialPage:widget.index);

    /// Controller to handle bottom nav bar and also handles initial page
    _controller = NotchBottomBarController(index: int.parse("${widget.index}"));
    // TODO: implement initState
    super.initState();
  }

  /// widget list
  final List<Widget> bottomBarPages = [

    HomeScreen( ),
    PacageScreen(),
    HomeScreen( ),



  ];
  final _scaffoldkey=GlobalKey<ScaffoldState>();

  int Select_index=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    key: _scaffoldkey,
    body: PageView(
    controller: _pageController,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(
    bottomBarPages.length, (index) => bottomBarPages[index]),
    ),
    extendBody: true,
    bottomNavigationBar: (bottomBarPages.length <= maxCount)
    ? AnimatedNotchBottomBar(
    /// Provide NotchBottomBarController
    notchBottomBarController: _controller,
    color: BootomBarColor,
    //    color: Color(0xFFCBCBCB),
    showLabel: false,
    shadowElevation:9,
    kBottomRadius: 28.0,
    notchColor: BootomBarColor,
    /// restart app if you change removeMargins
    removeMargins: false,
    bottomBarWidth: 500,
    showShadow: false,
    durationInMilliSeconds: 300,
    elevation: 1,
    bottomBarItems: const [
    BottomBarItem(
    inActiveItem: Icon(
    Icons.home,
    color: Colors.white,
    size: 25,
    ),
    activeItem: Icon(
    Icons.home,
    color: main_text_white_color,
    size: 25,
    ),
    itemLabel: 'Page 1',
    ),
    BottomBarItem(
    inActiveItem: Icon(
    Icons.production_quantity_limits,
    color: Colors.white,
    size: 25,
    ),
    activeItem: Icon(
    Icons.production_quantity_limits,
    color: main_text_white_color,
    size: 25,
    ),
    itemLabel: 'Page 1',
    ),
    BottomBarItem(
    inActiveItem: Icon(
    Icons.person,
    color: main_text_white_color,
    size: 25,
    ),
    activeItem: Icon(
    Icons.person,
    color: main_text_white_color,
    size: 25,
    ),
    itemLabel: 'Page 5',
    ),

    ],
    onTap: (index) {
    if(index==0){
    _pageController.jumpToPage(0);
    }
    else if(index==1){
    _pageController.jumpToPage(1);
    }else{
    _pageController.jumpToPage(2);
    }
    },
    kIconSize: 24.0,
    )
        : null,
    );
  }
}