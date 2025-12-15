
import 'package:route_e_commerce_v2/features/commerce/data/models/products/pageable_products_response_dto.dart';
import 'package:route_e_commerce_v2/network/results.dart';

abstract interface class ProductsRemoteDatasource{
  Future<Results<PageableProductsResponseDto>> getProducts(String categoryId, int page);
}