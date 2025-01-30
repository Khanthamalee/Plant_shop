import 'package:firebase_shop/data/order/models/product_ordered.dart';
import 'package:firebase_shop/domain/order/entity/product_ordered.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> products;
  final String createData;
  final int itemCount;
  final double totalPrice;
  final String shippingadress;

  OrderRegistrationReq(
      {required this.products,
      required this.createData,
      required this.itemCount,
      required this.totalPrice,
      required this.shippingadress});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((e) => e.fromEntity().toMap()).toList(),
      'createData': createData,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingadress': shippingadress,
    };
  }
}
