import 'package:dewel/pages/aboutus.dart';
import 'package:dewel/pages/contact_us.dart';
import 'package:dewel/pages/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dewel/tabs/after_base_tab_page.dart';
import 'package:dewel/tabs/during_base_tab_page.dart';
import 'package:dewel/tabs/pre_base_tab_page.dart';

import 'dart:io';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.bubble_chart,
                color: Colors.white,
                size: 25.0,
              ),
              tooltip: 'Tools',
              onPressed: () {
                goToTools();
              },
            )
          ],
          title: Text(
            'Dewel',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontFamily: 'Pacifico',
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [new Color(0xffc0b4), Colors.white],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  )),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      margin: EdgeInsets.only(
                        top: 30.0,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 150.0,
                        backgroundImage: AssetImage("images/pregnant.jpg"),
                      ),
                    ),
                    Text(
                      'Dewel',
                      style: TextStyle(
                        color: Color.fromARGB(255, 190, 0, 99),
                        fontSize: 28.0,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
                title: Text('Home'),
                leading: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 190, 0, 99),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            ListTile(
                title: Text('Tools'),
                leading: Icon(
                  Icons.bubble_chart,
                  color: Color.fromARGB(255, 190, 0, 99),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  goToTools();
                }),
            ListTile(
                title: Text('About Us'),
                leading: Icon(
                  Icons.info,
                  color: Color.fromARGB(255, 190, 0, 99),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  goToAboutUs();
                }),
            ListTile(
                title: Text('Contact Us'),
                leading: Icon(
                  Icons.call,
                  color: Color.fromARGB(255, 190, 0, 99),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  goToHelpCenter();
                }),
//            ListTile(
//                title: Text('Developer Contact'),
//                leading: Icon(
//                  Icons.contact_phone,
//                  color: Color.fromARGB(255, 190, 0, 99),
//                ),
//                onTap: () {
//                  Navigator.of(context).pop();
//                  goToDeveloperContact();
//                }),
            Divider(
              height: 64,
              thickness: 0.5,
              color: Colors.black.withOpacity(0.3),
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              title: Text('Exit'),
              leading: Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(255, 190, 0, 99),
              ),
              onTap: () {
                exit(0);
              },
            )
          ],
        )),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [new Color(0xffc0b4), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ))),
          Container(
            child: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 120.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(children: <Widget>[
                          ClipOval(
                              child: Container(
                            width: 130.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/before.jpg'))),
                            child: FlatButton(
                              onPressed: () => goToPrePregnancy(),
                              child: null,
                            ),
                          )),
                          Text(
                            "Before Pregnancy",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 190, 0, 99),
                            ),
                          )
                        ])
                      ])),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
                  Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(children: <Widget>[
                            ClipOval(
                                child: Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/during2.png'))),
                              child: FlatButton(
                                onPressed: () => goToPDuringPregnancy(),
                                child: null,
                              ),
                            )),
                            Text(
                              "During Pregnancy",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 190, 0, 99),
                              ),
                            )
                          ]),
                        ])),
                Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(children: <Widget>[
                            ClipOval(
                                child: Container(
                              width: 130.0,
                              height: 130.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/after1.png'))),
                              child: FlatButton(
                                onPressed: () => goToAfterPregnancy(),
                                child: null,
                              ),
                            )),
                            Text(
                              "After Pregnancy",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 190, 0, 99),
                              ),
                            )
                          ]),
                        ]))
              ])
            ]),
          ),
          //SideBarLayout()
        ]));
  }

  goToPrePregnancy() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PreBaseTabPage();
    }));
  }

  goToPDuringPregnancy() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DuringBaseTabPage();
    }));
  }

  goToAfterPregnancy() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AfterBaseTabPage();
    }));
  }

  goToAboutUs() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AboutUs();
    }));
  }

  goToHelpCenter() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HelpCenter();
    }));
  }

  goToTools() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Tools();
    }));
  }
}
