import 'dart:io';

import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BipaniPreviewController extends GetxController {
  var isLoading = true.obs;

  Future<void> sendBipaniaPreviewData(
      String? name,
      String? email,
      String? phone,
      String? address,
      String? userCode,
      List<File> imagesData,
      BuildContext context) async {
    try {
      isLoading(true);
      return await Services.bipanaPreviewGalleryData(
          name, email, phone, address, userCode, imagesData, context);
    } finally {
      isLoading(false);
    }
  }

  Future<void> sendBipaniaPreviewCameraData(
      String? name,
      String? email,
      String? phone,
      String? address,
      String? userCode,
      File? imagesData,
      BuildContext context) async {
    try {
      isLoading(true);
      return await Services.bipanaPreviewCameraData(
          name, email, phone, address, userCode, imagesData, context);
    } finally {
      isLoading(false);
    }
  }
}
