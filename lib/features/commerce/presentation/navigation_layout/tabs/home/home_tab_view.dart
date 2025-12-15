import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_cubit.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/home_tab_state.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/widgets/advertisements_list.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/widgets/categories_list.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/widgets/products_list.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/tabs/home/widgets/section_title.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final HomeCubit homeCubit = getIt();

  @override
  void initState() {
    super.initState();
    homeCubit.doAction(LoadHomeTabData());
    homeCubit.navigation.listen((navigationEvent) {
      switch (navigationEvent) {
        case NavigateToProductsListScreen():
          {
            Navigator.pushNamed(
              context,
              Routes.productsListRoute,
              arguments: navigationEvent.category,
            );
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return BlocProvider.value(
      value: homeCubit,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const AdvertisementsList(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SectionTitle(title: locale.categories, viewAllVisibility: true),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          CategoriesList(cubit: homeCubit),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          SectionTitle(title: locale.homeAppliance),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const ProductsList(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
