import 'dart:convert';

import '../../../domain/product/entities/booNo.dart';

class BooknoModel {
  final String Id;
  final String title;
  final int price;
  final String image;
  final String description;

  BooknoModel(
      {required this.Id,
      required this.image,
      required this.title,
      required this.price,
      required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': Id,
      'title': title,
      'price': price,
      'image': image,
      'description': description,
    };
  }

  factory BooknoModel.fromMap(Map<String, dynamic> map) {
    //print("map in BooknoModel :$map");
    return BooknoModel(
      Id: map['Id'] as String,
      title: map['title'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BooknoModel.fromJson(Map<String, dynamic> source) =>
      BooknoModel.fromMap(source);
}

extension BooknoXModel on BooknoModel {
  BooknoEntity toEntity() {
    return BooknoEntity(
      Id: Id,
      title: title,
      price: price,
      image: image,
      description: description,
    );
  }
}

extension BooknoXEntity on BooknoEntity {
  BooknoModel fromEntity() {
    return BooknoModel(
      Id: Id,
      title: title,
      price: price,
      image: image,
      description: description,
    );
  }
}
