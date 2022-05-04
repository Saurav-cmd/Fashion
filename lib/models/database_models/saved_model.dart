class Saved {
  int? id;
  String? customerName;
  String? address;
  String? contact;
  String? colorName;
  String? colorCode;
  String? productName;
  double? canSize;
  double? fandeckId;
  double? rColor;
  double? gColor;
  double? bColor;

  Saved({
    this.id,
    this.customerName,
    this.address,
    this.contact,
    this.colorName,
    this.colorCode,
    this.productName,
    this.canSize,
    this.fandeckId,
    this.rColor,
    this.gColor,
    this.bColor
  });

  factory Saved.fromMap(Map<String,dynamic>json)=>Saved(
    id: json["id"],
    customerName: json["customerName"],
    address: json["address"],
    contact: json["contact"],
    colorName: json["colorName"],
    colorCode: json["colorCode"],
    productName: json["productName"],
    canSize: json["canSize"],
    fandeckId: json["fandeckId"],
    rColor: json["rColor"],
    gColor: json["gColor"],
    bColor: json["bColor"]
  );

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "customerName":customerName,
      "address":address,
      "contact":contact,
      "colorName":colorName,
      "colorCode":colorCode,
      "productName":productName,
      "canSize":canSize,
      "fandeckId":fandeckId,
      "rColor":rColor,
      "gColor":gColor,
      "bColor":bColor
    };
  }
}
