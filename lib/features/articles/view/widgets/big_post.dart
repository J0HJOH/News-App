
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../data/model/article_model.dart';
import '../screens/article_details.dart';

class BigPost extends StatelessWidget {
  const BigPost({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigate to the article details page
        Navigator.push(
            context,
          MaterialPageRoute(
              builder: (context)=> ArticleDetailsPage(article: article)
          )
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                imageUrl: article.urlToImage,
                placeholder: (context, url)=> CircularProgressIndicator(),
                errorWidget: (context, url, error) {
                  return  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.chainBroken),
                        Text("Could not load this image")
                      ],
                    ),
                  );
                }
            ),

            Text(
                article.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(article.author),
            Text(
              article.publishedAt
            )
          ],
        ),

      ),
    );
  }
}
