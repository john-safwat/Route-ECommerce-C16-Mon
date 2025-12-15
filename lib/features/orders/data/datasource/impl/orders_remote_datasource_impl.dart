import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/orders/data/datasource/contract/orders_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/orders/data/models/cart_response_dto.dart';
import 'package:route_e_commerce_v2/network/api_client.dart';
import 'package:route_e_commerce_v2/network/results.dart';
import 'package:route_e_commerce_v2/network/safe_call.dart';

@Injectable(as: OrdersRemoteDatasource)
class OrdersRemoteDatasourceImpl implements OrdersRemoteDatasource {
  final ApiClient _apiClient;

  OrdersRemoteDatasourceImpl(this._apiClient);

  @override
  Future<Results<CartResponseDto>> getUserCart() async {
    return safeCall(() async {
      var response = await _apiClient.getUserCart();
      return Success(response);
    });
  }
}
