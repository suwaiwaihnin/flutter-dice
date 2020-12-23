import 'package:flutter/material.dart';
import 'dart:math';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Dice'),
        ),
        body: DiceApp(),
      ),
    );
  }
}

class DiceApp extends StatefulWidget {
  DiceApp({Key key}) : super(key: key);

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int diceLeftResult = 1;
  int diceRightResult = 1;
  void changeDice() {
    setState(() {
      diceLeftResult = Random().nextInt(6) + 1;
      diceRightResult = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: FlatButton(
              onPressed: () {
                changeDice();
              },
              child: Image(
                image: AssetImage('images/dice$diceLeftResult.png'),
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: FlatButton(
              onPressed: () {
                changeDice();
              },
              child: Image.asset('images/dice$diceRightResult.png'),
            ),
          )
        ],
      ),
    );
  }
}
