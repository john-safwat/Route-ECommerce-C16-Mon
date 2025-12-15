import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/widgets/custom_product_card.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/products_list_contract.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/products_list_cubit.dart';
import 'package:route_e_commerce_v2/features/orders/presentation/orders_contract.dart';
import 'package:route_e_commerce_v2/features/orders/presentation/orders_cubit.dart';
import 'package:route_e_commerce_v2/network/resources.dart';

class ProductsListView extends StatefulWidget {
  final Category category;

  const ProductsListView({required this.category, super.key});

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  ProductsListCubit cubit = getIt();
  OrdersCubit ordersCubit = getIt();

  @override
  void initState() {
    super.initState();
    cubit.doAction(LoadProductsList(widget.category.id ?? ""));
    ordersCubit.doAction(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.category.name ?? "")),
        body: BlocBuilder<ProductsListCubit, ProductsListState>(
          builder: (context, state) {
            switch (state.products.status) {
              case Status.initial:
              case Status.loading:
                {
                  return const Center(child: CircularProgressIndicator());
                }
              case Status.success:
                {
                  var products = state.products.data ?? [];
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.65,
                        ),
                    itemBuilder: (_, index) {
                      if (index == products.length) {
                        cubit.doAction(
                          LoadProductsList(widget.category.id ?? ""),
                        );
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CustomProductCard(product: products[index]);
                    },
                    itemCount:
                        state.page > state.numberOfPages
                            ? products.length
                            : products.length + 1,
                  );
                }
              case Status.failure:
                {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Something went wrong"),
                        FilledButton(
                          onPressed: () {
                            cubit.doAction(
                              LoadProductsList(widget.category.id ?? ""),
                            );
                          },
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
