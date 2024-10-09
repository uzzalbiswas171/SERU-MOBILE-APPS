import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../CustomNetworkImaget/custom_network_image.dart';

class CalosolSelalider extends StatelessWidget {
    CalosolSelalider({super.key,required this.custom_height,required this.carousal_list,required this.carousal_onTab});
  double custom_height;
  List carousal_list;
  final GestureTapCallback? carousal_onTab;

  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      options: CarouselOptions(
        height:  custom_height,
        viewportFraction:1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: carousal_list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: carousal_onTab,
              child: Container(
                width: MediaQuery.of(context).size.width,
               margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber,
                   image: DecorationImage(image: AssetImage("${i}"),fit: BoxFit.fill)
                ),
                // child: CustomNetworkImage(
                //     height: custom_height,
                //     image: "${i["image"]}"),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
