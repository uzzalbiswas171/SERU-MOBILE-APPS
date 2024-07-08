import 'package:flutter/material.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/VideoClassScreen/video_class_screen.dart';

import '../../../../../CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import '../../../../../custom_const.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({super.key});

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75),
          child: CustomIndividualAppbar(onPress: () {
        Navigator.pop(context);
      }, title: "Mock Test")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: 20 ,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 150
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => VideoClassScreen(),));
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Main_Theme_Color,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Expanded(child: Image.asset("assets/Icons/phoneonsearch.png",fit: BoxFit.fill,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(text: "Class ${index+1}", fontSize: 15, fontWeight: FontWeight.w500,),
                    )
                  ],
                ),
              ),
            );
          },),
      ) ,
    );
  }
}
