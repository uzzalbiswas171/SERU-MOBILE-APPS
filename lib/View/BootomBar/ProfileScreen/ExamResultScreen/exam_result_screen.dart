import 'package:flutter/material.dart';
import 'package:seru_test_project/CustomWidget/CustomAppbar/custom_individual_appbar.dart';
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
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      //   appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomDefaultAppBar(onTap: () => Navigator.pop(context), text: "Attendance Calendar ")),
      body:  Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            /// First part-----------------------
            Container (
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7 ),
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageSction(height: 24, width: 24, radius: 1, image: "Assets/Icons/share2.png"),

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
            Container(
              height: 180,
              width: double.infinity,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.white
              ),
              margin: EdgeInsets.symmetric(horizontal: 11),
              child: Column(
                children: [
                  ///----------- Bar chat Header Part -------///
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ColorCustomText(fontSize: font12header, fontWeight: FontWeight.w500, text: "Salary Comparison Chart  Jan-2023", letterSpacing: 0.3, textColor: Main_Theme_textColor.withOpacity(0.9),),
                  ),
                  Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            HomeThirdPartBodyLeftSide(
                              top1:total_Amount>10000? "1000M": "1000K",
                              top2: total_Amount>10000? "120M": "120K",
                              top3: total_Amount>10000? "60M": "600K",
                              top4: total_Amount>10000? "0M": "0K",
                              color:Main_Theme_textColor.withOpacity(0.6),
                            ),

                            Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.greenAccent.shade100.withOpacity(0.1),
                                  child:  Container(
                                      height: 90,
                                      width: 500,
                                      child:Scrollbar(
                                        child: ListView.builder(
                                          itemCount: 12,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return  Container(
                                                height: 90,
                                                margin: EdgeInsets.only(right: 7),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                        child: ThirdPartProgressBar( absenttheight:1, presentheight:index.isOdd? 50+double.parse("$index")+20  : 50+double.parse("$index")-20 , present_width: 15, Absent_width: 0.001, total_width: 21,)),
                                                    SizedBox(height: 5,),
                                                    Container(
                                                      height: 27,
                                                      width: 22,
                                                      padding: EdgeInsets.only(right: 5),
                                                      alignment: Alignment.center,
                                                      child:RotatedBox(
                                                          quarterTurns: 1,
                                                          child: ColorCustomText(fontSize: font11, fontWeight: FontWeight.w400, text: "${monthList[index]}", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.6),)
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                  ],
                                                ));
                                          },),
                                      )
                                  ),
                                )),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 8.0),
                            //   child: HomeThirdPartBodyLeftSide(top1: "180K", top2: "165K", top3: "80K", top4: "60K", color: absent_color,
                            //   ),
                            // ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),

            /// Third part-----------------------

            Expanded(
                child: Container(

                  margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7) ,
                  ),
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Container(
                      height: 74,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Main_Theme_WhiteCollor,
                          border: Border(
                              bottom: BorderSide(
                                color: presentsent_color,
                                width: 1.5,
                              )
                          )
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
                              color: presentsent_color.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Column(
                              children: [
                                ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "Jan", letterSpacing: 0.2, textColor: presentsent_color),
                                ColorCustomText(fontSize: 12, fontWeight: FontWeight.w400, text: "01-31", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ColorCustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "168", letterSpacing: 0.2, textColor: Main_Theme_textColor),
                              ColorCustomText(fontSize: 12, fontWeight: FontWeight.w300, text: "Total Employee", letterSpacing: 0.2, textColor: Main_Theme_textColor.withOpacity(0.5)),
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
                              CustomText(fontSize: 14, fontWeight: FontWeight.w500, text: "168",  text_color: Main_Theme_textColor),
                              CustomText(fontSize: 12, fontWeight: FontWeight.w300, text: "Net Payable Amount",  text_color: Main_Theme_textColor.withOpacity(0.5)),
                            ],
                          ),
                          SizedBox(width: 15,),
                          Icon(Icons.arrow_forward_ios_rounded,size: 22,color: Main_Theme_Color,)
                        ],
                      ),
                    ),),
                ))

          ],
        ),
      ),

    );
  }
}
