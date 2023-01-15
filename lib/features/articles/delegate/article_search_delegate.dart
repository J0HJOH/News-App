
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_updates/features/articles/view/bloc/article_bloc.dart';

import '../data/model/article_model.dart';
import '../view/widgets/big_post.dart';

class ArticleSearchDelegate extends SearchDelegate{
  List<Article> listOfArticles = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    //Initialize the list of articles from article Bloc
    listOfArticles = context.watch<ArticleBloc>().state.listOfArticles;

    //Return the widget to be shown
    return [
      IconButton(
          onPressed: (){
            query = ''; // set query Text field to be empty
          },
          icon: const FaIcon(FontAwesomeIcons.xmarkCircle)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return null;
  }

  @override
  Widget buildResults(BuildContext context) {
   return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(listOfArticles.isEmpty){
      return Center(
        child: Text("Articles has not been loaded yet"),
      );
    }
    //create list
    var listOfQueryItems = [];

    //getting the user query

    //check the query through the list
    for(var article in listOfArticles){
      //during check, we copy to a new list
      var title = article.title.toLowerCase();
      var queryTitle = query.toLowerCase();

      if(title.contains(queryTitle)){
        listOfQueryItems.add(article);
      }
    }
    //display new list
    return ListView.builder(
      itemCount: listOfQueryItems.length,
        itemBuilder: (context, index){
          return BigPost(
            key: Key("$index"),
            article: listOfQueryItems[index],
          );
        }
    );
  }
  
  
}