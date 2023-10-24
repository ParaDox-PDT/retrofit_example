import 'package:retrofit_example/data/model/response/product.dart';

abstract class ProductRepository{
  Future<List<Product>> getProducts();
}