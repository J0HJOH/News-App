import 'package:equatable/equatable.dart';

import '../../data/model/article_model.dart';

abstract class ArticleEvent extends Equatable {}

class LoadArticle extends ArticleEvent {
  Article article;

  LoadArticle(this.article);


  @override
  // TODO: implement props
  List<Object?> get props => [];

}