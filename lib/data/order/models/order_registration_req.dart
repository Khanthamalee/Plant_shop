import 'package:firebase_shop/data/order/models/order_status.dart';
import 'package:firebase_shop/data/order/models/product_ordered.dart';
import 'package:firebase_shop/domain/order/entity/product_ordered.dart';
import 'package:intl/intl.dart';

class OrderRegistrationReq {
  final String? code;
  final List<ProductOrderedEntity> products;
  final String createData;
  final int itemCount;
  final double totalPrice;
  final String shippingadress;
  final List<OrderStatusModel>? orderStatus;

  OrderRegistrationReq({
    required this.products,
    required this.createData,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingadress,
    this.orderStatus,
    this.code,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': DateFormat("yyyyMMddhhmmss").format(DateTime.now()),
      'products': products.map((e) => e.fromEntity().toMap()).toList(),
      'createData': createData,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingadress': shippingadress,
      "orderStatus": [
        {"title": "Order Placed", "done": true, "createDate": DateTime.now()},
        {
          "title": "Order Confirmed",
          "done": false,
          "createDate": DateTime.now().add(Duration(days: 1))
        },
        {
          "title": "shipped",
          "done": false,
          "createDate": DateTime.now().add(Duration(days: 3))
        },
        {
          "title": "Delivered",
          "done": false,
          "createDate": DateTime.now().add(Duration(days: 4))
        },
      ],
    };
  }
}
