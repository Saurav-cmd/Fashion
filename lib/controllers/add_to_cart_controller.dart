import 'package:fashion_paints/models/apis_model/add_to_cart_model.dart';
import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var isLoading = true.obs;

  Future<void> addToCart(BuildContext context, var dealerId, var itemId,var quantity )async{
    try{
      isLoading(true);
      AddCart? addCart = await Services.Addtocart(context,dealerId,itemId,quantity);
    }finally{
      isLoading(false);
    }
  }
}
