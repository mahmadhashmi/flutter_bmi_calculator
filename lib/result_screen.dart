import 'package:bmi_calculator/Widgets/bmi_cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    Color textColor;

    // Conditionally set the text color based on resultText
    if (resultText == "Overweight") {
      textColor = Colors.red.shade500;
    } else if (resultText == "Normal") {
      textColor = Colors.green.shade300;
    } else if (resultText == "Underweight") {
      textColor = Colors.blue.shade500;
    } else {
      // Default color if resultText is something else
      textColor = Colors.black;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        title: Text("Result", style: GoogleFonts.poppins(
          fontSize: 20.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),),
      ),
      backgroundColor: Color(0xff0C0F1E),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Container(
            child: BMICards(cardColor: Color(0xff1B1C2B),
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text(resultText, style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.normal,

                  color: textColor,
                ),),
                SizedBox(height: 40,),
                Text(bmiResult, style: GoogleFonts.poppins(fontSize: 37.sp, fontWeight: FontWeight.bold, color: Colors.white),),
                SizedBox(height: 40,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(interpretation,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                ),
                SizedBox(height: 60,),

              ],
            ),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStatePropertyAll(Colors.deepOrange),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Re-calculate", style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
