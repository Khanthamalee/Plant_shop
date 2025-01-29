import 'package:firebase_shop/domain/entity/user.dart';
import 'package:firebase_shop/domain/product/entities/product.dart';

class ProductPriceHelper {
  static String provideCurrentPrice(
      ProductEntity product, UserEntity user, int index) {
    double discountedgen =
        double.parse(product.memberModel.general.discountedPrice);
    double discountedvip =
        double.parse(product.memberModel.VIP.discountedPrice);
    return user.gender == 1
        ? "Spacial ${product.memberModel.general.discountedPrice}% discount remaining ${(product.booknoModel[index].price - (product.booknoModel[index].price * discountedgen / 100)).round()} Baht"
        : "Spacial ${product.memberModel.VIP.discountedPrice}% discount remaining${(product.booknoModel[index].price - (product.booknoModel[index].price * discountedvip / 100)).round()} Baht";
  }
}
