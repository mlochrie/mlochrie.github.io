import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(RockPaperScissorsApp());
}

class RockPaperScissorsApp extends StatelessWidget {
  const RockPaperScissorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RockPaperScissorsScreen(),
    );
  }
}

class RockPaperScissorsScreen extends StatefulWidget {
  const RockPaperScissorsScreen({super.key});
  @override
  RockPaperScissorsScreenState createState() => RockPaperScissorsScreenState();
}

class RockPaperScissorsScreenState extends State<RockPaperScissorsScreen> {
//logic code here
  final List<String> choices = ['Rock', 'Paper', 'Scissors'];
  final List<Color> appBgColor = [Colors.green, Colors.red, Colors.orange];
  Color appBackgroundColor = Colors.white;
  late String playerChoice = '';
  late String computerChoice = '';
  late String result = '';

  void generateComputerChoice() {
    final random = Random();
    final index = random.nextInt(choices.length);
    setState(() {
      computerChoice = choices[index];
    });
  }

  void determineWinner(String playerChoice) {
    final playerIndex = choices.indexOf(playerChoice);
    final computerIndex = choices.indexOf(computerChoice);
    final resultMatrix = [
      ['Draw', 'You Lose!', 'You Win!'], //rock
      ['You Win!', 'Draw', 'You Lose!'], //paper
      ['You Lose!', 'You Win!', 'Draw'], //scissors
    ];
    setState(() {
      result = resultMatrix[playerIndex][computerIndex];
      //extra work
      switch (result) {
        case 'You Win!':
          appBackgroundColor = Colors.green;
          break;
        case 'You Lose!':
          appBackgroundColor = Colors.red;
          break;
        case 'Draw':
          appBackgroundColor = Colors.orange;
          break;
      }
      //extra work
    });
  }

//logic code here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose your move:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: choices.map((choice) {
                Color bgColor = Colors.black;
                switch (choice) {
                  case 'Rock':
                    bgColor = Colors.teal;
                    break;
                  case 'Paper':
                    bgColor = Colors.red;
                    break;
                  case 'Scissors':
                    bgColor = Colors.orange;
                    break;
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bgColor,
                  ),
                  onPressed: () {
                    setState(() {
                      playerChoice = choice;
                      generateComputerChoice();
                      determineWinner(playerChoice);
                    });
                  },
                  child: Text(choice),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Player: $playerChoice', //add player choice variable inside the quotes
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Computer: $computerChoice', //add computer choice variable inside the quotes
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $result', //add result variable inside the quotes
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
