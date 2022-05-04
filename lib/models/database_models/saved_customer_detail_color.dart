class CustomerSavedColor{
  int?id;
  int? cDForeignKey;
  String? colorName;
  String? colorCode;
  String? productName;
  double? canSize;
  double? fandeckId;
  double? rColor;
  double? gColor;
  double? bColor;

  CustomerSavedColor({
    this.id,
    this.colorName,
    this.cDForeignKey,
    this.colorCode,
    this.productName,
    this.canSize,
    this.fandeckId,
    this.rColor,
    this.gColor,
    this.bColor
  });

  factory CustomerSavedColor.fromMap(Map<String,dynamic>json)=>CustomerSavedColor(
      id: json["id"],
      cDForeignKey: json["cDForeignKey"],
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
      "cDForeignKey":cDForeignKey,
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