// import 'package:meta/meta.dart';
import 'dart:convert';

Cmathsjson temperaturesFromJson(String str) =>
    Cmathsjson.fromJson(json.decode(str));

String temperaturesToJson(Cmathsjson data) => json.encode(data.toJson());

class Cmathsjson {
  final List<Datum> data;

  Cmathsjson({
    required this.data,
  });

  factory Cmathsjson.fromJson(Map<String, dynamic> json) => Cmathsjson(
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
