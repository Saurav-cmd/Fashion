import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/apis_model/get_cart_data_model.dart';
import '../remote services/services.dart';

class cartBadgeCounter extends GetxController {
  var counter = 0.obs;
  var cartList = <GetCartData>[].obs;

  void cartCounter(BuildContext context) async {
    var data = await Services.getCartData(context);
    cartList.addAll(data!);
    counter++;
  }
}
