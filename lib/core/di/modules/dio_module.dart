import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:route_e_commerce_v2/core/di/di.dart';
import 'package:route_e_commerce_v2/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    Dio dio = Dio();

    SharedPreferences preferences = getIt();
    var token = preferences.getString(AppConstants.token);
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers["token"] = token;
    }

    dio.options = BaseOptions(
      baseUrl: "https://ecommerce.routemisr.com",
      receiveTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 120),
      connectTimeout: const Duration(seconds: 120),
      headers: headers,
      validateStatus: (state) {
        return true;
      },
    );

    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        maxWidth: 160,
        compact: false,
        enabled: kDebugMode,
      ),
    );

    return dio;
  }
}
