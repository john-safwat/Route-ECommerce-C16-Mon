import 'package:route_e_commerce_v2/features/orders/data/models/cart_response_dto.dart';
import 'package:route_e_commerce_v2/network/results.dart';

abstract interface class OrdersRemoteDatasource {

  Future<Results<CartResponseDto>> getUserCart();

}