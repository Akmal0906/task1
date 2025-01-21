import 'package:flutter/material.dart';


import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  final List<CartElement> carts;
  final int total;
  final int skip;
  final int limit;

  Cart({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    carts: List<CartElement>.from(json["carts"].map((x) => CartElement.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class CartElement {
  final int id;
  final List<CartProduct> products;
  final double total;
  final double discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;


  CartElement({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartElement.fromJson(Map<String, dynamic> json) => CartElement(
    id: json["id"],
    products: List<CartProduct>.from(json["products"].map((x) => CartProduct.fromJson(x))),
    total: json["total"]?.toDouble(),
    discountedTotal: json["discountedTotal"]?.toDouble(),
    userId: json["userId"],
    totalProducts: json["totalProducts"],
    totalQuantity: json["totalQuantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "discountedTotal": discountedTotal,
    "userId": userId,
    "totalProducts": totalProducts,
    "totalQuantity": totalQuantity,
  };
}

class CartProduct {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final double discountPercentage;
  final double discountedTotal;
  final String thumbnail;
  bool isLiked;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    this.isLiked=false,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    quantity: json["quantity"],
    total: json["total"]?.toDouble(),
    discountPercentage: json["discountPercentage"]?.toDouble(),
    discountedTotal: json["discountedTotal"]?.toDouble(),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "quantity": quantity,
    "total": total,
    "discountPercentage": discountPercentage,
    "discountedTotal": discountedTotal,
    "thumbnail": thumbnail,
  };
}
