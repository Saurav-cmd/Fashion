// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    this.message,
  });

  List<MessageElement>? message;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: List<MessageElement>.from(
            json["message"].map((x) => MessageElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class MessageElement {
  MessageElement({
    this.id,
    this.from,
    this.to,
    this.message,
    this.admin,
    this.isRead,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? from;
  int? to;
  String? message;
  dynamic admin;
  int? isRead;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MessageElement.fromJson(Map<String, dynamic> json) => MessageElement(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        message: json["message"],
        admin: json["admin"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "to": to,
        "message": message,
        "admin": admin,
        "is_read": isRead,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
