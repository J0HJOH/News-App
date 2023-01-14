  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_updates/features/articles/data/model/article_model.dart';
import 'package:news_updates/features/articles/view/bloc/article_bloc.dart';
import 'package:news_updates/features/articles/view/widgets/big_post.dart';

import '../bloc/article_events.dart';

class ArticlesPage extends StatefulWidget {
    const ArticlesPage({Key? key}) : super(key: key);

    @override
    State<ArticlesPage> createState() => _ArticlesPageState();
  }

  class _ArticlesPageState extends State<ArticlesPage> {

  @override
  void initState() {
    super.initState();

    //Trigger the load event
    context.read<ArticleBloc>().add(LoadArticle());
  }
    @override
    Widget build(BuildContext context) {

    //Subscribe to the bloc
      var articleBloc = context.watch<ArticleBloc>();
      List<Article> listOfArticles = articleBloc.state.listOfArticles;

      return Scaffold(
        body: listOfArticles.isEmpty
            ? const Center(
                child: CircularProgressIndicator()
              )
            : ListView.builder(
              itemCount: listOfArticles.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    BigPost(article: listOfArticles[index]),
                    Divider()
                  ],
                );
              }
          ),
      );
    }
  }
