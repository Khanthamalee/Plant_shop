import 'package:firebase_shop/data/order/models/order_status.dart';
import 'package:firebase_shop/data/order/models/product_ordered.dart';
import 'package:firebase_shop/domain/order/entity/order.dart';

class OrderModel {
  final List<ProductOrderedModel> products;
  final String createData;
  final int itemCount;
  final double totalPrice;
  final String shippingadress;
  final String code;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.products,
    required this.createData,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingadress,
    required this.code,
    required this.orderStatus,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      products: List<ProductOrderedModel>.from(
          map['products'].map((e) => ProductOrderedModel.fromMap(e))),
      createData: map['createData'] as String,
      itemCount: map['itemCount'] as int,
      totalPrice: map['totalPrice'] as double,
      shippingadress: map['shippingadress'] as String,
      code: map['code'] as String,
      orderStatus: List<OrderStatusModel>.from(
          map['orderStatus'].map((e) => OrderStatusModel.fromMap(e))),
    );
  }
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
        products: products.map((e) => e.toEntity()).toList(),
        createData: createData,
        itemCount: itemCount,
        totalPrice: totalPrice,
        shippingadress: shippingadress,
        code: code,
        orderStatus: orderStatus.map((e) => e.toEntity()).toList());
  }
}
