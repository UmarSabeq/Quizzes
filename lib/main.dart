import 'package:flutter/material.dart';
import 'quizManager.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizManager quiz = QuizManager();
void main() => runApp(Quizzes());

class Quizzes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  List<Icon> score = [];

  void checkAnswers(bool userAnswer) {
    bool correctAnswers = quiz.getAnswer();

    if (quiz.finished()) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Completed",
        desc: "You can click on Reset button if you need to play again",
        buttons: [
          DialogButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                quiz.reset();
                score = [];
                Navigator.pop(context);
              });
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      if (correctAnswers == userAnswer) {
        score.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        (score.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        ));
      }
    }
  }

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
                quiz.getQuestions(),
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
                checkAnswers(true);

                setState(() {
                  quiz.next();
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
                checkAnswers(false);
                setState(() {
                  quiz.next();
                });
              },
            ),
          ),
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}
