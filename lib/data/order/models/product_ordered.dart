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

  ProductOrderedModel(
      {required this.productId,
      required this.productTitle,
      required this.productQauntity,
      required this.productlanguage,
      required this.productPrice,
      required this.totalPrice,
      required this.productImage,
      required this.createData});

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
    );
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
        createData: createData);
  }
}
