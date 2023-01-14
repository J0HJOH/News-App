
import 'package:intl/intl.dart';

class Article{

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content});

  factory Article.fromJson(Map<String, dynamic>json){
    DateTime date = DateFormat("yy-MM-ddtHH : mm : ssZ").parse(json["published At"]);
    var dateToBeShown = DateFormat("yyyy-MM-dd  HH:mm").format(date);

    var jsonContent = json["content"] ?? "";
    List<String> stringList = jsonContent.split("[");
    var content = jsonContent.replaceAll(stringList.last, "");
    return Article(
      author: json["author"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ?? "",
      publishedAt: dateToBeShown ?? "", //year-month-day  hour:min
      content: jsonContent
    );
  }
}