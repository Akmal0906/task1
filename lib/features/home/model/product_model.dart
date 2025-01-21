//part 'product_model.g.dart';

import 'dart:convert';

//@HiveType(typeId: 1)
class ProductElement {
 // @HiveField(0)
  final int id;
 // @HiveField(1)
  final String title;
  //@HiveField(2)
  final String description;
 // @HiveField(3)
  final double price;
 // @HiveField(4)
  final double discountPercentage;
 // @HiveField(5)
  final double rating;
 // @HiveField(6)
  final String? brand;
 // @HiveField(7)
  final int weight;
 // @HiveField(8)
   bool isLiked;
 // @HiveField(9)
  final List<String>images;

  ProductElement({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    this.brand,
    required this.images,

    this.isLiked = false,
    required this.weight,


  });

  factory ProductElement.fromJson(Map<String, dynamic> json) =>
      ProductElement(
        id: json["id"],
        isLiked: json["isLiked"] ?? false,
        title: json["title"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        images: List<String>.from(json["images"].map((x) => x)),
        brand: json["brand"],

        weight: json["weight"],


      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "brand": brand,
        "weight": weight,

        "isLiked": isLiked ?? false,
      };
}

