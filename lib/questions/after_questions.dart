import 'package:flutter/material.dart';

class AfterQuestions extends StatefulWidget {
  @override
  _AfterQuestionsState createState() => _AfterQuestionsState();
}

class _AfterQuestionsState extends State<AfterQuestions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 190, 0, 99),
      child: Center(
          child: Text(
        'Post Page Questions',
        style: TextStyle(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
      )),
    );
  }
}
