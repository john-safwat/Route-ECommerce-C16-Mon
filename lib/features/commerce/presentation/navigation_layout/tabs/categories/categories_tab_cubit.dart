import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base/base_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/use_case/get_categories_use_case.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/categories/categories_tab_state.dart';
import 'package:route_e_commerce_v2/network/resources.dart';

import '../../../../../../network/results.dart';
import '../../../../domain/entities/category.dart';

@injectable
class CategoriesTabCubit
    extends
        BaseCubit<
          CategoriesTabState,
          CategoriesTabEvents,
          CategoriesTabNavigation
        > {
  GetCategoriesUseCase getCategoriesUseCase;

  CategoriesTabCubit(this.getCategoriesUseCase) : super(CategoriesTabState());

  @override
  Future<void> doAction(CategoriesTabEvents action) async {
    switch (action) {
      case LoadCategoriesEvent():
        {
          _getCategories();
        }
      case OnCategoryItemClick():
        {
          emitNavigation(NavigateToProductsListScreen(action.category));
        }
    }
  }

  Future<void> _getCategories() async {
    emit(state.copyWith(categories: const Resources.loading()));
    final result = await getCategoriesUseCase();
    switch (result) {
      case Success<List<Category>>():
        {
          emit(
            state.copyWith(categories: Resources.success(data: result.data)),
          );
        }
      case Failure<List<Category>>():
        {
          emit(
            state.copyWith(
              categories: Resources.failure(
                exception: result.exception,
                message: result.message,
              ),
            ),
          );
        }
    }
  }
}
