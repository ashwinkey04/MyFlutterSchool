import 'package:flutter/material.dart';
import 'package:quizzler/QuestionBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> score = [];
  QuestionBrain QB = new QuestionBrain();
  int scoreNum=0;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                QB.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (QB.isFinished()) {
                  Alert(
                      context: context,
                      title: "Your score is $scoreNum",
                      desc: "All questions attempted")
                      .show();
                  score = [];
                  scoreNum=0;
                }
                //The user picked true.
                setState(() {
                  if (QB.getAns()) {
                    scoreNum++;
                    score.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    score.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  QB.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (QB.isFinished()) {
                  Alert(
                      context: context,
                      title: "Your score is $scoreNum",
                      desc: "All questions attempted")
                      .show();
                  score = [];
                  scoreNum=0;
                }
                setState(() {
                  scoreNum++;
                  if (!QB.getAns()) {
                    score.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    score.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }

                  QB.nextQuestion();
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', a:false,
question2: 'Approximately one quarter of human bones are in the feet.',a:true,
question3: 'A slug\'s blood is green.',a:true,
*/
