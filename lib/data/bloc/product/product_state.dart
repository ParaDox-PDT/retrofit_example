part of 'product_bloc.dart';

class ProductState extends Equatable {
  final bool isLoading;
  final List<Product>? products;

  const ProductState({this.products, this.isLoading = false});

  ProductState copyWith({bool? isLoading, List<Product>? products}) =>
      ProductState(
          isLoading: isLoading ?? this.isLoading,
          products: products ?? this.products);

  @override
  List<Object?> get props => [isLoading, products];
}
