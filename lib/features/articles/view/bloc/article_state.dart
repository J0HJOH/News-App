import 'package:news_updates/features/articles/data/repository/article_repository.dart';

import '../../data/model/article_model.dart';

class ArticleState {

  List<Article> listOfArticles = [];

  ArticleState({this.listOfArticles : const []});

  Future<List<Article>> getArticles() async {
    var repo = ArticleRepository();
    return await repo.getAllArticles();
  }

}