import 'package:flutter/material.dart';

import '../../../CustomWidget/CustomAppbar/custom_appbar.dart';
import '../../../CustomWidget/CustomImageScetion/custom_image_section.dart';
import '../../../CustomWidget/CustomText/custom_text.dart';
import '../../../custom_const.dart';
import '../../Auth/Login/screens/login_screen.dart';
import '../../RegistrationForBuyScreen/registration_for_buy_screen.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key}) : super(key: key);

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  bool  is_cliced=false;
  bool  is_cliced_for_own=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 8,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 190
              ), itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                    ,color: Main_Theme_Color,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child:  Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black
                          ),
                          alignment: Alignment.center,
                          child: CustomText(text: "\£ 29",text_color: main_text_white_color ,fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 5,),
                      CustomText(text: "✓ 20 Mocktest", fontSize: 18, fontWeight: FontWeight.w500)
                      ,
                      SizedBox(height: 5,),
                      CustomText(text: "✓ 20 Mocktest", fontSize: 16, fontWeight: FontWeight.w500)
                      ,SizedBox(height: 5,),
                      GestureDetector(
                        onTap: () {
            
                          showDialog(context: context, builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: CustomText(text: "For who do you want to buy ?..", fontSize: 18, fontWeight: FontWeight.w600),
                                  content: Container(
                                    height: is_cliced==true?265:60,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: MediaQuery.of(context).size.width*0.8,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton( style: ElevatedButton.styleFrom(
                                                  backgroundColor:is_cliced_for_own==false? BootomBarColor :Colors.white
                                              ),
                                                  onPressed: () {
            
                                                    setState(() {
                                                      is_cliced_for_own=false;
                                                      is_cliced=true;
                                                    },);
                                                  }, child: CustomText(text: "FOR GIFT", fontSize: 16, fontWeight: FontWeight.w500)),
                                              ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:is_cliced_for_own==true? BootomBarColor:Colors.white
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      is_cliced_for_own=true;
                                                      is_cliced=true;
                                                    },);
                                                  }, child: CustomText(text: "FOR OWN", fontSize: 16, fontWeight: FontWeight.w500)),
                                            ],
                                          ),
                                        ),
            
                                        is_cliced==false?Container():   SizedBox(height: 20,),
                                        is_cliced==false?Container(): GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(),));
                                          },
                                          child: Container(
                                            height: 60,
                                            width: MediaQuery.of(context).size.width*0.8,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                CustomImageSection(image:AssetImage("assets/PymentImage/mastercad.PNG"), img_height: 90, img_width: 80, img_margin: 10, Img_radius: 11),
                                              ],
                                            ),
                                          ),
                                        ),
                                        is_cliced==false?Container():  Container(
                                          height: 60,
                                          width: MediaQuery.of(context).size.width*0.8,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
            
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(),));
                                                  },
                                                  child: CustomImageSection(image:AssetImage("assets/PymentImage/payple.PNG"), img_height: 90, img_width: 80, img_margin: 0, Img_radius: 11)),
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundColor: BootomBarColor.withOpacity(0.3),
                                                child: Text("??",style: TextStyle(
                                                  fontSize: 33,
                                                ),),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(),));
                                                  },child: CustomImageSection(image:AssetImage("assets/PymentImage/gpay.PNG"), img_height: 90, img_width: 80, img_margin: 0, Img_radius: 11)),
            
                                            ],
                                          ),
                                        ),
                                        is_cliced==false?Container():  Container(
                                          height: 60,
                                          width: MediaQuery.of(context).size.width*0.8,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForBuyScreen(),));
                                                  },child: CustomImageSection(image:AssetImage("assets/PymentImage/mastercad.PNG"), img_height: 90, img_width: 80, img_margin: 10, Img_radius: 11)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/Gif/buynowcircle.gif"),
                        ),
                      ),
                      // Image.asset("assets/Gif/buynow.webp",height: 40,width: 100,fit: BoxFit.fill,)
                    ],
                  ),
                ),
              );
            },),
          ),
        ),
      ),
    );
  }
}
