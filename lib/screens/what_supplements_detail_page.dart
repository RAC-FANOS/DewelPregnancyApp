import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:share/share.dart';

class WhatSupplementsDetailPage extends StatefulWidget {
  WhatSupplementsDetailPage();

  @override
  State<StatefulWidget> createState() => _WhatSupplementsDetail_page();
}

class _WhatSupplementsDetail_page extends State<WhatSupplementsDetailPage> {
  final String listTitle =
      'What supplement are given during pregnancy other than nutrition?';
  final String beforeTable = '''   
  When you’re pregnant, you need more of some nutrients, including folate Iron and Iodine. 
      
  It is recommended that all pregnant women take iron with folic acid (FeFol) and prenatal vitamin, ideally started 3 months before getting pregnant, to make sure you get all the nutrients needed for a healthy pregnancy. 
            
  Note that: Even if you eat a balanced diet, you can still miss out on essential nutrients.
              ''';

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String mp3Uri;
  String currentTime = "00:00";
  String compTime = "00:00";
  Duration duration = Duration();
  Duration position = Duration();

  void onComplete() {
    setState(() {
      isPlaying = false;
    });
  }

  @override
  void initState() {
    _load();
    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        compTime = duration.toString().split(".")[0];
      });
    });

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      onComplete();
    });

    /*  audioPlayer.durationHandler = (d) => setState(() {
          duration = d;
        });

    audioPlayer.positionHandler = (p) => setState(() {
          position = p;
        });
 */
    super.initState();
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  void backToLastScreen() {
    Navigator.pop(context);
    audioPlayer.stop();
    isPlaying = false;
  }

  Future<Null> _load() async {
    final ByteData data = await rootBundle.load('audio/Glitter.mp3');
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/audio/Glitter.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
    print('finished loading, uri=$mp3Uri');
  }

  void _playSound() {
    if (mp3Uri != null) {
      audioPlayer.play(mp3Uri, isLocal: true);
    }
  }

  _WhatSupplementsDetail_page();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print(" backed from button");
          backToLastScreen();
          return;
        },
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  backToLastScreen();
                  print('backed from top');
                },
              ),
              title: Text(
                listTitle,
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              backgroundColor: Color.fromARGB(255, 190, 0, 99),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.share,
                  ),
                  onPressed: () {
                    share(context);
                  },
                )
              ],
            ),
            body: Stack(fit: StackFit.expand, children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        colors: [new Color(0xffc0b4), Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ))),
              ListView(
                children: <Widget>[
                  Stack(children: <Widget>[
                    /*  Image(
                  image: AssetImage('images/pregnant.jpg'),
                  fit: BoxFit.fitWidth,
                ), */
                    Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: CircleAvatar(
                              radius: 35.0,
                              backgroundColor:
                                  Color.fromARGB(255, 255, 77, 196),
                              child: Center(
                                  child: IconButton(
                                onPressed: () {
                                  if (isPlaying) {
                                    audioPlayer.pause();
                                    setState(() {
                                      isPlaying = false;
                                    });
                                  } else {
                                    _playSound();
                                    setState(() {
                                      isPlaying = true;
                                    });
                                  }
                                },
                                icon: Icon(
                                  isPlaying ? Icons.pause : Icons.play_arrow,
                                  size: 35.0,
                                  color: Colors.white,
                                ),
                              )),
                            ))),
                  ]),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.only(left: 80.0, top: 10.0),
                          child: Row(children: <Widget>[
                            Text(
                              currentTime,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Slider(
                              activeColor: Color.fromARGB(255, 190, 0, 99),
                              value: position.inSeconds.toDouble(),
                              min: 0.0,
                              max: duration.inSeconds.toDouble(),
                              /* min: double.parse(currentTime.toString()),
                          max: double.parse(compTime.toString()), */
                              onChanged: (double value) {
                                setState(() {
                                  seekToSecond(value.toInt());
                                  value = value;

                                  var max = duration.inSeconds.toDouble();

                                  if (value == max) {
                                    setState(() {
                                      isPlaying = false;
                                    });
                                  }
                                });
                              },
                            ),
                            Text(compTime,
                                style: TextStyle(fontWeight: FontWeight.w500))
                          ]))),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 24.0, right: 24.0, left: 24.0),
                      child: Center(
                        child: Text(
                          listTitle,
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.8,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 190, 0, 99)),
                        ),
                      )),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            beforeTable,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          DataTable(
                            columns: [
                              DataColumn(label: Text('Supplements')),
                              DataColumn(label: Text('Benefits')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('Folic acid')),
                                DataCell(Text(
                                    'Helps prevent neural tube defects, such as spina bifida')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Iodine')),
                                DataCell(Text(
                                    'Needed for brain and nervous system development')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Iron')),
                                DataCell(Text(
                                    'Helps prevent anemia in the mother, as well as low birth weight in the baby')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Vitamin B12')),
                                DataCell(Text(
                                    'Support the development of the baby’s nervous system. ')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Vitamin D')),
                                DataCell(Text(
                                    'support the development of the baby’s skeleton')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Vitamin C')),
                                DataCell(Text(
                                    'helps improve the adsorption of iron from your diet.')),
                              ]),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ])));
  }

  void share(BuildContext context) {
    audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });

    final RenderBox box = context.findRenderObject();

    Share.share(beforeTable,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
