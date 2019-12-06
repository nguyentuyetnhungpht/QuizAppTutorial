import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _questions = const [
      {
        'questionText': 'What is your favorite color?',  
        'answersText':[
         {'text': 'black', 'score': 1}, 
         {'text': 'red', 'score': 2},
         {'text': 'orange', 'score': 3}, 
         {'text': 'pink', 'score': 4},
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answersText':[
         {'text': 'owl', 'score': 1}, 
         {'text': 'dog', 'score': 2},
         {'text': 'cat', 'score': 3}, 
         {'text': 'sheep', 'score': 4},
        ]
      },
      {
        'questionText': 'What\'s your favorite flower',
        'answersText':[
         {'text': 'rose', 'score': 1}, 
         {'text': 'tulip', 'score': 2},
         {'text': 'lavender', 'score': 3}, 
        ]
      },
     
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _restartQuiz()
  {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score)
  {
    _totalScore += score;

    setState(() {
    _questionIndex = _questionIndex + 1;  
    });
    print(_questionIndex);

    if(_questionIndex < _questions.length)
      print('We have more question');
    else
      print('No more question');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My first app')),
        body: _questionIndex < _questions.length 
        ? Quiz(answerQuestion:  _answerQuestion,
               questionIndex: _questionIndex, 
               questions: _questions) 
        : Result(_totalScore, _restartQuiz)
      ),
    );
  }
}
