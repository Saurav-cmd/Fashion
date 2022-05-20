import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/apis_model/get_cart_data_model.dart';

class GetCartController extends GetxController {
  var isLoading = false.obs;
  List<GetCartData>? cartList = [];
  Future<List<GetCartData>?>? getAllCartData(BuildContext context) async {
    try {
      isLoading(true);
      cartList = await Services.getCartData(context);
      //return cartList;
    } finally {
      isLoading(false);
    }
  }
}
