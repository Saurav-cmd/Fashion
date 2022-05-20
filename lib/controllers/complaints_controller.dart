import 'package:get/get.dart';

import '../remote services/services.dart';

class FeedbackAndComplaintController extends GetxController {
  var isLoading = true.obs;
  Future<void> giveFeedBackData(
      String? fullName,
      String? email,
      String? phone,
      String? comment,
      double? appRating,
      double? productRating,
      double? serviceRating,
      double? teamRating,
      String? updatedAt,
      String? createdAt) async {
    try {
      isLoading(true);
      return await Services.giveFeedBack(
          fullName,
          email,
          phone,
          comment,
          appRating,
          productRating,
          serviceRating,
          teamRating,
          updatedAt,
          createdAt);
    } finally {
      isLoading(false);
    }
  }
}
