import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dewel/screens/home_screen.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'App Name',
    home: SplashScreen(),
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color.fromARGB(255, 190, 0, 99),
      accentColor: Color.fromARGB(255, 255, 77, 196),
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000));

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  colors: [new Color(0xffc0b4), Colors.white],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ))),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            width: 100.0,
            height: 160.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 150.0,
            backgroundImage: AssetImage("images/pregnant.jpg"),
          ),
          Shimmer.fromColors(
              baseColor: Color.fromARGB(255, 190, 0, 99),
              highlightColor: Color.fromARGB(255, 255, 77, 196),
              child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Dewel",
                    style: TextStyle(fontSize: 50.0, fontFamily: 'Pacifico'),
                  ))),
          Container(
            width: 100.0,
            height: 120.0,
          ),
          Image(
            image: AssetImage("images/clublogo.jpg"),
            width: 120.0,
            height: 120.0,
          )
        ]),
      ]),
    );
  }
}
