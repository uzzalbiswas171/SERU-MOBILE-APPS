import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_const.dart';
import '../CustomText/custom_text.dart';

class CustomInfoScreen extends StatefulWidget {
  const CustomInfoScreen({Key? key}) : super(key: key);

  @override
  State<CustomInfoScreen> createState() => _CustomInfoScreenState();
}

class _CustomInfoScreenState extends State<CustomInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Column(
        children: [
          Image.asset("$Seru_Test_logo",height: 100,width: 100,),
          CustomText(text: "Contact Us", fontSize: 25, fontWeight: FontWeight.w500)
          ,
          CustomText(text: "Phone : 01889173335", fontSize: 16, fontWeight: FontWeight.w500)
          ,CustomText(text: "Info.serutest@gmail.com", fontSize: 16, fontWeight: FontWeight.w500)
          , Text(
            textAlign: TextAlign.justify,
            "Tfl Seru test training is the trading name of FSM London Limited registered in England and wells company house registration number 14126489. Registered address 168 (G-3) Mile End Road London E1 4LJ",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight:FontWeight.w500,
              color: main_text_blac_color,
              letterSpacing: 0.3,
            ),)
        ],
      ),
    );
  }
}
