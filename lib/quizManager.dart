import 'dart:ffi';

import 'question.dart';

class QuizManager {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('The capital of Libya is Benghazi', false),
    Question(
        'Brazil is the only country in the Americas to have the official language of Portuguese',
        true),
    Question('The highest mountain in England is Ben Nevis', false),
    Question(
        'I should go to the emergency room for a test to make sure I don’t have COVID-19',
        false),
    Question('You can carry the virus for 14 days before showing any symptoms.',
        true),
    Question('Most people who get COVID-19 need to go to the hospital.', false),
    Question('I should wear a mask to protect from getting COVID-19.', true),
    Question(
        'The virus that causes COVID-19 can live on surfaces up to several days.',
        true),
    Question('COVID-19 does not affect kids.', false),
    Question(
        'The virus that causes COVID-19 spreads primarily through respiratory droplets.',
        true),
    Question('Antibiotics can prevent and treat COVID-19.', false)
  ];

  void next() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestions() {
    return _questionBank[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool finished() {
    if (_questionBank.length - 1 <= _questionNumber) {
      return true;
    } else {
      return false;
    }
  }

  Void reset() {
    _questionNumber = 0;
  }
}
