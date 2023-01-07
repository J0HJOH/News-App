 import 'dart:convert';

import 'package:http/http.dart' as http;

import '../features/articles/data/model/article_model.dart';


///This class is responsible for handling api request to the server- newsapi.org
class NewsApiService{

  final _baseUrl = "https://newsapi.org/v2";
  final _apiKey = "038f4956af644563a1c184760a6ddda7";

  ///fetch articles and return to app
  Future<List<Article>> getAllArticles() async {
    var endPoint =
    "top-headlines?country=us&apiKey=$_apiKey";
    var fullUrl = _baseUrl + endPoint;

    //create an empty list to be returned
    var listToBeReturned = <Article>[];

    //Makes a network request
    http.Response response = await http.get(Uri.parse(fullUrl));

    //jsonDecode converts the responseBody which comes
    // as a string into a map object
    Map<String, dynamic> responseBody  = jsonDecode(response.body);

    //filters through the map and get list of articles
    List<Map<String, dynamic>> listOfArticles = responseBody["articles"];

    //loops through the list and converts the map to article object
    for(Map<String, dynamic> articleItem in listOfArticles){
      listToBeReturned.add(Article.fromJson(articleItem));
    };

    return listToBeReturned;
  }
}