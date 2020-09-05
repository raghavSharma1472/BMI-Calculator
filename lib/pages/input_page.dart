import 'package:bmi_calculator/resources/bottom_buttom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../resources/icon_content.dart';
import '../resources/reuseable_container.dart';
import '../resources/contants.dart';
import 'results_page.dart';
import '../resources/round_button_icon.dart';
import 'package:bmi_calculator/bmi_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum Gender{
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height =180;
  int weight = 70;
  int age =40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableContainer(
                      colour: selectedGender==Gender.male? kActiveCardColor:kInactiveCardColor,
                      containerchild: ReusableColumn(
                        gender: 'MALE',
                        iconData: FontAwesomeIcons.mars,
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    child: ReusableContainer(
                      colour: selectedGender==Gender.female? kActiveCardColor:kInactiveCardColor,
                      containerchild: ReusableColumn(
                        gender: 'FEMALE',
                        iconData: FontAwesomeIcons.venus,
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
                colour: kActiveCardColor,
              containerchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                    Text(
                      height.toString(),
                      style: kIntegerTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value:height.toDouble(),
                      max: 272.0,
                      min: 54.0,
                      onChanged: (double newValue){
                        setState(() {
                        height = newValue.round();
                      });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainer(
                    colour: kActiveCardColor,
                    containerchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kIntegerTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight+=1;
                                });
                              },
                              icon: FontAwesomeIcons.plus
                            ),
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight-=1;
                                });
                              },
                                icon: FontAwesomeIcons.minus
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ),
                Expanded(
                  child: ReusableContainer(
                      colour: kActiveCardColor,
                    containerchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kIntegerTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  age+=1;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  age-=1;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
          BottomButton(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(weight: weight,height: height);
              if(selectedGender!=null){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                  bmi: calc.calculateBMI(),
                  interpretation: calc.getInterpretation(),
                  results: calc.calculateResults(),
                )));
              }else{
                Alert(
                  context: context,
                  title: 'Select Gender',
                  desc:'You have not selected a component'
                ).show();
              }
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      )
    );
  }
}



