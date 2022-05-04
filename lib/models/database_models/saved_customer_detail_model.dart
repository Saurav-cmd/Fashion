class SavedCustomerDetail {
  int? id;
  String? customerName;
  String? address;
  String? contact;

  SavedCustomerDetail({
    this.id,
    this.customerName,
    this.address,
    this.contact,
  });

  factory SavedCustomerDetail.fromMap(Map<String,dynamic>json)=>SavedCustomerDetail(
    id: json["id"],
    customerName: json["customerName"],
    address: json["address"],
    contact: json["contact"],
  );

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "customerName":customerName,
      "address":address,
      "contact":contact,
    };
  }
}
