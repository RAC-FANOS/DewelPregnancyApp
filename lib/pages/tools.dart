import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  Padding toolsCard(String imageVal, String title) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
          child: FittedBox(
        child: Material(
          elevation: 5.0,
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Theme.of(context).primaryColor,
          child: Row(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.asset(imageVal),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tools',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        backgroundColor: Theme.of(context).primaryColor,
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
          ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              toolsCard('images/movement.png', 'Fetus Movement Tracker'),
              toolsCard('images/calender2.jpg', 'Calender Methods'),
              toolsCard('images/other1.png', 'Other Stuff They Asked'),
            ],
          ),
        ],
      ),
    );
  }
}
