import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/apis_model/order_history_model.dart';
import '../remote services/services.dart';

class OrderHistoryController extends GetxController{
  var isLoading = false.obs;
  List<OrderHistory>? oderHistory =[];
  var canceledOrder =<OrderHistory?>[];
  var underProcess =<OrderHistory?>[];
  var yetRevApprove = <OrderHistory?>[];
  Future<List<OrderHistory>?>? getOrderHistory(BuildContext context)async{
    try{
      isLoading(true);
      oderHistory = await Services.getOrderHistory(context);
      print('order history controller 9999${oderHistory}');
      for(int i = 0 ; i<oderHistory!.length;i++){
        if(oderHistory![i].status=='Declined'){
          canceledOrder.add(oderHistory![i]);
          print('cancel order length ${canceledOrder.length}');
        }
        else if(oderHistory![i].status=="Pending"){
          underProcess.add(oderHistory![i]);
          print('underProcess order length ${underProcess.length}');

        }
        else if(oderHistory![i].status=="Approved"){
          yetRevApprove.add(oderHistory![i]);
          print('approve order length ${yetRevApprove.length}');
        }
      }
    }finally{
      isLoading(false);
    }

  }
}
