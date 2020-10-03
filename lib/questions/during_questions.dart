import 'package:flutter/material.dart';

class DuringQuestions extends StatefulWidget {
  @override
  _DuringQuestionsState createState() => _DuringQuestionsState();
}

class _DuringQuestionsState extends State<DuringQuestions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 190, 0, 99),
      child: Center(
          child: Text(
        'During Page Questions',
        style: TextStyle(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
      )),
    );
  }
}
