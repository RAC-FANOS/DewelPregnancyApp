import 'package:dewel/screens/utility.dart';

class Article {
  String title;
  String content;

  Article(this.title, this.content);
}

List<Article> loadArticles(String type) {
  List<Article> articles;
  if (type == 'pre') {
    articles = Utility.preMap.entries
        .map((entry) => Article(entry.key, entry.value))
        .toList();
  } else if (type == 'after') {
    articles = Utility.preMap.entries
        .map((entry) => Article(entry.key, entry.value))
        .toList();
  }

  return articles;
}
