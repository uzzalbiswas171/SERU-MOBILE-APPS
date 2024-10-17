import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:seru_test_project/CustomWidget/CustomButton/custom_button.dart';
import 'package:seru_test_project/CustomWidget/CustomText/custom_text.dart';

import '../../../../CustomWidget/CustomAppbar/custom_appbar.dart';
import '../../Controller/buy_package_controller.dart';
import '../../CustomWidget/CustomAppbar/custom_appbar.dart';
import '../../CustomWidget/CustomApplySection/custom_apply_section.dart';
import '../../CustomWidget/CustomTextFromField/custom_text_from_fild.dart';
import '../../custom_const.dart';

class RegistrationForBuyScreen extends StatefulWidget {
  RegistrationForBuyScreen({Key? key, 
  required this.package_id, 
  required this.subscription_structure_id,
  required this.is_cliced_for_own
  }) : super(key: key);
 String package_id;
  String subscription_structure_id;
  String is_cliced_for_own;
  @override
  State<RegistrationForBuyScreen> createState() => _RegistrationForBuyScreenState();
}

class _RegistrationForBuyScreenState extends State<RegistrationForBuyScreen> {
  TextEditingController _applyCuponController=TextEditingController();
 TextEditingController _nameController = TextEditingController() ;
 TextEditingController _surnameController = TextEditingController() ;
 TextEditingController _address1Controller = TextEditingController() ;
 TextEditingController _address2Controller = TextEditingController() ;
 TextEditingController _cityController = TextEditingController() ;
 TextEditingController _countryController = TextEditingController() ;
 TextEditingController _zipController = TextEditingController() ;
 TextEditingController _emailController = TextEditingController() ;
 TextEditingController _friendemailController = TextEditingController() ;
   @override
  void initState() {
     _countryController.text="London";
     // TODO: implement initState
    super.initState();
  }
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
              CustomApplyVaucherSection(applyCuponController: _applyCuponController,onTap: () {
                Provider.of<BuyPackageController>(context,listen: false).vautureapplyprovider(
                  context,
                  "${_applyCuponController.text}",
                  "${DateFormat("yyyy-MM-dd").format(DateTime.now())}"
                );
              },),
              
           widget.is_cliced_for_own=="FOR OWN"?Container():  SizedBox(height: 15,),
            widget.is_cliced_for_own=="FOR OWN"?Container():  Container(
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
                    CustomTExtFromField(controller: _friendemailController, hintText: "Friend/Relative email", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
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
                    CustomTExtFromField(controller: _nameController, hintText: "Name*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _surnameController, hintText: "Surname*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _address1Controller, hintText: "Address Line 1*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _address2Controller, hintText: "Address Line 2", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _cityController, hintText: "City*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromFieldforreadonly( readOnly: true,controller: _countryController, hintText: "Country*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField( controller: _zipController, hintText: "Zip Postal Code*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
          
                    SizedBox(height: 15,),
                    CustomTExtFromField(controller: _emailController, hintText: "Email*", text: "Email", fontSize: 15, fontWeight: FontWeight.w500, text_color: main_text_blac_color.withOpacity(0.8), suffixIcon: Icon(Icons.person,color: main_text_blac_color.withOpacity(0.6),), obscureText: false,),
                    SizedBox(height: 15,),
                    CustomButton(onTap: () {
                      Provider.of<BuyPackageController>(context,listen: false).buyPackageWithoutVoucherProvider(
                          context,
                          int.parse("${widget.package_id}"),
                          int.parse("${widget.subscription_structure_id}"),
                          "no",
                          _friendemailController.text,
                          _nameController.text,
                          _surnameController.text,
                          _address1Controller.text,
                          _address2Controller.text,
                          _cityController.text,
                          _countryController.text,
                          _zipController.text,
                          _emailController.text,
                          ""
                      );
                    }, text: "Next", button_text_fontSize: 15,
                        button_height: 50)
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
