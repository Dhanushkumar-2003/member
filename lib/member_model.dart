// To parse this JSON data, do
//
//     final welcome =memberfromjson(jsonString);

import 'dart:convert';

List<Member> memberfromjson(String str) =>
    List<Member>.from(json.decode(str).map((x) => Member.fromJson(x)));

String membertojson(List<Member> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Member {
  String name;
  int id;
  String image;
  int age;
  bool isFollowing;

  Member({
    required this.name,
    required this.id,
    required this.image,
    required this.age,
    required this.isFollowing,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        name: json["name"],
        id: json["id"],
        image: json["image"],
        age: json["age"],
        isFollowing: json["isFollowing"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "image": image,
        "age": age,
        "isFollowing": isFollowing,
      };
}
