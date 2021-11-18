import 'package:bmiproviders/models/providers.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import '../models/BMI_arguments.dart';
import '/screens/result_screen.dart';
import '/utils/BMI_Calculator.dart';
import '/utils/constants.dart';
import '/widgets/my_card.dart';
import '/widgets/my_round_btn.dart';
import 'package:provider/provider.dart';


class InputScreen extends StatelessWidget {
  static const id = "first";
  bool isMale = true;
  int height = 150;
  int weight = 50;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<providers>(context);

    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    var p1 = 0.02 * sw;
    var p2 = 0.01 * sh;
    var ch = 0.27 * sh;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: p1, vertical: p2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyCard(
                  clr: isMale ? kActiveCardColour : kInactiveCardColour,
                  width: sw / 2 - 2 * p1,
                  height: ch - 2 * p2,
                  onTab: () {
                    provide.getgender();
                  },
                  child: Column(
                    children: [
                      Icon(Icons.mail),
                      Text(
                        "Male",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                ),
                MyCard(
                  clr: isMale ? kInactiveCardColour : kActiveCardColour,
                  width: sw / 2 - 2 * p1,
                  height: ch - 2 * p2,
                  onTab: () {
                    provide.change_gender();
                  },
                  child: Column(
                    children: [
                      Icon(Icons.mail_outline),
                      Text(
                        "Female",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: p1),
            child: MyCard(
              width: sw - 2 * p1,
              height: ch - 2 * p2,
              clr: kInactiveCardColour,
              child: Column(
                children: [
                  Text(
                    "Height",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        "${provide.gethight()}",
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: provide.gethight().toDouble(),
                    min: 100,
                    max: 300,
                    onChanged: (value) {
                     provide.sethight(value.toInt());
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: p1, vertical: p2),
            child: Row(
              children: [
                MyCard(
                  clr: kInactiveCardColour,
                  width: sw / 2 - 2 * p1,
                  height: ch - 2 * p2,
                  child: Column(
                    children: [
                      Text(
                        "Weight",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        "${provide.getweight()}",
                        style: kNumberTextStyle,
                      ),
                      Row(
                        children: [
                          RoundIconButton(
                            radius: (sw / 2 - 2 * p1) * 0.2,
                            icon: Icons.minimize,
                            onPressed: () {
                              provide.decrease_weight();
                            },
                          ),
                          RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              provide.increase_weight();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                MyCard(
                  clr: kInactiveCardColour,
                  width: sw / 2 - 2 * p1,
                  height: ch - 2 * p2,
                  child: Column(
                    children: [
                      Text(
                        "Age",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        "${age.toString()}",
                        style: kNumberTextStyle,
                      ),
                      Row(
                        children: [
                          RoundIconButton(
                            icon: Icons.minimize,
                            onPressed: () {
                              provide.increase_age();
                            },
                          ),
                          RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              provide.increase_age();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: OutlinedButton(
            child: Text("Calculate"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink),
            ),
            onPressed: () {
              BMICalculatorBrain bci =
                  BMICalculatorBrain(height: height, weight: weight);
              BMIArguments barc = BMIArguments(
                  bmi: bci.calculateBMI(),
                  interpretation: bci.getInterpretation(),
                  bmiResult: bci.getResult());
              Navigator.pushNamed(context, ResultScreen.id, arguments: barc);
            },
          ))
        ],
      ),
    );
  }
}

// class InputScreen extends StatefulWidget {
//   static const id = "first";
//
//   @override
//   State<InputScreen> createState() => _InputScreenState();
// }
