import '../../../domain/order/entity/product_ordered.dart';

class CartHelper {
  static double calculateCartSubTotal(List<ProductOrderedEntity> products) {
    double subtotalPrice = 0;
    for (var e in products) {
      subtotalPrice = subtotalPrice + e.totalPrice;
    }
    return subtotalPrice;
  }

  static double calculateCartShippingCost(List<ProductOrderedEntity> products) {
    return products.length * 50;
  }

  static double calculateCartTex(double subtotalPrice) {
    return subtotalPrice * 7 / 100;
  }

  static double calculateCartTotal(
      double subtotalPrice, double shippingCost, double cartTex) {
    return subtotalPrice + shippingCost + cartTex;
  }
}
