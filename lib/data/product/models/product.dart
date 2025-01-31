import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_shop/data/product/models/bookNo.dart';
import 'package:firebase_shop/data/product/models/member.dart';

import '../../../domain/product/entities/product.dart';

class ProductModel {
  final String categoryId;
  final String title;
  final int sellno;
  final String productId;
  final Timestamp createDate;
  final List<String> image;
  late MemberModel memberModel;
  late List<BooknoModel> booknoModel;

  ProductModel(
      {required this.categoryId,
      required this.title,
      required this.sellno,
      required this.createDate,
      required this.image,
      required this.productId,
      required this.memberModel,
      required this.booknoModel});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'title': title,
      'image': image,
      'sellno': sellno,
      'createDate': createDate,
      'productId': productId,
      'memberModel': memberModel,
      'booknoModel': booknoModel,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
      title: map['title'] as String,
      sellno: map['sellno'] as int,
      createDate: map['createDate'] as Timestamp,
      image: List<String>.from(map['image'].map((e) => e.toString())),
      productId: map['productId'] as String,
      memberModel: MemberModel.fromMap({
        "member": {
          "general": {
            "discountedPrice": map["member"]["general"]["discountedPrice"].toString(),
          },
          "VIP": {"discountedPrice": map["member"]["VIP"]["discountedPrice"].toString()}
        }
      }),
      booknoModel: List<BooknoModel>.from(
          map['Bookno'].map((e) => BooknoModel.fromMap(e))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(Map<String, dynamic> source) =>
      ProductModel.fromMap(source);
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
        categoryId: categoryId,
        title: title,
        sellno: sellno,
        createDate: createDate,
        image: image,
        productId: productId,
        memberModel: memberModel.toEntity(),
        booknoModel: booknoModel.map((e) => e.toEntity()).toList());
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
        categoryId: categoryId,
        title: title,
        sellno: sellno,
        createDate: createDate,
        image: image,
        productId: productId,
        memberModel: memberModel.fromEntity(),
        booknoModel: booknoModel.map((e) => e.fromEntity()).toList());
  }
}