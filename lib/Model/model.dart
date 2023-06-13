import 'dart:convert';
import 'dart:ffi';

class PersonModel {
  final String? name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;

  PersonModel({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
  });
  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
    );
  }
}

class PostApiRes {
  final int? id;
  final String? title;
  final String? body;
  final int? userId;

  PostApiRes({this.body, this.id, this.title, this.userId});
  factory PostApiRes.fromJson(Map<String, dynamic> json) {
    return PostApiRes(body: json["body"], id: json["id"], title: json["title"], userId: json["userId"]);
  }
}
