import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem/features/product/domain/entities/product_entity.dart';
import 'package:sadeem/features/product/presentation/cubit/states.dart';

import '../../../../injection_container.dart';
import '../cubit/cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductCubit>()..fetchProducts(),
      child: Scaffold(
        body: BlocBuilder<ProductCubit, ProductStates>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductLoadedState) {

              //products list
              return Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75, // width to height ratio
                    ),
                    itemCount: state.products.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      //this is what we will use to display all data in cards
                      final ProductEntity product = state.products[index];
                      //widget to be repeated
                      return Card(
                        color: Colors.white,
                        shadowColor: Colors.black.withOpacity(0.2),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //image
                              Container(
                                height: 120,
                                alignment: Alignment.center,
                                child: Image.network(
                                  product.thumbnail,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              //title and rating
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    //product title
                                    child: Text(
                                      product.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  //rating icon and text
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text("4.5"),
                                    ],
                                  ),
                                ],
                              ),

                              //product description
                              Text(
                                product.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),

                              //price and add to cart
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${product.price} \$",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  CircleAvatar(
                                    // backgroundColor: Color(0xFF051A52),
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: Color(0xFF051A52),
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else if (state is ProductErrorState) {
              return Center(child: Text('Error: ${state.errorMsg}'));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
