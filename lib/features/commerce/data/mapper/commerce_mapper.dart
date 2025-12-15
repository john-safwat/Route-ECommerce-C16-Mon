import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/data/models/category_models/category_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/data/models/products/pageable_products_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/pageable_products.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/product.dart';

@injectable
class CommerceMapper {
  List<Category> mapCategoryDtoListToCategoriesList(
    List<CategoryDto> categories,
  ) {
    return categories
        .map((category) => _mapCategoryDtoToEntity(category))
        .toList();
  }

  Category _mapCategoryDtoToEntity(CategoryDto categoryDto) {
    return Category(
      id: categoryDto.id,
      name: categoryDto.name,
      slug: categoryDto.slug,
      image: categoryDto.image,
      createdAt: categoryDto.createdAt,
      updatedAt: categoryDto.updatedAt,
    );
  }

  PageableProducts mapPageableProductsResponseToEntity(
    PageableProductsResponseDto? response,
  ) {
    var currentPage = (response?.metadata?.currentPage ?? 1).toInt();
    var numberOfPages = (response?.metadata?.numberOfPages ?? 1).toInt();
    var products =
        response?.data
            ?.map((productDto) => _mapProductDtoToProduct(productDto))
            .toList() ??
        [];
    return PageableProducts(currentPage, numberOfPages, products);
  }

  Product _mapProductDtoToProduct(ProductDto product) {
    return Product(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price,
      priceAfterDiscount: product.priceAfterDiscount,
      imageCover: product.imageCover,
      images: product.images,
      ratingsAverage: product.ratingsAverage,
      ratingsQuantity: product.ratingsQuantity,
      quantity: product.quantity,
    );
  }
}
