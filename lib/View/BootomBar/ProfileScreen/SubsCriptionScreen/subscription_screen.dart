import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';

import '../../../../CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import '../../../../CustomWidget/CustomImageScetion/custom_image_section.dart';
import '../../../../custom_const.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool  is_cliced=false;
  bool  is_cliced_for_own=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
        Navigator.pop(context);
      }, title: "My Subscription")),
      body: Consumer<ProfileController>(
        builder: (context, value, child) {
          return "${value.MySubscription}"=="null"?Center(child: CircularProgressIndicator(),):  Container(
            height: double.infinity,
            width: double.infinity,
            child:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: value.MySubscription.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 190
                  ), itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

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
                              child: CustomText(text: "\£ ${value.MySubscription[index]["amount"]}",text_color: main_text_white_color ,fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 5,),
                          CustomText(text: "${value.MySubscription[index]["title"]}", fontSize: 13, fontWeight: FontWeight.w500)
                          ,
                          SizedBox(height: 5,),
                          CustomText(text:Bidi.stripHtmlIfNeeded("${value.MySubscription[index]["description"]}") , fontSize: 16, fontWeight: FontWeight.w500)
                          ,SizedBox(height: 5,),
                          // Image.asset("assets/Gif/buynow.webp",height: 40,width: 100,fit: BoxFit.fill,)
                        ],
                      ),
                    ),
                  );
                },),
              ),
            ),
          );
        },

      ),
    );
  }
}
