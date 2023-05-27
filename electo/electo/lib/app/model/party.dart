// To parse this JSON data, do
//
//     final party = partyFromJson(jsonString);

import 'dart:convert';

List<Party> partyFromJson(String str) =>
    List<Party>.from(json.decode(str).map((x) => Party.fromJson(x)));

String partyToJson(List<Party> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Party {
  Party({
    this.id,
    this.name,
    this.photoUrl,
    this.slogan,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? photoUrl;
  String? slogan;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Party.fromJson(Map<String, dynamic> json) => Party(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        photoUrl: json["photoUrl"] == null ? null : json["photoUrl"],
        slogan: json["slogan"] == null ? null : json["slogan"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "photoUrl": photoUrl == null ? null : photoUrl,
        "slogan": slogan == null ? null : slogan,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
