import 'dart:convert';

import '../../../domain/product/entities/booNo.dart';

class BooknoModel {
  final String title;
  final int price;
  final String image;

  BooknoModel({required this.image, required this.title, required this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
      'image': image,
    };
  }

  factory BooknoModel.fromMap(Map<String, dynamic> map) {
    print("map in BooknoModel :$map");
    return BooknoModel(
      title: map['title'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BooknoModel.fromJson(Map<String, dynamic> source) =>
      BooknoModel.fromMap(source);
}

extension BooknoXModel on BooknoModel {
  BooknoEntity toEntity() {
    return BooknoEntity(
      title: title,
      price: price,
      image: image,
    );
  }
}
