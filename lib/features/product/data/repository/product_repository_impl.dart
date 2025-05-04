import 'package:sadeem/features/product/domain/repositry/product_repository.dart';

import '../../domain/entities/product_entity.dart';
import '../data_sources/product_remote_data_source.dart';
import '../models/product_model.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductEntity>> getProducts() async {
    return await remoteDataSource.getProducts();
  }
}