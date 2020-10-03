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

class HowMuchWeightDetailPage extends StatefulWidget {
  HowMuchWeightDetailPage();

  @override
  State<StatefulWidget> createState() => _HowMuchWeightDetailPage();
}

class _HowMuchWeightDetailPage extends State<HowMuchWeightDetailPage> {
  final String listTitle = 'How much weight should I expect to gain?';
  final String afterContainer = '''
  Weight gain during pregnancy is important for the development and growth of your baby.  
             
  Weight gain for normal BMI (18.5-24.9) is between 0 kg - 1.8 kg during the first 12 week of pregnancy. And 0.45 kg per week after 12th week of pregnancy.
             
  Remember pregnancy is not the right time to diet or lose weight as it could prevent your baby from getting essential nutrients.  
             
  Ideal weight gain during pregnancy depends on your pre-pregnancy BMI.
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

  _HowMuchWeightDetailPage();

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
                          Container(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(width: 2.0, color: Colors.red),
                              bottom: BorderSide(width: 2.0, color: Colors.red),
                              left: BorderSide(width: 2.0, color: Colors.red),
                              right: BorderSide(width: 2.0, color: Colors.red),
                            )),
                            child: Text(
                                '''Please calculate your BMI before you proceed 
                                
      How do I calculate my BMI?
                     
      BMI= weight in kg/ (height in meter) 2
'''),
                          ),
                          Container(
                            height: 15.0,
                          ),
                          Text(
                            afterContainer,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          DataTable(
                            columns: [
                              DataColumn(
                                  label: Text('Your pre-pregnancy \nBMI')),
                              DataColumn(
                                  label: Text(
                                      'Target weight\n if carrying one child')),
                              DataColumn(
                                  label: Text(
                                      'Target weight\n if carrying Twins')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('Less than 18.5')),
                                DataCell(Text('12 to 18kgs')),
                                DataCell(Text('-')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('18.5 to 24.9')),
                                DataCell(Text('11 to 16kgs')),
                                DataCell(Text('16 to 25kgs')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('25 to 29.9')),
                                DataCell(Text('7 to  11kgs')),
                                DataCell(Text('14 to 22kgs')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('30 or higher')),
                                DataCell(Text('5 to  9kgs')),
                                DataCell(Text('12 to 19kgs')),
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

    Share.share(afterContainer,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
