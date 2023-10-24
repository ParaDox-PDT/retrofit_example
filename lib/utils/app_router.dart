import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_example/data/bloc/product/product_bloc.dart';
import 'package:retrofit_example/data/di/di_container.dart';
import 'package:retrofit_example/data/repositories/product_repository.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {}
  }

  List blocs() {
    return [
      BlocProvider(
        create: (_) => ProductBloc(
          productRepository: getIt<ProductRepository>(),
        )..add(GetProducts()),
      ),
    ];
  }
}
