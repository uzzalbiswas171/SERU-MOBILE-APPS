import 'package:seru_test_project/CustomWidget/CustomNetworkImaget/custom_network_image.dart';
import 'package:seru_test_project/CustomWidget/animation/bouncing_effects.dart';
import 'package:seru_test_project/custom_const.dart';
import 'package:flutter/material.dart';

class AddSection extends StatelessWidget {
  AddSection({super.key,required this.add_image,required this.height});
  String add_image;
  double height;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Container(
      width: w * 0.95,
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: -30,
            // child: CustomNetworkImage(
            //     height: height,
            //     image: "$add_image"),
            child:Image.network("${BaseUrl}/${add_image}")
          ),
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: const BorderRadius.all(
          //       Radius.circular(20),
          //     ),
          //     gradient: LinearGradient(
          //       colors: [
          //         const Color(0xff212121).withOpacity(1),
          //         const Color(0xff212121).withOpacity(0.8),
          //         const Color(0xff212121).withOpacity(0.7),
          //         const Color(0xff212121).withOpacity(0.5),
          //         const Color(0xff212121).withOpacity(0.0),
          //       ],
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 10,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: const [
          //       Text(
          //         "TODAY ONLY",
          //         style: TextStyle(
          //           fontSize: 13,
          //           height: 1.3,
          //           color: Colors.white54,
          //         ),
          //       ),
          //       Text(
          //         "80% OFF\nWITH CODE:",
          //         style: TextStyle(
          //           fontSize: 22,
          //           height: 1.3,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // Positioned(
          //   bottom: 20,
          //   right: 20,
          //   child: Bouncing(
          //     onPress: () {},
          //     child: Container(
          //       width: 120,
          //       height: 30,
          //       alignment: Alignment.center,
          //       decoration: const BoxDecoration(
          //         color: customColor,
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(36),
          //         ),
          //       ),
          //       child: const Text(
          //         "E-COMMERCE",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontSize: 14,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
