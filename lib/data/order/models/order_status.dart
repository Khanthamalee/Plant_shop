import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_shop/domain/order/entity/order_status.dart';

class OrderStatusModel {
  final String title;
  final bool done;
  final Timestamp createDate;

  OrderStatusModel(
      {required this.title, required this.done, required this.createDate});

  factory OrderStatusModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusModel(
        title: map['title'] as String,
        done: map['done'] as bool,
        createDate: map['createDate'] as Timestamp);
  }
}

extension OrderStatusXModel on OrderStatusModel {
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(title: title, done: done, createDate: createDate);
  }
}
