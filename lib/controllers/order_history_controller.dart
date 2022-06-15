import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/apis_model/order_history_model.dart';
import '../remote services/services.dart';

class OrderHistoryController extends GetxController {
  var isLoading = false.obs;
  List<OrderHistory>? orderHistory = [];

  Future<List<OrderHistory>?> getOrderHistory(BuildContext context) async {
    try {
      isLoading(true);
      orderHistory = await Services.getOrderHistory(context);
      return orderHistory;
    } finally {
      isLoading(false);
    }
  }
}
