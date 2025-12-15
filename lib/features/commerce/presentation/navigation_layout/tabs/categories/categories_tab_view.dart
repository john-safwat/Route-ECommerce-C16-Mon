import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/dummy_data_provider.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/categories/categories_tab_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/categories/categories_tab_state.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/widgets/category_widget.dart';
import 'package:route_e_commerce_v2/network/resources.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesTabView extends StatefulWidget {
  const CategoriesTabView({super.key});

  @override
  State<CategoriesTabView> createState() => _CategoriesTabViewState();
}

class _CategoriesTabViewState extends State<CategoriesTabView> {
  CategoriesTabCubit cubit = getIt();

  @override
  void initState() {
    super.initState();
    cubit.doAction(LoadCategoriesEvent());
    cubit.navigation.listen((navigationState) {
      switch (navigationState) {
        case NavigateToProductsListScreen():
          {
            Navigator.pushNamed(
              context,
              Routes.productsListRoute,
              arguments: navigationState.category,
            );
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider.value(
        value: cubit,
        child: BlocBuilder<CategoriesTabCubit, CategoriesTabState>(
          builder: (context, state) {
            switch (state.categories.status) {
              case Status.initial:
              case Status.loading:
              case Status.success:
                {
                  var categories =
                      state.categories.data ??
                      DummyDataProvider.generateCategories();
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.8,
                        ),
                    itemBuilder: (context, index) {
                      if (state.categories.status == Status.success) {
                        return CategoryWidget(
                          category: categories[index],
                          onItemClick: (category) {
                            cubit.doAction(OnCategoryItemClick(category));
                          },
                        );
                      } else {
                        return Shimmer(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.grey.withAlpha(30),
                              AppColors.grey.withAlpha(20),
                            ],
                          ),
                          child: CategoryWidget(
                            category: categories[index],
                            onItemClick: (_) {},
                          ),
                        );
                      }
                    },
                    itemCount: categories.length,
                  );
                }
              case Status.failure:
                {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.categories.message ?? ""),
                        FilledButton(
                          onPressed: () {
                            cubit.doAction(LoadCategoriesEvent());
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
