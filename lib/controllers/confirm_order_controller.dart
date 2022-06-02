import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../remote services/services.dart';

class ConfirmOrderController extends GetxController {
  var isLoading = false.obs;
  Future<void> confirmOrder(int? itemId, int? quantity, int? cartId,
      String date, BuildContext context) async {
    try {
      isLoading(true);
      print("This is itemId $itemId");
      print("This is quantity $quantity");
      print("This is cartId $cartId");
      return await Services.confirmOrder(
          itemId, quantity, cartId, date, context);
    } finally {
      isLoading(false);
    }
  }
}
