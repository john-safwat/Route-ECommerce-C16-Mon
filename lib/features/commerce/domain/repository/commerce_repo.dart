import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/pageable_products.dart';
import 'package:route_e_commerce_v2/network/results.dart';

abstract interface class CommerceRepo{

  Future<Results<List<Category>>> getCategories();

  Future<Results<PageableProducts>> getProductsList(String categoryId , int page);

}