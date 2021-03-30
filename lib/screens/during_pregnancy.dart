import 'package:flutter/material.dart';
import 'package:dewel/screens/getting_nutrients_detail_page.dart';
import 'package:dewel/screens/utility.dart';
import 'package:dewel/screens/getting_nutrients_detail_page.dart';
import 'package:dewel/screens/how_much_weight_detail_page.dart';
import 'package:dewel/screens/what_supplements_detail_page.dart';
import 'final_detail.dart';
//import 'package:pregnantapp/screens/final_detail.dart';

class DuringPregnancy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DuringPregnancy();
}

class _DuringPregnancy extends State<DuringPregnancy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'During Pregnancy',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          backgroundColor: Color.fromARGB(255, 190, 0, 99),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        body: Scaffold(
            body: ListView.builder(
          itemCount: Utility.duringListTitle.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ExpansionTile(
                title: Text(
                  Utility.duringListTitle.elementAt(index),
                  style: TextStyle(fontSize: 20.0),
                ),
                key: PageStorageKey<String>(
                    Utility.duringListTitle.elementAt(index)),
                children: [
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[0][0],
                          Utility.duringDropdownContent[0]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[0][0].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToNutrientsDetailPage();
                    },
                    title: Text(
                      Utility.dropDown[0][1].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToHowMuchWeightDetailPage();
                    },
                    title: Text(
                      Utility.dropDown[0][2].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              );
            } else if (index == 1) {
              return ExpansionTile(
                title: Text(
                  Utility.duringListTitle.elementAt(index),
                  style: TextStyle(fontSize: 20.0),
                ),
                key: PageStorageKey<String>(
                    Utility.duringListTitle.elementAt(index)),
                children: [
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[1][0],
                          Utility.duringDropdownContent[4]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[1][0].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[1][1],
                          Utility.duringDropdownContent[5]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[1][1].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[1][2],
                          Utility.duringDropdownContent[6]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[1][2].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              );
            } else if (index == 2) {
              return ExpansionTile(
                title: Text(
                  Utility.duringListTitle.elementAt(index),
                  style: TextStyle(fontSize: 20.0),
                ),
                key: PageStorageKey<String>(
                    Utility.duringListTitle.elementAt(index)),
                children: [
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[2][0],
                          Utility.duringDropdownContent[7]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[2][0].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[2][1],
                          Utility.duringDropdownContent[8]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[2][1].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[2][2],
                          Utility.duringDropdownContent[9]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[2][2].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[2][3],
                          Utility.duringDropdownContent[10]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[2][3].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              );
            } else if (index == 3) {
              return ExpansionTile(
                title: Text(
                  Utility.duringListTitle.elementAt(index),
                  style: TextStyle(fontSize: 20.0),
                ),
                key: PageStorageKey<String>(
                    Utility.duringListTitle.elementAt(index)),
                children: [
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[3][0],
                          Utility.duringDropdownContent[11]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[3][0].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToWhatSupplementDetailPage();
                    },
                    title: Text(
                      Utility.dropDown[3][1].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[3][2],
                          Utility.duringDropdownContent[13]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[3][2].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              );
            } else if (index == 4) {
              return ExpansionTile(
                title: Text(
                  Utility.duringListTitle.elementAt(index),
                  style: TextStyle(fontSize: 20.0),
                ),
                key: PageStorageKey<String>(
                    Utility.duringListTitle.elementAt(index)),
                children: [
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[4][0],
                          Utility.duringDropdownContent[14]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[4][0].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      goToFinalDetail(
                          Utility.dropDown[4][1],
                          Utility.duringDropdownContent[15]
                              .toString()
                              .replaceAll('[', '')
                              .replaceAll(']', ''));
                    },
                    title: Text(
                      Utility.dropDown[4][1].toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        )));
  }

  goToFinalDetail(String title, String content) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FinalDetail(title, content);
    }));
  }

  goToHowMuchWeightDetailPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HowMuchWeightDetailPage();
    }));
  }

  goToWhatSupplementDetailPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WhatSupplementsDetailPage();
    }));
  }

  goToNutrientsDetailPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GettingNutrientsDetailPage();
    }));
  }
}

class DataSearch extends SearchDelegate<String> {
  _DuringPregnancy during = _DuringPregnancy();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card(
      color: Colors.deepPurpleAccent,
      child: Text('query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    void searchNavigate(String title, String content) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FinalDetail(title, content)));
    }

    final suggestionList = query.isEmpty
        ? Utility.duringlists
        : Utility.duringlists
            .where((p) => p.value.toLowerCase().contains(query))
            .toList();

    return suggestionList.isEmpty
        ? Center(child: Text('No Results Found...'))
        : ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) => ListTile(
                onTap: () {
                  showResults(context);
                  if (suggestionList[index].value ==
                      '	How much weight should I expect to gain?') {
                    during.goToHowMuchWeightDetailPage();
                  } else if (suggestionList[index].value ==
                      '	What supplement are given during pregnancy other than nutrition?') {
                    during.goToWhatSupplementDetailPage();
                  } else if (suggestionList[index].value ==
                      'Getting the nutrients, you need during pregnancy') {
                    during.goToNutrientsDetailPage();
                  } else {
                    searchNavigate(suggestionList[index].value,
                        suggestionList[index].content);
                  }
                },
                title: Text(
                  suggestionList[index].value,
                )),
          );
  }
}
