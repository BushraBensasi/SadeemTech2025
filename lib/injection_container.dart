import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sadeem/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:sadeem/features/product/domain/repositry/product_repository.dart';
import 'package:sadeem/features/product/domain/use_cases/get_products_usecase.dart';
import 'package:sadeem/features/product/presentation/cubit/cubit.dart';

import 'core/network/dio_helper.dart';
import 'features/product/data/repository/product_repository_impl.dart';

//service loactor


final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => ProductCubit(getProductsUseCase: sl()));

  // UseCase
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(remoteDataSource: sl()),
  );

  // Remote DataSource
  sl.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSource(),
  );
}