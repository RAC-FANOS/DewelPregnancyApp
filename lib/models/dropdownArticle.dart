import 'package:dewel/models/article.dart';
import 'package:dewel/screens/utility.dart';

import 'article.dart';

class DropdownArticle {
  String dropdownTitle;
  List<Article> articles;

  DropdownArticle(this.dropdownTitle, this.articles);
}

List<DropdownArticle> loadDropDownArticles(String type) {
  List<DropdownArticle> articles;
  if (type == 'during') {
    for (int i = 0; i < Utility.duringmap.length; i++) {
      List<DropdownArticle> article;
      article = Utility.duringmap[i].entries.map((entry) => DropdownArticle(
          entry.key,
          entry.value.entries
              .map((entry) => Article(entry.key, entry.value))
              .toList()));
      articles.add(article[0]);
    }
  }
  return articles;
}
