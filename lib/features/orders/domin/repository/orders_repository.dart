import 'package:route_e_commerce_v2/features/orders/domin/entities/cart_entity.dart';
import 'package:route_e_commerce_v2/network/results.dart';

abstract interface class OrdersRepository {
  Future<Results<CartEntity>> getUserCart();
}
