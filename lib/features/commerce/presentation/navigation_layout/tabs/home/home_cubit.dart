import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/base/base_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/use_case/get_categories_use_case.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_tab_state.dart';
import 'package:route_e_commerce_v2/network/resources.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@injectable
class HomeCubit
    extends
        BaseCubit<HomeTabState, HomeTabEvents, HomeNavigationEvents> {
  GetCategoriesUseCase getCategoriesUseCase;

  HomeCubit(this.getCategoriesUseCase) : super(HomeTabState());

  @override
  Future<void> doAction(HomeTabEvents action) async {
    switch (action) {
      case LoadHomeTabData():
        {
          await _getCategories();
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
