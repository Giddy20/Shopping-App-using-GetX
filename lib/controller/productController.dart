import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shopping_app_api/models/products.dart';
import 'package:shopping_app_api/services/RemoteServices.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  void fetchProducts () async{
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    }
    finally{
      isLoading(false);
    }

  }
}