// To parse this JSON data, do
//
//     final homelistsresponcemodel = homelistsresponcemodelFromJson(jsonString);

import 'dart:convert';

Homelistsresponcemodel homelistsresponcemodelFromJson(String str) =>
    Homelistsresponcemodel.fromJson(json.decode(str));

String homelistsresponcemodelToJson(Homelistsresponcemodel data) =>
    json.encode(data.toJson());

class Homelistsresponcemodel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum>? data;
  Support? support;

  Homelistsresponcemodel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory Homelistsresponcemodel.fromJson(Map<String, dynamic> json) =>
      Homelistsresponcemodel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support?.toJson(),
      };
}

class Datum {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  Datum({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        color: json["color"],
        pantoneValue: json["pantone_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year": year,
        "color": color,
        "pantone_value": pantoneValue,
      };
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
