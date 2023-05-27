// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.name,
    this.photoUrl,
    this.vote,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  String? name;
  String? photoUrl;
  int? vote;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        photoUrl: json["photoUrl"] == null ? null : json["photoUrl"],
        vote: json["vote"] == null ? null : json["vote"],
        email: json["email"] == null ? null : json["email"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "photoUrl": photoUrl == null ? null : photoUrl,
        "vote": vote == null ? null : vote,
        "email": email == null ? null : email,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
