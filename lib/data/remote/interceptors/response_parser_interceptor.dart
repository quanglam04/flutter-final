import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class ResponseParserInterceptor extends Interceptor {
  @factoryMethod
  ResponseParserInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data != null &&
        response.requestOptions.responseType != ResponseType.bytes) {
      try {
        final Map valueMap = response.data;
        final result = valueMap['result'];
        if (result != null) {

        }
      } catch (error) {
        return handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            error: error,
          ),
        );
      }
    }
    return handler.next(response);
  }
}