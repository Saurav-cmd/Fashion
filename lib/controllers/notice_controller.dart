import 'package:fashion_paints/models/apis_model/notice_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../remote services/services.dart';

class NoticeController extends GetxController {
  var isLoading = false.obs;
  //List<Notices>? noticeList = [];
  var noticeList =<Datum>[];
  var pdfLink =<Link>[];


  Future<List<Notices>?>? getAllNotices(BuildContext context) async {
    try {
      isLoading(true);
      Notices?  dataList = await Services.getNotice(context);
      noticeList =dataList!.data!;
      pdfLink =dataList.links!;
      print('testing notic');



    } finally {
      isLoading(false);
    }
  }
}
