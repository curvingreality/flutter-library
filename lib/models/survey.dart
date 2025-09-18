import 'package:flutter/cupertino.dart';

class CuReSurveyQuestion {
  final String question;
  final List<CuReSurveyAnswer> answers;
  final bool required;
  final bool multipleChoices;
  final int? maxChoices;

  CuReSurveyQuestion(
      {required this.question,
      required this.answers,
      this.required = false,
      this.multipleChoices = false,
      this.maxChoices});
}

class CuReSurveyAnswer {
  final int id;
  final IconData? icon;
  final String text;

  CuReSurveyAnswer({this.icon, required this.text, required this.id});
}
