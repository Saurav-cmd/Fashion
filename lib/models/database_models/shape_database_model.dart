class ShapeDatabase {
  int? id;
  String? thumbnailImage;
  String? pngImage;
  List<data>? dataList;
  ShapeDatabase({this.id, this.thumbnailImage, this.pngImage, this.dataList});

  factory ShapeDatabase.fromMap(Map<String, dynamic> json) => ShapeDatabase(
        id: json["id"],
        thumbnailImage: json["thumbnailImage"],
        pngImage: json["pngImage"],
      );

  Map<String, dynamic> toMap() {
    return {"id": id, "thumbnailImage": thumbnailImage, "pngImage": pngImage};
  }
}

class data {
  String? strPath;
  String? defaultColor;

  data(this.strPath, this.defaultColor);
}
