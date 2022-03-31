import 'package:flutter/material.dart';
import 'package:lose_some_weight/constants/app_constants.dart';
import 'package:lose_some_weight/widgets/left_bar.dart';
import '../widgets/right_bar.dart';

//homescreen widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: accentColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //height textfield
                Container(
                  width: 130,
                  child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      )),

                  //weight textfield
                ),
                Container(
                  width: 130,
                  child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      )),
                ),
              ],
            ),

            //sized box for spacing
            SizedBox(
              height: 60,
            ),

            //calculate button
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w /(_h * _h);
                  if(_bmiResult > 25) {
                    _textResult = "You are overweight!";
                  } else if(_bmiResult >=18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight :)";
                  }else{
                    _textResult = "You are under weight!";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: accentColor,
                ),
              ),
            ),

            //sized box for spacing
            const SizedBox(
              height: 50,
            ),

            //calculate button
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: accentColor,
                ),
              ),
            ),

            //sized box for spacing
            SizedBox(
              height: 50,
            ),

            //display results here
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: accentColor,
                  ),
                ),
              ),
            ),

            //spacing
            SizedBox(
              height: 10,
            ),
            //leftbar
            LeftBar(barWidth: 40),
            //spacing
            SizedBox(
              height: 10,
            ),
            //leftbar
            LeftBar(barWidth: 70),
            //spacing
            SizedBox(
              height: 10,
            ),
            //leftbar
            LeftBar(barWidth: 40),
            //spacing
            SizedBox(
              height: 20,
            ),
            //leftbar
            RightBar(barWidth: 50),
            //spacing
            SizedBox(
              height: 30,
            ),
            //leftbar
            RightBar(barWidth: 70),
            SizedBox(height:270,),
            const Text("Chief Apps © 2022 - All Rights Reserved",
            style: TextStyle(
              fontSize: 18, 
              color: Colors.white,
            )
            ,),
                     ],
        ),
      ),
    );
  }
}
