// To parse this JSON data, do
//
//     final loginresponce = loginresponceFromJson(jsonString);

import 'dart:convert';

Loginresponce loginresponceFromJson(String str) =>
    Loginresponce.fromJson(json.decode(str));

String loginresponceToJson(Loginresponce data) => json.encode(data.toJson());

class Loginresponce {
  String? token;

  Loginresponce({
    this.token,
  });

  factory Loginresponce.fromJson(Map<String, dynamic> json) => Loginresponce(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
