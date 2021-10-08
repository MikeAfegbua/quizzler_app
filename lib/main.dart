import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  List<Question> questionBank = [
    Question(
      q: 'You can lead a cow down stairs but not up stairs.',
      a: false,
    ),
    Question(
      q: 'Approximately one quarter of human bones are in the feet.',
      a: true,
    ),
    Question(
      q: 'A slug\'s blood is green.',
      a: true,
    )
  ];
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              child: const Text('True'),
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                padding: const EdgeInsets.all(15),
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                    
                if (correctAnswer == true) {
                  // ignore: avoid_print
                  print("user got it right!");
                } else {
                  // ignore: avoid_print
                  print("user got it wrong!");
                }

                setState(() {
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20, color: Colors.white),
                padding: const EdgeInsets.all(15),
                primary: Colors.white,
                backgroundColor: Colors.red,
              ), 
              onPressed: () {
                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                    
                if (correctAnswer == false) {
                  // ignore: avoid_print
                  print("user got it right!");
                } else {
                  // ignore: avoid_print
                  print("user got it wrong!");
                }
                setState(() {
                  questionNumber++;
                });
              },
              child: const Text('False'),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/