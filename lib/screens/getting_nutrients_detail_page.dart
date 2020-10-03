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

class GettingNutrientsDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GettingNutrientsDetailPage();
}

class _GettingNutrientsDetailPage extends State<GettingNutrientsDetailPage> {
  final String listTitle = 'Getting the nutrients you need during pregnancy';
  final String beforeBold =
      'Your body goes through numerous physical and hormonal changes during pregnancy. The way you nourish your body during this time will affect your health and your baby’s. You must eat a healthful, balanced diet to help ensure you stay healthy throughout your pregnancy. The food you eat is your baby’s main source of nourishment, so it’s critical to consume foods that are rich in nutrients. Proper nutrition can help promote your baby’s growth and development.\n\n By following some fairly easy nutrition guidelines, you can be on your way to a healthy pregnancy.';
  final String afterBold =
      'Your body has increased nutritional needs during pregnancy. Although the old adage saying “double your food intake” isn’t entirely correct, you do require more micro-nutrients and macro-nutrients to support you and your baby.\n\n Micro-nutrients are dietary components, such as vitamins and minerals, that are only required in small amounts. Macro-nutrients are nutrients that provide calories, or energy. These include carbohydrates, proteins, and fats.\n\n To ensure you’re getting all the necessary nutrients eat different foods every day from each of the food groups listed below. In fact, all meals should include at least three different food groups.\n'
      '';
  final String afterTable =
      '''Your body can’t function properly if it’s missing the nutrients from any of these food groups. Remember that your goal is to eat a wide variety of foods during pregnancy. Whenever possible, choose natural, low-fat foods over processed junk foods. Chips and soda, for example, contain no nutritional value. You and your baby will benefit more from fresh fruits, vegetables, and lean proteins, such as chicken, fish, beans, or lentils.\n\n This does not necessarily mean that you need to avoid all of your favorite foods during pregnancy. However, you must balance them with nutritious foods so that you don’t miss any important vitamins or minerals.''';
  final String beforeBullets =
      'Even if you eat a balanced diet, you can still miss out on essential nutrients. A prenatal vitamin, ideally started 3 months before you get pregnant, is recommended to make sure you get all the nutrients needed for a healthy pregnancy. It is also recommended women take prenatal vitamins while breastfeeding.';
  final String theBullets = '''
       • Don’t Overdo fish: 
           No more than 170 grams per week
       • Don’t Consume ALCOHOL or TOBACCO
       • Don’t Consume raw eggs 
       • Don’t Use artificial sweeteners 
       • Don’t Consume empty calories''';

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

  _GettingNutrientsDetailPage();

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
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          beforeBold,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        Container(
                          height: 15.0,
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Increased Nutrients',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ]),
                        ),
                        Container(
                          height: 15.0,
                        ),
                        Text(
                          afterBold,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        Container(
                          height: 15.0,
                        ),
                        Container(
                          margin: EdgeInsets.all(15.0),
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('Food Groups')),
                              DataColumn(label: Text('Benefits')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('Grains')),
                                DataCell(Text('Good source of energy')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Fruits and vegetables')),
                                DataCell(Text(
                                    'Are packed with antioxidants, fiber, and water-soluble and fat-soluble vitamins')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Meats, nuts and legumes')),
                                DataCell(Text(
                                    'Provide your body with protein, folate, and iron')),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Dairy products')),
                                DataCell(Text(
                                    'Great source od calcium and vitamin D')),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          height: 15.0,
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'What and How Much to Eat',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ]),
                        ),
                        Container(
                          height: 15.0,
                        ),
                        Text(
                          afterTable,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        Container(
                          height: 15.0,
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'Should I still take prenatal vitamins if i eat these foods?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ]),
                        ),
                        Container(
                          height: 15.0,
                        ),
                        Text(
                          beforeBullets,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        Container(
                          height: 15.0,
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'The Don\'ts of Pregnancy Nutrition',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ]),
                        ),
                        Container(
                          height: 15.0,
                        ),
                        Text(
                          theBullets,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      ],
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

    Share.share(beforeBold,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
