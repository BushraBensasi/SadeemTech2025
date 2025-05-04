import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:  Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
                childAspectRatio: 1.25, // width to height ratio
              ),
              itemCount: 10,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                // final ProductEntity product = state.products[index];
                return Card(
                  color: Colors.white,
                  shadowColor: Colors.black.withOpacity(0.2),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        //image
                        Container(
                          height: 80,
                          alignment: Alignment.center,
                          child: Image.network(
                            'product.thumbnail',
                            fit: BoxFit.cover,
                          ),
                        ),
                        //data
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //title and rating
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  //product title
                                  child: Text(
                                    'product.title',
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
                              'product.description',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),

                            //price and add to cart
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "{product.price} \$",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    //minus item
                                    CircleAvatar(
                                      // backgroundColor: Color(0xFF051A52),
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.remove,
                                          color: Color(0xFF051A52),
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                    // item count
                                    Text("1"),
                                    //add item
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
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
    );
  }
}
