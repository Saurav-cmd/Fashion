import 'package:fashion_paints/models/apis_model/notice_log.dart';
import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NoticeLogController extends GetxController {
  var isLoading = true.obs;
  List<Datum>? noticeLogData = [];

  Future<List<Datum>> getNoticeLogData(BuildContext context) async {
    try {
      isLoading(true);
      final data = await Services.NoticeLogData(context);
      noticeLogData = data!.data;
      return noticeLogData!;
    } finally {
      isLoading(false);
    }
  }
}
