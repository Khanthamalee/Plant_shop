import 'dart:convert';

import '../../../domain/product/entities/booNo.dart';

class BooknoModel {
  final String title;
  final int price;

  BooknoModel({required this.title, required this.price});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
    };
  }

  factory BooknoModel.fromMap(Map<String, dynamic> map) {
    print("map in BooknoModel :$map");
    return BooknoModel(
      title: map['title'] as String,
      price: map['price'] as int,
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
    );
  }
}
