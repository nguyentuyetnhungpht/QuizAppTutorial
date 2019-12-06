import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final Function resetHandler;
  
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase{
    String resultText;
    if (resultScore <= 5)
    {
      resultText = 'Some incorrect here';
    }
    else if (resultScore <= 8)
    {
      resultText = 'Pretty';
    }
    else if(resultScore <= 11)
    {
      resultText = 'So good';
    }
    else
      resultText = 'You are so bad';
    return resultText;
  }


  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
              children:<Widget>[
                          Text(
                            resultPhrase,
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          FlatButton(child: 
                                      Text('Restart Quiz'),
                                      textColor: Colors.blue,
                                      onPressed: resetHandler,)
              ]
            )
          );
  }
}