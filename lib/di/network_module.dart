import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/data/remote/interceptors/response_parser_interceptor.dart';
import 'package:flutter_clean_architecture/data/remote/services/api_service.dart';
import 'package:flutter_clean_architecture/shared/extension/duration.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@module
abstract class NetworkModule {
  @Named('logging_interceptor')
  @singleton
  Interceptor get loggingInterceptor => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        error: true,
        compact: false,
        responseBody: true,
        maxWidth: 150,
        logPrint: (o) => debugPrint('API ${o.toString()}'),
      );

  @Named('response_parser_interceptor')
  @singleton
  Interceptor responseParserInterceptor() {
    return ResponseParserInterceptor();
  }

  @Named('cookie_interceptor')
  @singleton
  CookieManager cookieInterceptor(CookieJar jar) {
    return CookieManager(jar);
  }

  @preResolve
  Future<CookieJar> cookieJar() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final jar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocPath + '/.cookies/'),
    );
    return jar;
  }

  @singleton
  Dio getDio(
    @Named('logging_interceptor') Interceptor loggingInterceptor,
    @Named('response_parser_interceptor') Interceptor responseParserInterceptor,
    @Named('cookie_interceptor') CookieManager cookieInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: 5.seconds(),
        receiveTimeout: 120.seconds(),
      ),
    )..interceptors.addAll([responseParserInterceptor, cookieInterceptor]);

    if (kDebugMode) {
      dio.interceptors.add(loggingInterceptor);
    }
    return dio;
  }

  @singleton
  ApiService getApiService(Dio dio) => ApiService(dio, baseUrl: '');
}