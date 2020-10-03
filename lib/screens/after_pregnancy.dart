import 'package:flutter/material.dart';
import 'package:dewel/screens/final_detail.dart';
import 'package:dewel/screens/utility.dart';

class AfterPregnancy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AfterPregnancy();
}

class _AfterPregnancy extends State<AfterPregnancy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'After Pregnancy',
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
            itemCount: Utility.PreListValues.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListTile(
                      onTap: () {
                        goToFinalDetail(Utility.PreListValues[index],
                            Utility.PreListContent[index]);
                      },
                      title: Text(
                        Utility.PreListValues[index],
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    )),
              );
            },
          ),
        ));
  }

  goToFinalDetail(String title, String content) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FinalDetail(title, content);
    }));
  }
}

class DataSearch extends SearchDelegate<String> {
  _AfterPregnancy pre = _AfterPregnancy();

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
    void searchNavigate(String title, String content) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => FinalDetail(title, content)));
    }

    final suggestionList = query.isEmpty
        ? Utility.PreListValues
        : Utility.PreListValues.where((p) => p.toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
            searchNavigate(
                suggestionList[index], Utility.PreListContent[index]);
          },
          title: Text(
            suggestionList[index],
          )),
      itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    void searchNavigate(String title, String content) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => FinalDetail(title, content)));
    }

    final suggestionList = query.isEmpty
        ? Utility.PreListValues
        : Utility.PreListValues.where((p) => p.toLowerCase().contains(query))
            .toList();
    return suggestionList.isEmpty
        ? Center(child: Text('No Results Found...'))
        : ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) => ListTile(
                onTap: () {
                  showResults(context);
                  searchNavigate(
                      suggestionList[index], Utility.PreListContent[index]);
                },
                title: Text(
                  suggestionList[index],
                )),
          );
  }
}
