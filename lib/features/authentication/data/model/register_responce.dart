// To parse this JSON data, do
//
//     final registerresponce = registerresponceFromJson(jsonString);

import 'dart:convert';

Registerresponce registerresponceFromJson(String str) =>
    Registerresponce.fromJson(json.decode(str));

String registerresponceToJson(Registerresponce data) =>
    json.encode(data.toJson());

class Registerresponce {
  int? id;
  String? token;

  Registerresponce({
    this.id,
    this.token,
  });

  factory Registerresponce.fromJson(Map<String, dynamic> json) =>
      Registerresponce(
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
      };
}
