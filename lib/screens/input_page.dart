import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/rounded_icon_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  int height = 150;
  int weight = 60;
  int age = 30;

  void updateColor(Gender gender) {
    switch (gender) {
      case Gender.male:
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
        break;
      case Gender.female:
        maleCardColor = kInactiveCardColor;
        femaleCardColor = kActiveCardColor;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(children: [
            Expanded(
              child: ReusableCard(
                handleOnTap: () {
                  setState(() {
                    updateColor(Gender.male);
                  });
                },
                color: maleCardColor,
                cardChild: IconContent(
                  icon: Icon(
                    FontAwesomeIcons.mars,
                    size: 80,
                  ),
                  text: 'MALE',
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                handleOnTap: () {
                  setState(() {
                    updateColor(Gender.female);
                  });
                },
                color: femaleCardColor,
                cardChild: IconContent(
                  icon: Icon(
                    FontAwesomeIcons.venus,
                    size: 80,
                  ),
                  text: 'FEMALE',
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          child: ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(height.toString(), style: kNumberTextStyle),
                    Text('cm'),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    thumbColor: Color(0xFFEB1555),
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ), //Inherits from the regular slider theme
                  child: Slider(
                    min: 100,
                    max: 200,
                    value: height.toDouble(),
                    onChanged: (val) {
                      setState(() {
                        height = val.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(children: [
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                          FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ResultsPage(CalculatorBrain(height, weight))));
          },
          child: Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
            child: Center(
              child: Text(
                'CALCULATE',
                style: kLargeButtonTextStyle,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
