import 'package:provider/provider.dart';
import 'package:seru_test_project/CustomWidget/animation/bouncing_effects.dart';
import 'package:flutter/material.dart';
 import '../../custom_const.dart';

class CustomIndividualAppbar extends StatelessWidget {
   CustomIndividualAppbar({super.key,required this.onPress,required this.title});
  final VoidCallback onPress;
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Bouncing(
        onPress: onPress,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 26,
            ),
          ),
        ),
      ),
      title: Text(
        "$title",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
           },
            child: Stack(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child:  Icon(
                      Icons.shopping_cart,
                      color: Colors.black87,
                      size: 22,
                    )
                ),
                Positioned(
                    right: 0,
                    left:0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                  radius: 6,
                  child: Text("z",style: TextStyle(
                    fontSize: 7,
                    color: Colors.white
                  ),),
                ))
              ],
            ),
          ),
        ),
      ],
      backgroundColor: BootomBarColor,
    );
  }
}
