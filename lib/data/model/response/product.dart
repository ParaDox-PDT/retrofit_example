import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;

  Product(
      {required this.description,
      required this.title,
      required this.image,
      required this.id,
      required this.price,
      required this.category});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
