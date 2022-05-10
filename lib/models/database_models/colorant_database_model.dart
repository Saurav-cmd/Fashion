class Colorants {
  int? columnId;
  int? id;
  String? colorantName;
  String? colorantCode;
  double? unitPrice;
  double? rValue;
  double? gValue;
  double? bValue;


  Colorants({
      this.columnId,
       this.id,
       this.colorantName,
       this.colorantCode,
       this.unitPrice,
       this.rValue,
       this.gValue,
       this.bValue,

  });

  factory Colorants.fromMap(Map<String,dynamic>json)=>Colorants(
      columnId: json["columnId"],
      id:json["id"],
      colorantName:json["colorantName"],
      colorantCode:json["colorantCode"],
      unitPrice:json["unitPrice"],
      rValue:json["rValue"],
      gValue:json["gValue"],
      bValue:json["bValue"],

  );

  Map<String,dynamic> toMap(){
    return{
      "columnId":columnId,
      "id":id,
      "colorantName":colorantName,
      "colorantCode":colorantCode,
      "unitPrice":unitPrice,
      "rValue":rValue,
      "gValue":gValue,
      "bValue":bValue,
    };
  }

}
