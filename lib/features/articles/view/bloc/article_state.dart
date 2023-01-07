
import 'package:equatable/equatable.dart';

import '../../data/model/article_model.dart';

class ArticleState extends Equatable {

  List<Article> listOfArticles;

  ArticleState(this.listOfArticles);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}