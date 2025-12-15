import 'package:route_e_commerce_v2/features/commerce/domain/entities/product.dart';
import 'package:route_e_commerce_v2/network/resources.dart';

class ProductsListState {
  int page;
  int numberOfPages;
  Resources<List<Product>> products;

  ProductsListState({
    this.page = 1,
    this.numberOfPages = 1,
    this.products = const Resources.initial(),
  });

  ProductsListState copyWith({
    int? page,
    int? numberOfPages,
    Resources<List<Product>>? products,
  }) {
    return ProductsListState(
      page: page ?? this.page,
      numberOfPages: numberOfPages ?? this.numberOfPages,
      products: products ?? this.products,
    );
  }
}


sealed class ProductsListEvents {}
class LoadProductsList extends ProductsListEvents {
  String categoryId;
  LoadProductsList(this.categoryId);
}