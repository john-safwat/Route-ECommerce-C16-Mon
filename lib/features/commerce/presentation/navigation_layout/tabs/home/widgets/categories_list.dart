import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/dummy_data_provider.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_tab_state.dart';
import 'package:route_e_commerce_v2/network/resources.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/category_widget.dart';

class CategoriesList extends StatelessWidget {
  final HomeCubit cubit;

  const CategoriesList({required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeCubit, HomeTabState>(
        builder: (context, state) {
          List<Category> categories = switch (state.categories.status) {
            Status.initial => DummyDataProvider.generateCategories(),
            Status.loading => DummyDataProvider.generateCategories(),
            Status.success => state.categories.data ?? [],
            Status.failure => DummyDataProvider.generateCategories(),
          };
          return SizedBox(
            height: 260,
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.3,
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
                      onItemClick: (category) {},
                      category: categories[index],
                    ),
                  );
                }
              },
              scrollDirection: Axis.horizontal,
              itemCount: categories.isEmpty ? 20 : categories.length,
            ),
          );
        },
      ),
    );
  }
}
