import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_example/data/model/response/product.dart';


part 'product_api.g.dart';

@RestApi()
@Singleton()

abstract class ProductApi{
  @factoryMethod
  factory ProductApi(Dio dio) = _ProductApi;

  @GET('/products/category/jewelery')
  Future<List<Product>> getProducts();

}