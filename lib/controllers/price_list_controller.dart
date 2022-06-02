import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/apis_model/price_list_model.dart';

class PriceListController extends GetxController {
  var isLoading = true.obs;
  List<ImageUrl> priceData = [];

  Future<List<ImageUrl>> getPriceListData(BuildContext context) async {
    try {
      isLoading(true);
      PriceList? data = await Services.getPriceList(context);
      priceData = data!.imageUrl!;
      return priceData;
    } finally {
      isLoading(false);
    }
  }

  //schemeList and price list ko data module same xa tai vhaya ra price list kai model use garaya ko scheme list ko lagi ne and scheme list ko controller price list controller mai xa
  Future<List<ImageUrl>> getSchemeListData(BuildContext context) async {
    try {
      isLoading(true);
      PriceList? data = await Services.getSchemeList(context);
      priceData = data!.imageUrl!;
      return priceData;
    } finally {
      isLoading(false);
    }
  }
}
