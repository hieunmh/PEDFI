import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

CryptoNews cryptoNewsFromJson(String str) =>
    CryptoNews.fromJson(json.decode(str));

class CryptoNews {
  CryptoNews({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;

  factory CryptoNews.fromJson(Map<String, dynamic> json) => CryptoNews(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    // this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  // DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        //  publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );
}

fetchNews() async {
  var datef = DateFormat.yMMMd();
  var date = datef.format(DateTime.now());
  var pdate = datef.format(DateTime.now().subtract(Duration(days: 1)));

  String url =
      "https://newsapi.org/v2/everything?q=crypto&from=$pdate&to=$date&sortBy=publishedAt&apiKey=44fff84f274244c9854593b49df128a3";

  Uri uri = Uri.parse(url);
  final response = await http.get(uri);

  final decodedRes = await json.decode(response.body);

  log(decodedRes.toString(), name: 'fetchNews');
  return CryptoNews.fromJson(decodedRes);
}
