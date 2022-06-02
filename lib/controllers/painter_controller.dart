import 'package:fashion_paints/models/apis_model/find_painter_model.dart';
import 'package:fashion_paints/remote%20services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PainterController extends GetxController {
  var isLoading = true.obs;
  List<Painter>? painterData = [];
  Future<void> findNearbyPainter(
      double? latitude, double? longitude, BuildContext context) async {
    try {
      isLoading(true);
      painterData = await Services.findPainter(latitude, longitude, context);
    } finally {
      isLoading(false);
    }
  }
}
