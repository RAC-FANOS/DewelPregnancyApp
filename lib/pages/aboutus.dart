import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('About us'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [new Color(0xffc0b4), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ))),
        ],
      ),
    );
  }
}
