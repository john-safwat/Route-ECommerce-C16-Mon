import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/orders/data/datasource/contract/orders_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/orders/data/mapper/orders_mapper.dart';
import 'package:route_e_commerce_v2/features/orders/data/models/cart_response_dto.dart';
import 'package:route_e_commerce_v2/features/orders/domin/entities/cart_entity.dart';
import 'package:route_e_commerce_v2/features/orders/domin/repository/orders_repository.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@Injectable(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDatasource _ordersRemoteDatasource;
  final OrdersMapper _ordersMapper;

  OrdersRepositoryImpl(this._ordersRemoteDatasource, this._ordersMapper);

  @override
  Future<Results<CartEntity>> getUserCart() async {
    var response = await _ordersRemoteDatasource.getUserCart();
    switch (response) {
      case Success<CartResponseDto>():
        {
          var cart = _ordersMapper.mapCartResponseToEntity(response.data);
          return Success(cart);
        }
      case Failure<CartResponseDto>():
        {
          return Failure(response.exception, response.message);
        }
    }
  }
}
