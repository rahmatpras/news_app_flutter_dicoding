import 'package:flutter/material.dart';
import 'package:news_app/article.dart';
import 'package:news_app/article_web_view.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailPage({@required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /*
              Hero Animation
              pada halaman tujuan juga lakukan hal yang sama dengan halaman awal
             */
            Hero(
                tag: article.urlToImage,
                child: Image.network(article.urlToImage)),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(article.description),
                  Divider(color: Colors.grey),
                  Text(article.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )),
                  Divider(color: Colors.grey),
                  Text(
                    article.content,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ArticleWebView.routeName,
                          arguments: article.url);
                    },
                    child: Text('Read more'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
