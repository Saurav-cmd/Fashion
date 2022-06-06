import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/apis_model/stetement_model.dart';

class StatementController extends GetxController {
  var isLoading = true.obs;
  StatementList? data;
  Future<StatementList?> getStatementData(
      String? dealerId, String? token, BuildContext context) async {
    try {
      isLoading(true);
      data = await Services.getStatementList(dealerId, token, context);
      return data;
    } finally {
      isLoading(false);
    }
  }
}
