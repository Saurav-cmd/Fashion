import 'package:fashion_paints/models/apis_model/add_to_cart_model.dart';
import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DeleteCartItemController extends GetxController{
  var isLoading = true.obs;

  Future<void> deleteItem(BuildContext context, int cartId)async{
    try{
      isLoading(true);
      AddCart? addCart = await Services.DeleteCart(context,cartId);
    }finally{
      isLoading(false);
    }
  }
}
