import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem/features/product/domain/entities/product_entity.dart';
import 'package:sadeem/features/product/domain/use_cases/get_products_usecase.dart';
import 'package:sadeem/features/product/presentation/cubit/states.dart';


class ProductCubit extends Cubit<ProductStates>{
  final GetProductsUseCase getProductsUseCase;
  ProductCubit({required this.getProductsUseCase}) : super(ProductInitialState());
  Future<void> fetchProducts()async{
    emit(ProductLoadingState());
    try {
      //cubit handles use cases only
      final products = await getProductsUseCase();
      emit(ProductLoadedState(products));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
      print(e.toString());
    }
  }
}