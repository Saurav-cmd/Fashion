import 'dart:io';

import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/apis_model/bipana_preview_saved_model.dart';

class BipaniPreviewController extends GetxController {
  var isLoading = true.obs;
  List<ImageUrl>? savedDataList = [];

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
