import 'package:firebase_shop/domain/order/entity/order_status.dart';
import 'package:firebase_shop/domain/order/entity/product_ordered.dart';

class OrderEntity {
  final List<ProductOrderedEntity> products;
  final String createData;
  final int itemCount;
  final double totalPrice;
  final String shippingadress;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity({
    required this.products,
    required this.createData,
    required this.itemCount,
    required this.totalPrice,
    required this.shippingadress,
    required this.code,
    required this.orderStatus,
  });
}
