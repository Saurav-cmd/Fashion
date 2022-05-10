class Customer {
  int? id;
  String? customerName;
  String? address;
  String? contact;
  String? colorName;
  List<ColorInfo>? colorData;

  Customer(
      {this.id,
      this.customerName,
      this.address,
      this.contact,
      this.colorName,
      this.colorData});

  factory Customer.fromMap(Map<String, dynamic> json) =>
      Customer(
          id: json["id"],
          customerName: json["customerName"],
          address: json["address"],
          contact: json["contact"],
          colorName: json["colorName"],
          colorData: json["colorData"]);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "customerName": customerName,
      "address": address,
      "contact": contact,
      "colorName": colorName,
      "colorData": colorData
    };
  }
}

class ColorInfo {
  int? cid;
  String? colorName;
  String? colorCode;
  double? rValue;
  double? gValue;
  double? bValue;
  double? canSize;
  String? productName;
  ColorInfo(
      {this.cid,
      this.colorName,
      this.colorCode,
      this.rValue,
      this.gValue,
      this.bValue,
      this.canSize,
      this.productName});

  factory ColorInfo.forMap(Map<String, dynamic> json) => ColorInfo(
      cid: json["cid"],
      colorName: json["colorName"],
      colorCode: json["colorCode"],
      rValue: json["rValue"],
      gValue: json["gValue"],
      bValue: json["bValue"],
      canSize: json["canSize"],
      productName: json["productName"]);
  Map<String, dynamic> toMap() {
    return {
      "cid": cid,
      "colorName": colorName,
      "colorCode": colorCode,
      "rValue": rValue,
      "gValue": gValue,
      "bValue": bValue,
      "canSize": canSize,
      "productName":productName
    };
  }
}
