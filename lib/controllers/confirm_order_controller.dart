
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/apis_model/confirm_order_model.dart';
import '../remote services/services.dart';

class ConfirmOrderController extends GetxController{

  var isLoading =true.obs;
  Future<void>confirmOrder(BuildContext context ,List orderIdPass)async {
    try{
      isLoading(true);
      OrderId? orderId = await Services.fetchConfirmOrder(context,orderIdPass);

    }finally{
      isLoading(false);
    }
  }


}
