import 'package:bmi_calculator/Widgets/bmi_cards.dart';
import 'package:bmi_calculator/Widgets/increment_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const Color inactiveColor = Color(0xff1B1C2B);
const Color maleCardColor = Colors.lightBlueAccent;
const Color femaleCardColor = Colors.pink;
const Color gayCardColor = Colors.deepOrange;

enum Gender{male, female, gay, lesbian}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int Height = 180;
  int Weight = 40;
  int Age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Calculator", style: GoogleFonts.poppins(
          fontSize: 20.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),),
      ),
      backgroundColor: Color(0xff0C0F1E),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(child: Container(
              child: Row(
                children: [
                  Expanded(child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: BMICards(cardColor: selectedGender == Gender.male ? maleCardColor : inactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.male, color: Colors.white, size: 25,),
                        const SizedBox(height: 10,),
                        Text("Male", style: GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                      ],
                    ),
                    ),
                  )),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: BMICards(cardColor: selectedGender == Gender.female ? femaleCardColor: inactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, color: Colors.white, size: 25,),
                          SizedBox(height: 10,),
                          Text("Female", style: GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            )),
            Expanded(child: BMICards(cardColor: Color(0xff1B1C2B),
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15,),
                Text("Height", style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(Height.toString(), style: GoogleFonts.poppins(fontSize: 23.sp, fontWeight: FontWeight.bold, color: Colors.white),),
                  SizedBox(width: 5,),
                  Text("cm", style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                ],),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1.5,
                    ),
                    child: Slider(value: Height.toDouble(),
                      min: 120.0,
                      max: 250.0,
                      activeColor: selectedGender == Gender.male ? maleCardColor: femaleCardColor,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                      setState(() {
                        Height = newValue.round();
                      });
                    },),
                  ),
                ),

              ],
            ),
            )),

            Expanded(child: Container(
              child: Row(
                children: [
                  Expanded(child: BMICards(cardColor: Color(0xff1B1C2B),
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15,),
                      Text("Weight", style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Weight.toString(), style: GoogleFonts.poppins(fontSize: 23.sp, fontWeight: FontWeight.bold, color: Colors.white),),
                          SizedBox(width: 5,),
                          Text("kg", style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                        ],),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IncrementButton(icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              Weight--;
                            });
                          },
                          ),

                          SizedBox(width: 20,),
                          IncrementButton(icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              Weight++;
                            });
                          },
                          ),
                        ],
                      ),
                    ],
                  ),
                  )),



                  Expanded(child: BMICards(cardColor: Color(0xff1B1C2B),
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15,),
                      Text("Age", style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.white),),
                      SizedBox(height: 10,),
                      Text(Age.toString(), style: GoogleFonts.poppins(fontSize: 23.sp, fontWeight: FontWeight.bold, color: Colors.white),),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IncrementButton(icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                Age--;
                              });
                            },
                          ),

                          SizedBox(width: 20,),
                          IncrementButton(icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                Age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  )),
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
              child: Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStatePropertyAll(Colors.deepOrange),
                    ),
                    onPressed: () {
                      CalculatorBrain calc = CalculatorBrain(height: Height, weight: Weight);
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ResultPage(bmiResult: calc.calculatedResult(), resultText: calc.getResult(), interpretation: calc.getInterpretation());
                      },));
                      },
                    child: Text("Calculate", style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),)),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}




