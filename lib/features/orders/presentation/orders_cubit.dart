import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base/base_cubit.dart';
import 'package:route_e_commerce_v2/features/orders/domin/entities/cart_entity.dart';
import 'package:route_e_commerce_v2/features/orders/domin/use_case/get_cart_use_case.dart';
import 'package:route_e_commerce_v2/features/orders/presentation/orders_contract.dart';
import 'package:route_e_commerce_v2/network/resources.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@singleton
class OrdersCubit extends BaseCubit<OrdersState, OrdersEvets, void> {
  final GetCartUseCase _getCartUseCase;

  OrdersCubit(this._getCartUseCase) : super(OrdersState());

  @override
  Future<void> doAction(OrdersEvets action) async {
    switch (action) {
      case GetCartEvent():
        {
          emit(state.copyWith(cart: const Resources.loading()));
          var response = await _getCartUseCase();
          switch (response) {
            case Success<CartEntity>():
              {
                emit(
                  state.copyWith(cart: Resources.success(data: response.data)),
                );
              }
            case Failure<CartEntity>():
              {
                emit(
                  state.copyWith(
                    cart: Resources.failure(
                      exception: response.exception,
                      message: response.message,
                    ),
                  ),
                );
              }
          }
        }
    }
  }
}
