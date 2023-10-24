import 'package:injectable/injectable.dart';
import 'package:retrofit_example/data/api/product_api.dart';
import 'package:retrofit_example/data/model/response/product.dart';
import 'package:retrofit_example/data/repositories/product_repository.dart';

@Singleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductApi _productApi;

  ProductRepositoryImpl(this._productApi);

  @override
  Future<List<Product>> getProducts() {
    return _productApi.getProducts();
  }
}
