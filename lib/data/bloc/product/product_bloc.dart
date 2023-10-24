import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:retrofit_example/data/model/response/product.dart';
import 'package:retrofit_example/data/repositories/product_repository.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required this.productRepository}) : super(const ProductState()) {
    on<GetProducts>(getProducts);
  }

  final ProductRepository productRepository;

  Future<void> getProducts(
      ProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    emit(state.copyWith(products: await productRepository.getProducts()));
    emit(state.copyWith(isLoading: false));
  }
}
