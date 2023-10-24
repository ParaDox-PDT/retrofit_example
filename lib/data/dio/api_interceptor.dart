import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../main.dart';

Map<String, String> _headers = {
  // 'Content-Type': 'application/json',
  // 'charset': 'utf-8',
};

class CommonRequestInterceptor extends QueuedInterceptor {
  CommonRequestInterceptor(
    this._dio,
  );

  final Dio _dio;

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(_headers);
    log('${options.method} >>> ${options.uri}');
    log('Query parameters: ${options.queryParameters}');
    log('Header parameters: ${options.headers}');
    log('Request data: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    log(
        '${response.requestOptions.method} <<< ${response.requestOptions.uri}');
    log('Response data: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    log('${err.requestOptions.method} <<< ${err.requestOptions.uri}');
    log('Error data: ${err.response?.data}');
     // handler.next(err);
    log('Response data: ');
     return super.onError(err, handler);
  }
}

class AuthorizedRequestInterceptor extends CommonRequestInterceptor {
  AuthorizedRequestInterceptor(
    Dio dio,
  ) : super(
          dio,
        );

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      options.headers[HttpHeaders.authorizationHeader] =
          "Bearer ";
      print(options.headers[HttpHeaders.authorizationHeader]);
      return super.onRequest(options, handler);
    } on DioError catch (e) {
      handler.reject(e, true);
    } on Object catch (e) {
      print(e);
    }
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    log('Response data:${err.response?.statusCode} ');
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      log('Response data:${err.response?.statusCode} ');
      return super.onError(err, handler);
      // try {
      //   final request = err.requestOptions;
      //   final retryResponse = await _dio.request(
      //     request.path,
      //     data: request.data,
      //     queryParameters: request.queryParameters,
      //     options: Options(
      //       method: request.method,
      //       sendTimeout: request.sendTimeout,
      //       receiveTimeout: request.receiveTimeout,
      //       extra: request.extra,
      //       headers: request.headers,
      //       responseType: request.responseType,
      //       contentType: request.contentType,
      //       validateStatus: request.validateStatus,
      //       receiveDataWhenStatusError: request.receiveDataWhenStatusError,
      //       followRedirects: request.followRedirects,
      //       maxRedirects: request.maxRedirects,
      //       requestEncoder: request.requestEncoder,
      //       responseDecoder: request.responseDecoder,
      //       listFormat: request.listFormat,
      //     ),
      //   );
      //   handler.resolve(retryResponse);
      // } on DioError catch (retryError) {
      //   return super.onError(retryError, handler);
      // } on Object catch (_) {
      //   return super.onError(err, handler);
      // }
    } else {
      return super.onError(err, handler);
    }
  }
}
