import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/network/resources.dart';

class HomeTabState {
  Resources<List<Category>> categories;

  HomeTabState({this.categories = const Resources.initial()});

  HomeTabState copyWith({Resources<List<Category>>? categories}) {
    return HomeTabState(categories: categories ?? this.categories);
  }
}


sealed class HomeTabEvents {}

class LoadHomeTabData extends HomeTabEvents {}
class OnCategoryItemClick extends HomeTabEvents{
  Category category;

  OnCategoryItemClick(this.category);
}


sealed class HomeNavigationEvents{}

class NavigateToProductsListScreen extends HomeNavigationEvents{
  Category category;

  NavigateToProductsListScreen(this.category);
}