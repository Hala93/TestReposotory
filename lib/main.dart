import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'models/providers.dart';
import 'screens/input_screen.dart';
import 'screens/result_screen.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        InputScreen.id: (context) => InputScreen(),
        ResultScreen.id: (context) => ResultScreen()
      },
      home: ChangeNotifierProvider<providers>(
        create: (_) => providers(150, 50, 25, true),
        child: InputScreen(),
      ),
    );
  }
// #enddocregion build
}
