class AddToCartReq {
  final String productId;
  final String productTitle;
  final int productQauntity;
  final String productlanguage;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createData;

  AddToCartReq(
      {required this.productId,
      required this.productTitle,
      required this.productQauntity,
      required this.productlanguage,
      required this.productPrice,
      required this.totalPrice,
      required this.productImage,
      required this.createData});

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
    };
  }
}
