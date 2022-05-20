import 'package:fashion_paints/models/apis_model/find_painter_model.dart';
import 'package:fashion_paints/remote%20services/services.dart';
import 'package:get/get.dart';

class PainterController extends GetxController {
  var isLoading = true.obs;
  List<Painter>? painterData = [];
  Future<void> findNearbyPainter(double? latitude, double? longitude) async {
    try {
      isLoading(true);
      painterData = await Services.findPainter(latitude, longitude);
    } finally {
      isLoading(false);
    }
  }
}
