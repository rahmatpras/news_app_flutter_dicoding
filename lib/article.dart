/* 
class blueprint dari objek articles.json
untuk membaca berkas json tersebut 
*/
import 'dart:convert';

class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  /*
  JSON adalah sebuah penyimpanan data dengan format key-value
  disimpan dengan tipe data Map, karena itulah kita mengubah lagi
  format Map menjadi object yang telah kita buat.
  */
  Article.fromJson(Map<String, dynamic> article) {
    author = article[
        'author']; // key yang ada didalam kurung siku sama persis dengan key yang ada pada file json
    title = article['title'];
    description = article['description'];
    url = article['url'];
    urlToImage = article['urlToImage'];
    publishedAt = article['publishedAt'];
    content = article['content'];
  }
}

// json parsing
List<Article> parseArticles(String json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(
      json); //konversi dari JSON array kebentuk List menggunakan 'dart:convert'
  return parsed.map((json) => Article.fromJson(json)).toList();
}
