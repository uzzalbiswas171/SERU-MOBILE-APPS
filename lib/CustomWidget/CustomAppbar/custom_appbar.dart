 import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';
 import '../../custom_const.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key,this.onPressed,this.onTap,this.onChanged});
  final VoidCallback? onPressed;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> { 

  @override
  Widget build(BuildContext context) {
   // final addToCart = Provider.of<AddToCartProvider>(context);
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
       // color: Colors.white,
      gradient: customBackground(),

      ),
      child: AppBar(
      //  backgroundColor: Colors.w
    
       elevation: 0.0,
        backgroundColor: appbarcollor.withOpacity(0.0),
        leading:Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            radius: 21,
            child: CircleAvatar(
              backgroundImage: AssetImage("$Seru_Test_logo"),
              radius: 23,
            ),
          ),
        ),

      
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(text: "Welcome to SERU TEST", fontSize: 16, fontWeight: FontWeight.bold,text_color: Main_Theme_white.withOpacity(0.9),),
                CustomText(text: "Let's Learn...", fontSize: 12, fontWeight: FontWeight.bold,text_color: Main_Theme_white.withOpacity(0.7),),
              ],
            )
          ),
        ],
      ),
    );
  }

}
