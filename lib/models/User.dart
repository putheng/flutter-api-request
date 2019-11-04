import 'dart:convert';
import 'package:request/webservice.dart';

class User
{
  String title;
  String body;

  User({
    this.title,
    this.body
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      title: json['title'],
      body: json['body'],
    );
  }

  String get fullName {
    return this.title;
  }

  static Resource get me {
    return Resource(
      url: 'posts/2',
      parse: (response){
        return User.fromJson(
          json.decode(response.body)
        );
      }
    );
  }
}