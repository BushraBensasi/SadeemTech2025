import 'package:sadeem/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required int id,
    required String title,
    required String description,
    required String thumbnail,
    required double price,
    required double discountPercentage,
  }) : super(
          id: id,
          title: title,
          description: description,
          thumbnail: thumbnail,
          price: price,
          discountPercentage: discountPercentage,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
    );
  }
}
