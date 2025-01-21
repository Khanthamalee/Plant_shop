class MemberEntity {
  late DiscountedPriceEntity general;
  late DiscountedPriceEntity VIP;

  MemberEntity({required this.general, required this.VIP});
}

class DiscountedPriceEntity {
  final String discountedPrice;

  DiscountedPriceEntity({required this.discountedPrice});
}
