
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/model/article_model.dart';

class BigPost extends StatelessWidget {
  const BigPost({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CachedNetworkImage(
              imageUrl: article.urlToImage,
              placeholder: (context, url)=> CircularProgressIndicator(),
              errorWidget: (context, url, error) => Column(
                children: [
                  Icon(Icons.error),
                  Text("An Error occurred")
                ],
              )
          ),

          Text(article.title),
          Text(article.author),
          Text(
            DateFormat.yMMMMEEEEd(article.publishedAt).toString();
          )
        ],
      ),

    );
  }
}
