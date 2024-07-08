import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:seru_test_project/CustomWidget/CustomButton/custom_button.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';

import '../../../../CustomWidget/CustomAppbar/custom_appbar.dart';
import '../../CustomWidget/CustomAppbar/custom_appbar.dart';
import '../../CustomWidget/CustomApplySection/custom_apply_section.dart';
import '../../CustomWidget/CustomTextFromField/custom_text_from_fild.dart';
import '../../custom_const.dart';

class RegistrationForBuyScreen extends StatefulWidget {
  const RegistrationForBuyScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationForBuyScreen> createState() => _RegistrationForBuyScreenState();
}

class _RegistrationForBuyScreenState extends State<RegistrationForBuyScreen> {
  TextEditingController _applyCuponController=TextEditingController();

  TextEditingController _emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(preferredSize:Size.fromHeight(75), child: CustomAppbar()),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h*0.025,),
              /// Apply Sections
              CustomApplyVaucherSection(applyCuponController: _applyCuponController),
             SizedBox(height: 15,),
              Container(
                height: 120,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(11),
                  color: Colors.indigoAccent.withOpacity(0.2)
                ),
                child: Column(
                  children: [
                    CustomText(text: "Friend/Relative Information", fontSize: 18, fontWeight: FontWeight.w500),
                    CustomText(text: "Gigt voucher code will be sent here", fontSize: 13, fontWeight: FontWeight.w300),
                    SizedBox(height: 7,),
                    CustomTExtFromField(controller: _emailController, hintText: "Friend/Relative email", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                  ],
                ),
              ) ,
          
              SizedBox(height: 5,),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(11),
                  color: Colors.indigoAccent.withOpacity(0.2)
                ),
                child: Column(
                  children: [
                    CustomText(text: "Billing Information", fontSize: 18, fontWeight: FontWeight.w500),
                    SizedBox(height: 3,),
                    CustomText(text: "* Required field", fontSize: 13, fontWeight: FontWeight.w300),
                    SizedBox(height: 7,),
                    CustomTExtFromField(controller: _emailController, hintText: "Name*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _emailController, hintText: "Surname*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _emailController, hintText: "Address Line 1*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _emailController, hintText: "Address Line 2", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _emailController, hintText: "City*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _emailController, hintText: "Country*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _emailController, hintText: "Zip Postal Code*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _emailController, hintText: "Email*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
                    SizedBox(height: 15,),
                    
                    CustomButton(onTap: () {
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: CustomText(text: "Enter your card information", fontSize: 14, fontWeight: FontWeight.w400),
                        actions: [
                          
                        ],
                      ),);
                    }, text: "Next", button_text_fontSize: 15, button_height: 50)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
