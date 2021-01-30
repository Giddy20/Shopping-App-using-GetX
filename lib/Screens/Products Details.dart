import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_api/controller/productController.dart';

class ProductDetails extends StatelessWidget{
  final ProductController productController = Get.put(ProductController());
  final index;

  ProductDetails({this.index});

  @override
  Widget build(BuildContext context) {
    var product = productController.productList[index];
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      title: Center(
        child: Text("Product Details",
        style: TextStyle(color: Colors.black),),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: (){})
      ],
      elevation: 0,
    ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                          Card(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                product.imageLink,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                        Positioned(
                          right: 0,
                          child: Obx(() => CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: product.isFavorite.value
                                  ? Icon(Icons.favorite_rounded)
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                product.isFavorite.toggle();
                              },
                            ),
                          )),
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
                    Text(
                      product.name,
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8,),
                    if(product.rating != null)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              product.rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    SizedBox(height: 8),
                    Text('\$${product.price}',
                        style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
                    SizedBox(height: 20,),
                    RaisedButton(
                        onPressed: (){},
                      color: Colors.green,
                      child: Text('Add to Cart',
                      style: Theme.of(context).textTheme.button,),
                        ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Description: ${product.description}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
