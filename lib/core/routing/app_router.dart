
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/login/view/login_view.dart';
import 'package:route_e_commerce_v2/features/auth/presentation/register/register_view.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entities/category.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/navigation_layout/navigation_view.dart';
import 'package:route_e_commerce_v2/features/commerce/presentation/products/products_list_view.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigating to: ${settings.name}');
    }

    final uri = Uri.parse(settings.name ?? '/');

    switch (uri.path) {
      case Routes.navigationRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigationView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(settings: settings, builder: (_) => Login());
      case Routes.registerRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegisterView(),
        );
      case Routes.productsListRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductsListView(
            category: settings.arguments as Category,
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
