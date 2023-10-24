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
  final Rating rating;

  Product(
      {required this.description,
      required this.title,
      required this.image,
      required this.id,
      required this.price,
      required this.category, required this.rating,
      });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}




@JsonSerializable()
class Rating {
  final double rate;
  final int count;

  Rating(
      {required this.rate,
        required this.count,
       });

  factory Rating.fromJson(Map<String, dynamic> json) =>
      _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
