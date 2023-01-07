
import 'package:news_updates/services/news_api_service.dart';

import '../model/article_model.dart';

class ArticleRepository{
  var apiService = NewsApiService();

  Future<List<Article>> getAllArticles() async {
    return apiService.getAllArticles();

  }
}