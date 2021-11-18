import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import '/models/BMI_arguments.dart';


class ResultScreen extends StatefulWidget {
  static const String id ="second";

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var args = (ModalRoute.of(context)?.settings.arguments as BMIArguments);
    return Scaffold(
      backgroundColor: Colors.red,

      appBar: AppBar(

        title: Text("widget.title"),
      ),
      body: Column(
        children: [
          Text("${args.bmiResult}"),
          Text("${args.bmi.toString()}"),
          Text("${args.interpretation}"),
          OutlinedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Recalculate"))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
