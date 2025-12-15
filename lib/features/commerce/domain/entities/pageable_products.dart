import 'package:route_e_commerce_v2/features/commerce/domain/entities/product.dart';

class PageableProducts {
  int currentPage;
  int numberOfPages;
  List<Product> products;

  PageableProducts(this.currentPage, this.numberOfPages, this.products);
}
