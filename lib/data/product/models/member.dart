import 'dart:convert';

import '../../../domain/product/entities/member.dart';

class MemberModel {
  late DiscountedPriceModel general;
  late DiscountedPriceModel VIP;

  MemberModel({required this.general, required this.VIP});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'member': general,
      'VIP': VIP,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    print("map in MemberModel :${map["member"]['general']}");
    return MemberModel(
      general: DiscountedPriceModel.fromMap(map["member"]['general']),
      VIP: DiscountedPriceModel.fromMap(map["member"]['VIP']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberModel.fromJson(Map<String, dynamic> source) =>
      MemberModel.fromMap(source);
}

extension MemberXModel on MemberModel {
  MemberEntity toEntity() {
    return MemberEntity(
      general: general.toEntity(),
      VIP: VIP.toEntity(),
    );
  }
}

class DiscountedPriceModel {
  final String discountedPrice;

  DiscountedPriceModel({required this.discountedPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'discountedPrice': discountedPrice,
    };
  }

  factory DiscountedPriceModel.fromMap(Map<String, dynamic> map) {
    print(" map in DiscountedPriceModel :$map");
    return DiscountedPriceModel(
        discountedPrice: map['discountedPrice']);
  }

  String toJson() => json.encode(toMap());

  factory DiscountedPriceModel.fromJson(Map<String, dynamic> source) =>
      DiscountedPriceModel.fromMap(source);
}

extension DiscountedPriceXModel on DiscountedPriceModel {
  DiscountedPriceEntity toEntity() {
    return DiscountedPriceEntity(
      discountedPrice: discountedPrice,
    );
  }
}
