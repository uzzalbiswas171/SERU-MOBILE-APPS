import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/MockTestScreen/MockTestQuestionScreen/mock_test_question_screen.dart';

import '../../../../CustomWidget/CustomButton/custom_button.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';
import '../../../../custom_const.dart';

class MockTestScreen extends StatefulWidget {
  const MockTestScreen({super.key});

  @override
  State<MockTestScreen> createState() => _MockTestScreenState();
}

class _MockTestScreenState extends State<MockTestScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60), child: CustomIndividualAppbar(onPress: () {
        Navigator.pop(context);
      }, title: "Mock Test")),
      body: Consumer<ProfileController>(
        builder: (context, value, child) {
     //     print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm ${value.MockTest}");
        return "${value.MockTest}"=="null"? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/Gif/carmoving.gif",height: 100,width: 100,),
              CustomText(text: "Loading...", fontSize: 22, fontWeight: FontWeight.w700,fontStyle:FontStyle.italic ,)
            ],
          ),
        )

            : Container(
            height: double.infinity,
            width: double.infinity,
            child:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount:value.MockTest==null?0: value.MockTest.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    // mainAxisExtent: 190
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        var rng = new Random();
                        var code = rng.nextInt(900000) + 100000;
                        Provider.of<ProfileController>(context,listen: false).getMyMOCID_WISE_QUESTION_LIST_GETProvider(
                            context, "${value.MockTest[index]["mocktest_id"]}");
                          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => MockTestQuestionScreen(
                          moc_test_no: "${index+1}",
                          randomNumber: code,
                        ),));
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
                            CustomText(text: "Mocktest\n✓${value.MockTest[index]["mocktest_id"]}", fontSize: 14, fontWeight: FontWeight.w500,textAlign: TextAlign.center,)
                            ,
                            SizedBox(height: 5,),
                            CustomText(text: "${value.MockTest[index]["description"]}",fontSize: 11, fontWeight: FontWeight.w400,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,)
                            ,SizedBox(height: 5,),
                          ],
                        ),
                      ),
                    );
                  },),
              ),
            ),
          );
        }
      ),

    );
  }
  bool is_check=false;
}
