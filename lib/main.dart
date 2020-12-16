import 'package:flutter/material.dart';
import 'package:news_app/article.dart';
import 'package:news_app/article_web_view.dart';
import 'package:news_app/detail_page.dart';
import 'package:news_app/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: myTextTheme.apply(bodyColor: Colors.black),
          elevation: 0,
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: secondaryColor,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(12),
            ))),
        textTheme: myTextTheme,
        primaryColor: primaryColor,
        accentColor: secondaryColor,
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: NewsListPage.routeName,
      routes: {
        NewsListPage.routeName: (context) => NewsListPage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
              article: ModalRoute.of(context).settings.arguments,
            ),
        ArticleWebView.routeName: (context) => ArticleWebView(
              url: ModalRoute.of(context).settings.arguments,
            )
      },
    );
  }
}

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body:
          /* 
      Future Builder : widget ini akan membangun widget berdasarkan
      interaksi terbaru dengan objek Future.
      Dart mendukung proses asynchronous menggunakan Future.
      Proses asynchronous dapat mengembalikan nilai ketika prosesnya
      selesai dijalankan.
      */
          FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
            itemCount: articles.length,
          );
        },
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    /*
    Hero Animation
    bungkus widget image untuk animasi dan tambahkan tag sebagai identifier
    */
    leading: Hero(
      tag: article.urlToImage,
      child: Image.network(
        article.urlToImage,
        width: 100,
      ),
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
    onTap: () {
      Navigator.pushNamed(
        context,
        ArticleDetailPage.routeName,
        arguments: article,
      );
    },
  );
}
