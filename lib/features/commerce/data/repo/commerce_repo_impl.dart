import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/contract/categories_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/contract/products_remote_datasource.dart';
import 'package:route_e_commerce_v2/features/commerce/data/mapper/commerce_mapper.dart';
import 'package:route_e_commerce_v2/features/commerce/data/models/category_models/category_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/data/models/products/pageable_products_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/pageable_products.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/repository/commerce_repo.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@Injectable(as: CommerceRepo)
class CommerceRepoImpl implements CommerceRepo {
  CategoriesRemoteDatasource remoteDatasource;
  ProductsRemoteDatasource productsRemoteDatasource;
  CommerceMapper mapper;

  CommerceRepoImpl(
    this.remoteDatasource,
    this.mapper,
    this.productsRemoteDatasource,
  );

  @override
  Future<Results<List<Category>>> getCategories() async {
    var response = await remoteDatasource.getCategories();
    switch (response) {
      case Success<List<CategoryDto>>():
        {
          return Success(
            mapper.mapCategoryDtoListToCategoriesList(response.data ?? []),
          );
        }
      case Failure<List<CategoryDto>>():
        {
          return Failure(response.exception, response.message);
        }
    }
  }

  @override
  Future<Results<PageableProducts>> getProductsList(
    String categoryId,
    int page,
  ) async {
    var response = await productsRemoteDatasource.getProducts(categoryId, page);
    switch (response) {
      case Success<PageableProductsResponseDto>():
        {
          return Success(
            mapper.mapPageableProductsResponseToEntity(response.data),
          );
        }
      case Failure<PageableProductsResponseDto>():
        {
          return Failure(response.exception, response.message);
        }
    }
  }
}
