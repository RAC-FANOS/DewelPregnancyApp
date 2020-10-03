import 'package:flutter/material.dart';
import 'package:dewel/questions/pre_questions.dart';
import 'package:dewel/screens/pre_pregnancy.dart';

class PreBaseTabPage extends StatefulWidget {
  @override
  _PreBaseTabPageState createState() => _PreBaseTabPageState();
}

class _PreBaseTabPageState extends State<PreBaseTabPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Color.fromARGB(255, 190, 0, 99),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            backgroundColor: Color.fromARGB(255, 190, 0, 99),
            title: Text('Questions'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: callPage(_currentIndex),
    );
  }

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return PrePregnancy();
        break;
      case 1:
        return PreQuestions();
        break;
      default:
        return PrePregnancy();
    }
  }
}
