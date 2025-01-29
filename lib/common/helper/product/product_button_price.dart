import '../../../domain/entity/user.dart';
import '../../../domain/product/entities/product.dart';

class ProductButtonPrice {
  static double provideCurrentPrice(
      ProductEntity product, UserEntity user, int index) {
    double discountedgen =
        double.parse(product.memberModel.general.discountedPrice);
    print(discountedgen);
    double discountedvip =
        double.parse(product.memberModel.VIP.discountedPrice);
    double price = user.gender == 1
        ? (product.booknoModel[index].price -
                (product.booknoModel[index].price * discountedgen / 100))
            .round()
            .toDouble()
        : (product.booknoModel[index].price -
                (product.booknoModel[index].price * discountedvip / 100))
            .round()
            .toDouble();
    return price;
  }
}
