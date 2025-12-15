import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/pageable_products.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/repository/commerce_repo.dart';
import 'package:route_e_commerce_v2/network/results.dart';

@injectable
class GetPageableProductsUseCase {
  final CommerceRepo repo;

  GetPageableProductsUseCase(this.repo);

  Future<Results<PageableProducts>> call(String categoryId, int page) async =>
      repo.getProductsList(categoryId, page);
}
