import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/resources/contants.dart';
import 'package:bmi_calculator/resources/reuseable_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/resources/bottom_buttom.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi,this.interpretation,this.results});
  final String results;
  final String interpretation;
  final String bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              colour: kActiveCardColor,
              containerchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    results,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Normal BMI range:',
                        style: kLabelTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0
                        ),
                      ),
                    ],
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: (){
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}