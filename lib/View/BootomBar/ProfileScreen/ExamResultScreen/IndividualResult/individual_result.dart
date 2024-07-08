import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../CustomWidget/CustomAppbar/custom_individual_appbar.dart';

class IndividualResultScreen extends StatefulWidget {
  const IndividualResultScreen({super.key});

  @override
  State<IndividualResultScreen> createState() => _IndividualResultScreenState();
}

class _IndividualResultScreenState extends State<IndividualResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(75), child: CustomIndividualAppbar(onPress: () {
         Navigator.pop(context);
      //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have to finish or submit")));
      }, title: "Your result on 30/10/2024")),
    body : SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          decoration: BoxDecoration(
              border: Border.all(width: 1,)
          ),
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                'SI',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'DATE',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Question',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'A.',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'B.',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'C.',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'D.',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: snapShot.map<DataRow>((e) {
            return DataRow(
              cells: <DataCell>[
                DataCell(Center(
                  child: Text('${e}'  ,style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),),
                )),
                DataCell(Center(
                  child: Text('10-11-2024',  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),),
                )),
                DataCell(Center(
                  child: Text('Q1? Whats your name',  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),),
                )),
                DataCell(Center(
                  child: Text('Uzzal Biswas',  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),),
                )),
                DataCell(Center(
                  child: Text('Ripon roy',  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),),
                )),
                DataCell(
                    Center(
                  child: Text('Rahim Biswas',  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),),
                )),
                DataCell(Center(
                  child: Text('Bijoy Biswas',  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),),
                )),
              ],
            );
          }).toList(),
        ),
      ),
    ),
    );

  }
  List snapShot=[
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
  ];
}
