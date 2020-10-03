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

class FinalDetail extends StatefulWidget {
  final String listTitle, listContent;

  FinalDetail(this.listTitle, this.listContent);

  @override
  State<StatefulWidget> createState() => _FinalDetail(listTitle, listContent);
}

class _FinalDetail extends State<FinalDetail> {
  final String listTitle, listContent;
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

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        compTime = duration.toString().split(".")[0];
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
    });

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

  _FinalDetail(this.listTitle, this.listContent);

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
                          widget.listTitle,
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
                      child: Text(
                        widget.listContent,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
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

    Share.share(listContent,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
