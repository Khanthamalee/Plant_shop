import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_shop/domain/product/entities/booNo.dart';
import 'package:firebase_shop/domain/product/entities/member.dart';

class ProductEntity {
  final String categoryId;
  final String title;
  final int sellno;
  final Timestamp createDate;
  final List<String> image;
  final String productId;
  late MemberEntity memberModel;
  late List<BooknoEntity> booknoModel;

  ProductEntity(
      {required this.categoryId,
      required this.title,
      required this.sellno,
      required this.createDate,
      required this.image,
      required this.productId,
      required this.memberModel,
      required this.booknoModel});
}
