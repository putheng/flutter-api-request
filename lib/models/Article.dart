import 'dart:convert';
import 'package:request/webservice.dart';

class Article
{
  String title;
  String body;

  Article({
    this.title,
    this.body
  });

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      title: json['title'],
      body: json['body'],
    );
  }

  static Resource get all {
    return Resource(
      url: 'posts',
      parse: (response){
        Iterable list = json.decode(response.body);

        return list.map((article) {
          return Article.fromJson(
            article
          );
        })
          .toList();
      }
    );
  }
}