import 'package:firebase_shop/domain/order/entity/product_ordered.dart';

class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final int productQauntity;
  final String productlanguage;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createData;
  final String id;

  ProductOrderedModel(
      {required this.productId,
      required this.productTitle,
      required this.productQauntity,
      required this.productlanguage,
      required this.productPrice,
      required this.totalPrice,
      required this.productImage,
      required this.createData,
      required this.id});

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productQauntity: map['productQauntity'] as int,
      productlanguage: map['productlanguage'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      productImage: map['productImage'] as String,
      createData: map['createData'] as String,
      id: map['id'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productQauntity': productQauntity,
      'productlanguage': productlanguage,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createData': createData,
      'id': id,
    };
  }
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
        productId: productId,
        productTitle: productTitle,
        productQauntity: productQauntity,
        productlanguage: productlanguage,
        productPrice: productPrice,
        totalPrice: totalPrice,
        productImage: productImage,
        createData: createData,
        id: id);
  }
}

extension ProductOrderedXEntity on ProductOrderedEntity {
  ProductOrderedModel fromEntity() {
    return ProductOrderedModel(
        productId: productId,
        productTitle: productTitle,
        productQauntity: productQauntity,
        productlanguage: productlanguage,
        productPrice: productPrice,
        totalPrice: totalPrice,
        productImage: productImage,
        createData: createData,
        id: id);
  }
}
