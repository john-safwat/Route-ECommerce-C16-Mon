import 'package:route_e_commerce_v2/features/orders/domin/entities/cart_entity.dart';
import 'package:route_e_commerce_v2/network/resources.dart';

class OrdersState {
  Resources<CartEntity> cart;

  OrdersState({this.cart = const Resources.initial()});

  OrdersState copyWith({Resources<CartEntity>? cart}) =>
      OrdersState(cart: cart ?? this.cart);
}


sealed class OrdersEvets{}

class GetCartEvent extends OrdersEvets{}