// import 'package:meta/meta.dart';
import 'dart:convert';

Tipsjson tipsFromJson(String str) =>
    Tipsjson.fromJson(json.decode(str));

String tipsToJson(Tipsjson data) => json.encode(data.toJson());

class Tipsjson {
  final List<Datum> data;

  Tipsjson({
    required this.data,
  });

  factory Tipsjson.fromJson(Map<String, dynamic> json) => Tipsjson(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final String year;
  final String paper;
  final String marking;
  final String mark;

  Datum({
    required this.year,
    required this.paper,
    required this.marking,
    required this.mark,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    year: json["year"],
    paper: json["paper"],
    marking: json["marking"],
    mark: json["mark"],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "paper": paper,
    "marking": marking,
    "mark": mark,
  };
}
