import 'dart:convert';

import 'package:flutter_app/generated/json/HomeModel.g.dart';

import '../generated/json/base/json_field.dart';

@JsonSerializable()
class HomeModel {
  late List<Banner> banners;
  late List<Product> products;
  late String ad;

  HomeModel();

  factory HomeModel.fromJson(Map<String, dynamic> json) => $HomeModelFromJson(json);

  Map<String, dynamic> toJson() => $HomeModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class Banner {
  late int id;
  late String image;
  late Category? category;
  late dynamic product;

  Banner();

  factory Banner.fromJson(Map<String, dynamic> json) => $BannerFromJson(json);

  Map<String, dynamic> toJson() => $BannerToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class Category {
  late int id;
  late String image;
  late String name;

  Category();

  factory Category.fromJson(Map<String, dynamic> json) => $CategoryFromJson(json);

  Map<String, dynamic> toJson() => $CategoryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class Product {
  late int id;
  late double price;

  // final double oldPrice;
  // final int discount;
  late String image;
  late String name;
  late String description;
  late List<String> images;
  late bool inFavorites;
  late bool inCart;

  Product();

  factory Product.fromJson(Map<String, dynamic> json) => $ProductFromJson(json);

  Map<String, dynamic> toJson() => $ProductToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
