import 'package:dewel/models/article.dart';
import 'package:flutter/material.dart';
import 'package:dewel/screens/utility.dart';
import 'package:dewel/screens/final_detail.dart';
import 'package:dewel/questions/pre_questions.dart';

class PrePregnancy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrePregnancy();
}

class _PrePregnancy extends State<PrePregnancy> {
  List<Article> articles = loadArticles('pre');
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pre Pregnancy'),
          backgroundColor: Color.fromARGB(255, 190, 0, 99),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                }),
          ],
        ),
        body: Scaffold(
          body: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListTile(
                      onTap: () {
                        goToFinalDetail(
                            articles[index].title, articles[index].content);
                      },
                      title: Text(
                        articles[index].title,
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

  void goToFinalDetail(String title, String content) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FinalDetail(title, content);
    }));
  }
}

class DataSearch extends SearchDelegate<String> {
  _PrePregnancy pre = _PrePregnancy();

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
        ? loadArticles('pre')
        : loadArticles('pre')
            .where((p) => p.title.toLowerCase().contains(query))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
            searchNavigate(
                suggestionList[index].title, suggestionList[index].content);
          },
          title: Text(
            suggestionList[index].title,
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
        ? loadArticles('pre')
        : loadArticles('pre')
            .where((p) => p.title.toLowerCase().contains(query))
            .toList();
    return suggestionList.isEmpty
        ? Center(child: Text('No Results Found...'))
        : ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) => ListTile(
                onTap: () {
                  showResults(context);
                  searchNavigate(suggestionList[index].title,
                      suggestionList[index].content);
                },
                title: Text(
                  suggestionList[index].title,
                )),
          );
  }
}
