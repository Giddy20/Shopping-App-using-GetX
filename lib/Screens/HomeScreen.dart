import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopping_app_api/controller/productController.dart';
import 'package:shopping_app_api/models/products.dart';
import 'package:shopping_app_api/views/Product_Tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text('ShopX',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: 30,
                        fontFamily: 'avenir',
                        color: Colors.black
                      ),),
                  ),
                  IconButton(icon: Icon(
                    Icons.view_list_rounded
                  ), onPressed: (){}),
                  IconButton(icon: Icon(
                      Icons.grid_view
                  ), onPressed: (){}),

                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if(productController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
               return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        product: productController.productList[index],
                      index:  index,);
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1));

              }),
            )
          ],
        ),
      ),
    );
  }
}

