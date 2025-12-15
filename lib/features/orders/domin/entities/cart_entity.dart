import 'package:route_e_commerce_v2/features/orders/domin/entities/cart_product_entity.dart';

class CartEntity {
  int numberOfCartItems;
  String cartId;
  num cartTotalPrice;
  List<CartProductEntity> products;

  CartEntity(
    this.numberOfCartItems,
    this.cartId,
    this.cartTotalPrice,
    this.products,
  );
}
