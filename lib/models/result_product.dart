import 'dart:convert';

import 'category.dart';

List<Resultproduct> resultproductFromJson(String str) =>
    List<Resultproduct>.from(
        json.decode(str).map((x) => Resultproduct.fromJson(x)));

String resultproductToJson(List<Resultproduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Resultproduct {
  int id;
  String title;
  int price;
  String description;
  List<String> images;
  DateTime creationAt;
  DateTime updatedAt;
  Category category;

  Resultproduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory Resultproduct.fromJson(Map<String, dynamic> json) => Resultproduct(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "category": category.toJson(),
      };
}
