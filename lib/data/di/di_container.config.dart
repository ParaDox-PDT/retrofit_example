// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:retrofit_example/data/api/product_api.dart' as _i4;
import 'package:retrofit_example/data/dio/dio_module.dart' as _i7;
import 'package:retrofit_example/data/repositories/product_repository.dart'
    as _i5;
import 'package:retrofit_example/data/repository_impl/product_repository_impl.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<String>(
      () => dioModule.host,
      instanceName: 'Host',
    );
    gh.factory<String>(
      () => dioModule.testHost,
      instanceName: 'TestHost',
    );
    gh.factory<bool>(
      () => dioModule.isTest,
      instanceName: 'Environment',
    );
    gh.singletonAsync<_i3.Dio>(() => dioModule.getAuthorizedDioClient(
          isTest: gh<bool>(instanceName: 'Environment'),
          host: gh<String>(instanceName: 'Host'),
          testHost: gh<String>(instanceName: 'TestHost'),
        ));
    gh.singletonAsync<_i3.Dio>(
      () => dioModule.getUnauthorizedDioClient(
        isTest: gh<bool>(instanceName: 'Environment'),
        host: gh<String>(instanceName: 'Host'),
        testHost: gh<String>(instanceName: 'TestHost'),
      ),
      instanceName: 'UnauthorizedClient',
    );
    gh.singletonAsync<_i4.ProductApi>(
        () async => _i4.ProductApi(await getAsync<_i3.Dio>()));
    gh.singletonAsync<_i5.ProductRepository>(() async =>
        _i6.ProductRepositoryImpl(await getAsync<_i4.ProductApi>()));
    return this;
  }
}

class _$DioModule extends _i7.DioModule {}
