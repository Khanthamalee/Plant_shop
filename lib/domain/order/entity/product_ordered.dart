class ProductOrderedEntity {
  final String productId;
  final String productTitle;
  final int productQauntity;
  final String productlanguage;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createData;

  ProductOrderedEntity(
      {required this.productId,
      required this.productTitle,
      required this.productQauntity,
      required this.productlanguage,
      required this.productPrice,
      required this.totalPrice,
      required this.productImage,
      required this.createData});
}
