import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_interceptor.dart';

const _requestTimeoutInMilliseconds = 40000;

@module
abstract class DioModule {
  @Named("Host")
  String get host => 'fakestoreapi.com';

  @Named("TestHost")
  String get testHost =>'fakestoreapi.com';

  @Named("Environment")
  bool get isTest => const bool.hasEnvironment("isTest");

  @singleton
  Future<Dio> getAuthorizedDioClient({
    @Named("Environment") required bool isTest,
    @Named("Host") required String host,
    @Named("TestHost") required String testHost,
  }) async {
    String _baseUrl = 'https://${isTest ? testHost : host}';
    final authorizedDioClient = _createDioClient(_baseUrl);
    authorizedDioClient.interceptors.addAll([
      AuthorizedRequestInterceptor(
        authorizedDioClient,
      ),
    ]);
    return authorizedDioClient;
  }

  @Named("UnauthorizedClient")
  @singleton
  Future<Dio> getUnauthorizedDioClient({
    @Named("Environment") required bool isTest,
    @Named("Host") required String host,
    @Named("TestHost") required String testHost,
  }) async {
    String _baseUrl = 'https://${isTest ? testHost : host}/';
    final unauthorizedDioClient = _createDioClient(_baseUrl);
    unauthorizedDioClient.interceptors.addAll([
      CommonRequestInterceptor(unauthorizedDioClient,
    ),
    ]);
    return unauthorizedDioClient;
  }

  Dio _createDioClient(String baseUrl) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      // connectTimeout: _requestTimeoutInMilliseconds,
      // receiveTimeout: _requestTimeoutInMilliseconds,
    );
    return Dio(options);
  }
}
