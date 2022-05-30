import 'package:get/get.dart';

import '../models/apis_model/bipana_preview_saved_model.dart';
import '../remote services/services.dart';

class BipanPreviewController1 extends GetxController {
  var isLoading = false.obs;
  List<ImageUrl>? savedDataList = [];

  Future<List<ImageUrl>?> bipanaPreviewGetSavedData(
      String? emailAddress, String? phone) async {
    try {
      isLoading(true);
      BipanaPreviewSaved? data =
          await Services.getBipanPreviewSaved(emailAddress, phone);
      savedDataList = data!.imageUrl;
      return savedDataList;
    } finally {
      isLoading(false);
    }
  }
}
