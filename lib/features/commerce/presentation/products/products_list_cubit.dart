import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base/base_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/pageable_products.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/use_case/get_pageable_products_use_case.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/products_list_contract.dart';
import 'package:route_e_commerce_v2/network/resources.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@injectable
class ProductsListCubit
    extends BaseCubit<ProductsListState, ProductsListEvents, void> {
  GetPageableProductsUseCase getPageableProductsUseCase;

  ProductsListCubit(this.getPageableProductsUseCase)
    : super(ProductsListState());

  @override
  Future<void> doAction(ProductsListEvents action) async {
    switch (action) {
      case LoadProductsList():
        {
          await _getProductsList(action);
        }
    }
  }

  Future<void> _getProductsList(LoadProductsList action) async {
    if (state.page == 1) {
      emit(state.copyWith(products: const Resources.loading()));
    }
    var response = await getPageableProductsUseCase(
      action.categoryId,
      state.page,
    );

    switch (response) {
      case Success<PageableProducts>():
        {
          var products = response.data?.products ?? [];
          if (state.page != 1) {
            products = state.products.data ?? [];
            products.addAll(response.data?.products ?? []);
          }
          var page = state.page + 1;
          emit(
            state.copyWith(
              page: (page),
              numberOfPages: response.data?.numberOfPages ?? state.page,
              products: Resources.success(data: products),
            ),
          );
        }
      case Failure<PageableProducts>():
        {
          emit(
            state.copyWith(
              products: Resources.failure(
                exception: response.exception,
                message: response.message,
              ),
            ),
          );
        }
    }
  }
}
