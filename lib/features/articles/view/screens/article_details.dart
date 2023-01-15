import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/article_model.dart';
import 'package:share_plus/share_plus.dart';
import '../widgets/big_post.dart';

class ArticleDetailsPage extends StatefulWidget {
  const ArticleDetailsPage({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async{
                await Share
                    .share("Hi! Checkout this news from NEWS UPDATE APP ${widget.article.url}");
              },
              icon: FaIcon(FontAwesomeIcons.share)
          )
        ],
      ),

      body: ListView(
        children: [
          BigPost(article: widget.article),
          Divider(),
          SizedBox(height: 10),//For spacing
          Container(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Text(
                widget.article.description,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                widget.article.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          MaterialButton(
              onPressed: ()=>readMore(widget.article.url),
            color: Colors.grey[800],
            padding: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            elevation: 15,
            height: 60,
              child: const Text(
                  "Read More....",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
          )
        ],
      ),
    );
  }

  ///A method that opens the browser page using the url
  Future<void> readMore(String url) async {
    var parsedUrl = Uri.parse(url);
    await launchUrl(parsedUrl);

  }
}
