import 'dart:io';

import 'package:fashion_paints/models/apis_model/message_model.dart';
import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  var isLoading = true.obs;
  Message? messageData;

  Future<String?> sendMessage(
      String? message, List<File> galleryImages, BuildContext context) async {
    try {
      isLoading(true);
      return await Services.sendMessage(message, galleryImages, context);
    } finally {
      isLoading(false);
    }
  }

  Future<Message?> getMessageData(BuildContext context) async {
    try {
      isLoading(true);
      messageData = await Services.getMessage(context);
      return messageData;
    } finally {
      isLoading(false);
    }
  }
}
