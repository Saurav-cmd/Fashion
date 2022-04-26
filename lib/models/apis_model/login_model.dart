// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.errorCode,
    required this.message,
    required this.token,
    required this.dealerInfo,
    required this.dealerUser,
  });

  String status;
  String errorCode;
  String message;
  String token;
  DealerInfo dealerInfo;
  DealerUser dealerUser;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    errorCode: json["error_code"],
    message: json["message"],
    token: json["token"],
    dealerInfo: DealerInfo.fromJson(json["dealer_info"]),
    dealerUser: DealerUser.fromJson(json["Dealer_user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error_code": errorCode,
    "message": message,
    "token": token,
    "dealer_info": dealerInfo.toJson(),
    "Dealer_user": dealerUser.toJson(),
  };
}

class DealerInfo {
  DealerInfo({
    required this.code,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.mobile,
    required this.email,
    required this.phone,
    required this.state,
    required this.areaCode,
    required this.subarea,
    required this.orderLimit,
    required this.status,
    required this.activeStatus,
    this.ledgerFile,
    required this.dueAmount,
    required this.chequeInHand,
    required this.chequeNos,
    this.ledgerUpdateDate,
    this.createdBy,
    this.panVatNo,
    this.proprietorName,
    required this.sync,
    required this.createdAt,
    required this.updatedAt,
  });

  String code;
  String name;
  String address;
  double latitude;
  double longitude;
  String mobile;
  String email;
  String phone;
  dynamic state;
  String areaCode;
  String subarea;
  int orderLimit;
  String status;
  String activeStatus;
  dynamic ledgerFile;
  int dueAmount;
  int chequeInHand;
  int chequeNos;
  dynamic ledgerUpdateDate;
  dynamic createdBy;
  dynamic panVatNo;
  dynamic proprietorName;
  int sync;
  DateTime createdAt;
  DateTime updatedAt;

  factory DealerInfo.fromJson(Map<String, dynamic> json) => DealerInfo(
    code: json["code"],
    name: json["name"],
    address: json["address"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    mobile: json["mobile"],
    email: json["email"],
    phone: json["phone"],
    state: json["State"],
    areaCode: json["area_code"],
    subarea: json["subarea"],
    orderLimit: json["order_limit"],
    status: json["status"],
    activeStatus: json["active_status"],
    ledgerFile: json["ledger_file"],
    dueAmount: json["due_amount"],
    chequeInHand: json["cheque_in_hand"],
    chequeNos: json["cheque_nos"],
    ledgerUpdateDate: json["ledger_update_date"],
    createdBy: json["created_by"],
    panVatNo: json["pan_vat_no"],
    proprietorName: json["proprietor_name"],
    sync: json["sync"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "mobile": mobile,
    "email": email,
    "phone": phone,
    "State": state,
    "area_code": areaCode,
    "subarea": subarea,
    "order_limit": orderLimit,
    "status": status,
    "active_status": activeStatus,
    "ledger_file": ledgerFile,
    "due_amount": dueAmount,
    "cheque_in_hand": chequeInHand,
    "cheque_nos": chequeNos,
    "ledger_update_date": ledgerUpdateDate,
    "created_by": createdBy,
    "pan_vat_no": panVatNo,
    "proprietor_name": proprietorName,
    "sync": sync,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class DealerUser {
  DealerUser({
    required this.id,
    required this.fullName,
    required this.address,
    required this.phone,
    required this.userCode,
    required this.userPassO,
    required this.dealerId,
    required this.userRole,
    required this.status,
    required this.createdBy,
    required this.token,
    required this.fcmId,
    required this.deviceId,
    required this.sync,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String fullName;
  String address;
  String phone;
  String userCode;
  String userPassO;
  String dealerId;
  int userRole;
  int status;
  int createdBy;
  String token;
  String fcmId;
  String deviceId;
  int sync;
  DateTime createdAt;
  DateTime updatedAt;

  factory DealerUser.fromJson(Map<String, dynamic> json) => DealerUser(
    id: json["id"],
    fullName: json["full_name"],
    address: json["address"],
    phone: json["phone"],
    userCode: json["user_code"],
    userPassO: json["user_pass_o"],
    dealerId: json["dealer_id"],
    userRole: json["user_role"],
    status: json["status"],
    createdBy: json["created_by"],
    token: json["token"],
    fcmId: json["fcm_id"],
    deviceId: json["device_id"],
    sync: json["sync"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "address": address,
    "phone": phone,
    "user_code": userCode,
    "user_pass_o": userPassO,
    "dealer_id": dealerId,
    "user_role": userRole,
    "status": status,
    "created_by": createdBy,
    "token": token,
    "fcm_id": fcmId,
    "device_id": deviceId,
    "sync": sync,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
