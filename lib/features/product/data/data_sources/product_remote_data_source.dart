import 'package:sadeem/core/constants/constants.dart';
import 'package:sadeem/core/network/dio_helper.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts() async {
    final response = await DioHelper.getRequest(endpoint: '/products');

    final List productsJson = response.data['products'];
    return productsJson.map((json) => ProductModel.fromJson(json)).toList();
  }
}

