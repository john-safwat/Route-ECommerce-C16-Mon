// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasource/contract/auth_local_datasource.dart'
    as _i1071;
import '../../features/auth/data/datasource/contract/auth_remote_datasource.dart'
    as _i1070;
import '../../features/auth/data/datasource/impl/auth_local_datasource_impl.dart'
    as _i909;
import '../../features/auth/data/datasource/impl/auth_remote_datasource_impl.dart'
    as _i81;
import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/use_case/login_user_use_case.dart' as _i697;
import '../../features/auth/domain/use_case/signup_user_use_case.dart' as _i529;
import '../../features/auth/presentation/login/view/login_cubit.dart' as _i777;
import '../../features/auth/presentation/register/register_cubit.dart' as _i837;
import '../../features/commerce/data/datasource/contract/categories_remote_datasource.dart'
    as _i2;
import '../../features/commerce/data/datasource/contract/products_remote_datasource.dart'
    as _i94;
import '../../features/commerce/data/datasource/impl/categories_remote_datasource_impl.dart'
    as _i226;
import '../../features/commerce/data/datasource/impl/products_remote_datasource_impl.dart'
    as _i994;
import '../../features/commerce/data/mapper/commerce_mapper.dart' as _i96;
import '../../features/commerce/data/repo/commerce_repo_impl.dart' as _i861;
import '../../features/commerce/domain/repository/commerce_repo.dart' as _i48;
import '../../features/commerce/domain/use_case/get_categories_use_case.dart'
    as _i879;
import '../../features/commerce/domain/use_case/get_pageable_products_use_case.dart'
    as _i1040;
import '../../features/commerce/presentation/navigation_layout/tabs/categories/categories_tab_cubit.dart'
    as _i481;
import '../../features/commerce/presentation/navigation_layout/tabs/home/home_cubit.dart'
    as _i972;
import '../../features/commerce/presentation/products/products_list_cubit.dart'
    as _i109;
import '../../features/orders/data/datasource/contract/orders_remote_datasource.dart'
    as _i874;
import '../../features/orders/data/datasource/impl/orders_remote_datasource_impl.dart'
    as _i64;
import '../../features/orders/data/mapper/orders_mapper.dart' as _i404;
import '../../features/orders/data/repository/orders_repository_impl.dart'
    as _i492;
import '../../features/orders/domin/repository/orders_repository.dart' as _i570;
import '../../features/orders/domin/use_case/get_cart_use_case.dart' as _i10;
import '../../features/orders/presentation/orders_cubit.dart' as _i633;
import '../../network/api_client.dart' as _i972;
import 'modules/dio_module.dart' as _i983;
import 'modules/shared_preferences_module.dart' as _i813;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i96.CommerceMapper>(() => _i96.CommerceMapper());
    gh.factory<_i404.OrdersMapper>(() => _i404.OrdersMapper());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.singleton<_i972.ApiClient>(() => _i972.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i1071.AuthLocalDatasource>(
      () => _i909.AuthLocalDatasourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i2.CategoriesRemoteDatasource>(
      () => _i226.CategoriesRemoteDatasourceImpl(gh<_i972.ApiClient>()),
    );
    gh.factory<_i874.OrdersRemoteDatasource>(
      () => _i64.OrdersRemoteDatasourceImpl(gh<_i972.ApiClient>()),
    );
    gh.factory<_i94.ProductsRemoteDatasource>(
      () => _i994.ProductsRemoteDatasourceImpl(gh<_i972.ApiClient>()),
    );
    gh.factory<_i1070.AuthRemoteDatasource>(
      () => _i81.AuthRemoteDatasourceImpl(gh<_i972.ApiClient>()),
    );
    gh.factory<_i48.CommerceRepo>(
      () => _i861.CommerceRepoImpl(
        gh<_i2.CategoriesRemoteDatasource>(),
        gh<_i96.CommerceMapper>(),
        gh<_i94.ProductsRemoteDatasource>(),
      ),
    );
    gh.factory<_i570.OrdersRepository>(
      () => _i492.OrdersRepositoryImpl(
        gh<_i874.OrdersRemoteDatasource>(),
        gh<_i404.OrdersMapper>(),
      ),
    );
    gh.factory<_i10.GetCartUseCase>(
      () => _i10.GetCartUseCase(gh<_i570.OrdersRepository>()),
    );
    gh.factory<_i879.GetCategoriesUseCase>(
      () => _i879.GetCategoriesUseCase(gh<_i48.CommerceRepo>()),
    );
    gh.factory<_i1040.GetPageableProductsUseCase>(
      () => _i1040.GetPageableProductsUseCase(gh<_i48.CommerceRepo>()),
    );
    gh.factory<_i972.HomeCubit>(
      () => _i972.HomeCubit(gh<_i879.GetCategoriesUseCase>()),
    );
    gh.factory<_i481.CategoriesTabCubit>(
      () => _i481.CategoriesTabCubit(gh<_i879.GetCategoriesUseCase>()),
    );
    gh.factory<_i109.ProductsListCubit>(
      () => _i109.ProductsListCubit(gh<_i1040.GetPageableProductsUseCase>()),
    );
    gh.singleton<_i633.OrdersCubit>(
      () => _i633.OrdersCubit(gh<_i10.GetCartUseCase>()),
    );
    gh.factory<_i961.AuthRepo>(
      () => _i984.AuthRepoImpl(
        gh<_i1070.AuthRemoteDatasource>(),
        gh<_i1071.AuthLocalDatasource>(),
      ),
    );
    gh.factory<_i697.LoginUserUseCase>(
      () => _i697.LoginUserUseCase(gh<_i961.AuthRepo>()),
    );
    gh.factory<_i529.SignupUserUseCase>(
      () => _i529.SignupUserUseCase(gh<_i961.AuthRepo>()),
    );
    gh.factory<_i777.LoginCubit>(
      () => _i777.LoginCubit(gh<_i697.LoginUserUseCase>()),
    );
    gh.factory<_i837.RegisterCubit>(
      () => _i837.RegisterCubit(gh<_i529.SignupUserUseCase>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i813.SharedPreferencesModule {}

class _$DioModule extends _i983.DioModule {}
