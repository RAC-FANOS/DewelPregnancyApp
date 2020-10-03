import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Contact us"),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 200.0),
              child: Text(
                'We can have both the contact to the club and developers here rather than giving it separate pages',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
          ],
        ));

    //We can have both the contact to the club and developers here rather than giving it separate pages
  }
}
