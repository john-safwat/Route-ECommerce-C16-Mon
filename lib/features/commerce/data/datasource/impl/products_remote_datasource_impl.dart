import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/contract/products_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/commerce/data/models/products/pageable_products_response_dto.dart';
import 'package:route_e_commerce_v2/network/api_client.dart';
import 'package:route_e_commerce_v2/network/results.dart';
import 'package:route_e_commerce_v2/network/safe_call.dart';

@Injectable(as: ProductsRemoteDatasource)
class ProductsRemoteDatasourceImpl implements ProductsRemoteDatasource {
  final ApiClient _apiClient;

  ProductsRemoteDatasourceImpl(this._apiClient);

  @override
  Future<Results<PageableProductsResponseDto>> getProducts(
    String categoryId,
    int page,
  ) async {
    return safeCall(() async {
      var response = await _apiClient.getProducts(categoryId, page);
      return Success(response);
    });
  }
}
