class ShadeColorDatabase {
  int? columnId;
  int? id;
  int? sId;
  String? colorCode;
  String? colorName;
  double? styledist;
  double? weatherproofextemulsion;
  double? smartdist;
  double? cosmeticintemulsion;
  double? magnetextemulsion;
  double? rValue;
  double? gValue;
  double? bValue;

  ShadeColorDatabase(
      {this.columnId,
      this.id,
      this.sId,
      this.colorCode,
      this.colorName,
      this.styledist,
      this.weatherproofextemulsion,
      this.smartdist,
      this.cosmeticintemulsion,
      this.magnetextemulsion,
      this.rValue,
      this.gValue,
      this.bValue});

  factory ShadeColorDatabase.fromMap(Map<String, dynamic> json) =>
      ShadeColorDatabase(
          columnId: json["columnId"],
          id: json["id"],
          sId: json["sId"],
          colorCode: json["colorCode"],
          colorName: json["colorName"],
          styledist: json["styledist"],
          weatherproofextemulsion: json["weatherproofextemulsion"],
          smartdist: json["smartdist"],
          cosmeticintemulsion: json["cosmeticintemulsion"],
          magnetextemulsion: json["magnetextemulsion"],
          rValue: json["rValue"],
          gValue: json["gValue"],
          bValue: json["bValue"]);

  Map<String, dynamic> toMap() {
    return {
      "columnId": columnId,
      "id": id,
      "sId": sId,
      "colorCode": colorCode,
      "colorName": colorName,
      "styledist": styledist,
      "weatherproofextemulsion": weatherproofextemulsion,
      "smartdist": smartdist,
      "cosmeticintemulsion": cosmeticintemulsion,
      "magnetextemulsion": magnetextemulsion,
      "rValue": rValue,
      "gValue": gValue,
      "bValue": bValue,
    };
  }
}
