import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';

  final String url;

  const ArticleWebView({@required this.url});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body:
          /*
        Widget Web View berfungsi untuk menampilkan halaman web anda ketampilan
        mobile. Secara default fitur JavaScript pada web anda akan dinonaktifkan.
        Untuk mengaktifkan Java Script, dapat menambahkan parameter javaScriptMode
        seperti berikut:
        javasriptMode: JavascriptMode.unrestricted
      */
          WebView(
        initialUrl: url,
      ),
    );
  }
}
