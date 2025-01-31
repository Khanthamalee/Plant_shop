import 'package:cloud_firestore/cloud_firestore.dart';

class OrderStatusEntity {
  final String title;
  final bool done;
  final Timestamp createDate;

  OrderStatusEntity(
      {required this.title, required this.done, required this.createDate});
}
