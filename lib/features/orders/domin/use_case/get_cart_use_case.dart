import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/orders/domin/entities/cart_entity.dart';
import 'package:route_e_commerce_v2/features/orders/domin/repository/orders_repository.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@injectable
class GetCartUseCase {
  final OrdersRepository _ordersRepository;

  GetCartUseCase(this._ordersRepository);

  Future<Results<CartEntity>> call() async => _ordersRepository.getUserCart();
}
