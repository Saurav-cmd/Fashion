class DatabaseColorBase {
  int?id;
  int? bId;
  String? base;
  double? unitPrice1;
  double? unitPrice2;
  double? unitPrice3;
  double? unitPrice4;
  double? kGLtrFlag;

  DatabaseColorBase({
      this.id,
      this.bId,
      this.base,
      this.unitPrice1,
      this.unitPrice2,
      this.unitPrice3,
      this.unitPrice4,
      this.kGLtrFlag
  });

  factory DatabaseColorBase.fromMap(Map<String,dynamic>json)=>DatabaseColorBase(
      id:json["id"] ,
      bId: json["bId"],
      base:json["base"],
      unitPrice1:json["unitPrice1"],
      unitPrice2:json["unitPrice2"],
      unitPrice3:json["unitPrice3"],
      unitPrice4:json["unitPrice4"],
      kGLtrFlag:json["kGLtrFlag"]
  );

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "bId":bId,
      "base":base,
      "unitPrice1":unitPrice1,
      "unitPrice2":unitPrice2,
      "unitPrice3":unitPrice3,
      "unitPrice4":unitPrice4,
      "kGLtrFlag":kGLtrFlag
    };
  }
}
