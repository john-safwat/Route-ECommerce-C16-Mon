import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/data/models/products/pageable_products_response_dto.dart';
import 'package:route_e_commerce_v2/features/orders/data/models/cart_response_dto.dart';
import 'package:route_e_commerce_v2/features/orders/domin/entities/cart_entity.dart';
import 'package:route_e_commerce_v2/features/orders/domin/entities/cart_product_entity.dart';

@injectable
class OrdersMapper {
  CartEntity mapCartResponseToEntity(CartResponseDto? response) {
    return CartEntity(
      (response?.numOfCartItems ?? 0).toInt(),
      response?.cartId ?? "",
      response?.data?.totalCartPrice ?? 0,
      _mapProductsDtoToCartProductsEntity(response?.data?.products??[]),
    );
  }

  List<CartProductEntity> _mapProductsDtoToCartProductsEntity(
    List<ProductDto> products,
  ) {
    return products
        .map(
          (product) => CartProductEntity(
            (product.count ?? 0).toInt(),
            product.id ?? "",
            product.price ?? 0,
          ),
        )
        .toList();
  }
}
