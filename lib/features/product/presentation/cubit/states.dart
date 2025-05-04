import '../../domain/entities/product_entity.dart';

abstract class ProductStates{}

class ProductInitialState extends ProductStates{}

class ProductLoadingState extends ProductStates{}

class ProductLoadedState extends ProductStates{
  final List<ProductEntity> products;
  ProductLoadedState(this.products);
}

class ProductErrorState extends ProductStates{
  final String errorMsg;
  ProductErrorState(this.errorMsg);
}
