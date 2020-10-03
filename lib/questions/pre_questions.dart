import 'package:flutter/material.dart';

class PreQuestions extends StatefulWidget {
  @override
  _PreQuestionsState createState() => _PreQuestionsState();
}

class _PreQuestionsState extends State<PreQuestions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 190, 0, 99),
      child: Center(
          child: Text(
        'Pre Page Questions',
        style: TextStyle(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
      )),
    );
  }
}
