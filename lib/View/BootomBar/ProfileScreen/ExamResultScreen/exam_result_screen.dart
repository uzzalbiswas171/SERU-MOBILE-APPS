import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:seru_test_project/Controller/profile_controller.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import 'package:seru_test_project/View/BootomBar/ProfileScreen/ExamResultScreen/IndividualResult/individual_result.dart';
import 'package:seru_test_project/custom_const.dart';

import '../../../../CustomWidget/CustomSplashMenue/custom_image.dart';
import '../../../../CustomWidget/CustomText/custom_text.dart';

class ExamResultScreen extends StatefulWidget {
  const ExamResultScreen({super.key});

  @override
  State<ExamResultScreen> createState() => _ExamResultScreenState();
}

class _ExamResultScreenState extends State<ExamResultScreen> {
  double animatedheight=0;
  double animatwidth=130;
  double lineWidth=7.0;
  double C_height=5;
  bool _is_click_date=false;
  bool _is_tear_date=false;
  int selectedmonth=0;
  List MonthList=[
    "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
  ];
  int total_Amount=100000000;
  final List<String> items = [
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
  ];
  String? selectedValue;

  @override
  void initState() {
    Provider.of<ProfileController>(context,listen: false).getMygetAllMyMARKRESULTProvider(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final data=Provider.of<ProfileController>(context).All_MyMARK_RESULT_LIST_GET;


    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
         Navigator.pop(context);
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have to finish or submit")));
      }, title: "Exam result")),
      body: "${data}"=="null"?
      Center(child:  CircularProgressIndicator(),):"${data}"=="[]"?Center(child: CustomText(text: "Data not found..",fontSize: 18,fontWeight: FontWeight.w500,)): Consumer<ProfileController>(
        builder: (context, value, child) { 
          return Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                /// First part-----------------------
                Container (
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
                  margin: EdgeInsets.only(left: 10,right: 10,bottom: 0,top: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                    color: Main_Theme_white,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            // color: Colors.red,
                            border: Border.all(
                                color: Main_Theme_textColor.withOpacity(0.15),
                                width: 1.5
                            )
                        ),
                        padding: EdgeInsets.only(left: 7,right: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text:"${value.All_MyMARK_RESULT_LIST_GET}"=="[]"?"0": "${value.All_MyMARK_RESULT_LIST_GET.length}", fontSize: 12, fontWeight: FontWeight.w500)
                          ],
                        ),
                      ),
                      Positioned(
                          right: 0,
                          bottom: 2,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 32,
                            width: animatwidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Main_Theme_white,
                                border: Border.all(
                                    color: Main_Theme_textColor.withOpacity(0.7),
                                    width: 1
                                )
                            ),
                            padding: EdgeInsets.only(left: 7,right: 7,top: 5,bottom: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _is_click_date=!_is_click_date;
                                  if(_is_click_date==true){
                                    if(w>530){
                                      animatwidth=530;
                                    }else{
                                      animatwidth=w*0.90;
                                    }
                                  }else{
                                    animatwidth=100.0;
                                  }
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _is_click_date==false?  CustomText(fontSize:  12 , fontWeight: FontWeight.w500, text: "${MonthList[selectedmonth]}" ,
                                      text_color : Main_Theme_Color) :
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: MonthList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedmonth=index;
                                              _is_click_date=!_is_click_date;
                                              if(_is_click_date==true){
                                                animatwidth=w*0.95;
                                              }else{
                                                animatwidth=130.0;
                                              }
                                            },);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 10.0,left: 5,top: 0),
                                            child: Text("${MonthList[index]}"),
                                          ),
                                        ) ;
                                      },),
                                  ),
                                  Container(
                                    height: 12,
                                    width: 1,
                                    color: Main_Theme_textColor,
                                    margin: EdgeInsets.only(left: 5,right: 7),
                                  ),
                                  Container(
                                    height: 42,
                                    width: 50,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        hint: Text(
                                          '${DateTime.now().year}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Main_Theme_textColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        items: items
                                            .map((String item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedValue = value;
                                          });
                                        },

                                        iconStyleData: const IconStyleData(
                                          icon: Icon(
                                            Icons.arrow_downward,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor: Main_Theme_textColor,
                                          iconDisabledColor: Colors.grey,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          scrollPadding: EdgeInsets.all(0.0),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(11),
                                              border: Border.all(
                                                  color: Main_Theme_textColor.withOpacity(0.5),
                                                  width: 1
                                              )
                                          ),
                                          direction: DropdownDirection.textDirection,
                                          maxHeight: 200,
                                          width: 65,
                                          useRootNavigator: true,
                                          padding: EdgeInsets.only(left: 2,right: 2),
                                          offset:  Offset( -3, -6),
                                          scrollbarTheme: ScrollbarThemeData(
                                            radius:  Radius.circular(11),
                                            trackBorderColor: MaterialStateProperty.all(Color(0xFF5D5F6E)),
                                            thickness: MaterialStateProperty.all<double>(6),
                                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                                          ),
                                        ),
                                        menuItemStyleData: const MenuItemStyleData(
                                          height: 40,
                                          padding: EdgeInsets.only(left: 14, right: 14),
                                        ),
                                      ),
                                    ),
                                  )


                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                /// Second part Calender ----------------------
                Expanded(
                    child: Container(

                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7) ,
                      ),
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:"${value.All_MyMARK_RESULT_LIST_GET.length}"=="null"?0: value.All_MyMARK_RESULT_LIST_GET.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Provider.of<ProfileController>(context,listen: false).get_All_My_MARK_RESULT_HISTORYProvider(context, "${value.All_MyMARK_RESULT_LIST_GET[index]["question_set"]}");
                            showDialog(context: context, builder: (context) => AlertDialog(title: Center(child: CircularProgressIndicator(),),),);
                            Future.delayed(Duration(seconds: 1),() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualResultScreen(),));
                            },);
                            },
                          child: Container(
                            height: 74,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Main_Theme_white,
                                border: Border(
                                    bottom: BorderSide(
                                      color: appbarcollor,
                                      width: 1.5,
                                    ),
                                ),
                            ),
                            margin: EdgeInsets.only(bottom: 4),
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 54,
                                  width: 53,
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: appbarcollor.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Column(
                                    children: [
                                      //      CustomText(fontSize: 12, fontWeight: FontWeight.w500, text: "${DateFormat.yMMMEd().format(value.All_MyMARK_RESULT_LIST_GET[index]["date"])}",  text_color: appbarcollor),
                                  CustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "${value.All_MyMARK_RESULT_LIST_GET[index]["is_pass"]}", text_color: appbarcollor),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "${value.All_MyMARK_RESULT_LIST_GET[index]["correct"]}",   text_color: Main_Theme_textColor),
                                    CustomText(fontSize: 12, fontWeight: FontWeight.w300, text: "Total Correct",   text_color: Main_Theme_textColor.withOpacity(0.5)),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: 35,
                                  width: 2,
                                  margin:EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Main_Theme_textColor.withOpacity(0.1)
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "${int.parse("${value.All_MyMARK_RESULT_LIST_GET[index]["answered"]}")-int.parse("${value.All_MyMARK_RESULT_LIST_GET[index]["correct"]}")}",  text_color: Main_Theme_textColor),
                                    CustomText(fontSize: 12, fontWeight: FontWeight.w300, text: "Total Incorrect",  text_color: Main_Theme_textColor.withOpacity(0.5)),
                                  ],
                                ),
                                Spacer(),
                                SizedBox(width: 15,),
                                Icon(Icons.arrow_forward_ios_rounded,size: 22,color: Main_Theme_Color,)
                              ],
                            ),
                          ),
                        ),),
                    ))

              ],
            ),
          );
        },

      ),

    );
  }
  // String selected2Datee = DateFormat.yMMMEd().format(DateTime.now()).toString();
  // Future<void> _select2Date(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selected2Datee) {
  //     final df = new DateFormat.yMMMEd();
  //     setState(() {
  //       selected2Datee = df.format(picked);
  //     });
  //   }
  // }
}
