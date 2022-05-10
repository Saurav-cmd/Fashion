import 'package:fashion_paints/models/apis_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../remote services/services.dart';

class StoreController extends GetxController {
  var storeNumber = 1.obs;
  var isLoading = false.obs;
  List<Items> productItem = [];
  var acrylicWall = <Items>[];
//ACRYLIC WALL PUTTY
  void increment(int price) {
    storeNumber++;
    price = price.obs.bitLength * storeNumber.bitLength;
    update();
  }
  void decrement() {
    if (storeNumber > 1) {
      storeNumber--;
    }
  }

  Future<ProductList?> fetchProduct(BuildContext context) async {
    try {
      isLoading(true);
      ProductList? productList = await Services.getProduct(context);
      productItem = productList!.items;
    } finally {
      isLoading(false);
    }
  }
}
