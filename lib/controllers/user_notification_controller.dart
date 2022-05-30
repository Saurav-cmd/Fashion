import 'package:fashion_paints/remote%20services/services.dart';
import 'package:get/get.dart';

import '../models/apis_model/user_notification_model.dart';

class UserNotificationController extends GetxController {
  var isLoading = true.obs;
  List<Datum?> notificationData = [];

  Future<List<Datum?>> getUserNotificationData() async {
    try {
      isLoading(true);
      final data = await Services.getUserNotification();
      notificationData = data!.data!;
      return notificationData;
    } finally {
      isLoading(false);
    }
  }
}
