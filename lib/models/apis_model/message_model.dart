// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    this.messages,
  });

  List<MessageElement>? messages;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messages: List<MessageElement>.from(
            json["messages"].map((x) => MessageElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "messages": List<dynamic>.from(messages!.map((x) => x.toJson())),
      };
}

class MessageElement {
  MessageElement({
    this.id,
    this.from,
    this.to,
    this.groupid,
    this.message,
    this.type,
    this.admin,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.messageImage,
    this.user,
    this.mobileuser,
  });

  int? id;
  int? from;
  dynamic to;
  int? groupid;
  String? message;
  String? type;
  dynamic admin;
  int? isRead;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<MessageImage>? messageImage;
  dynamic user;
  dynamic mobileuser;

  factory MessageElement.fromJson(Map<String, dynamic> json) => MessageElement(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        groupid: json["groupid"],
        message: json["message"],
        type: json["type"],
        admin: json["admin"],
        isRead: json["is_read"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        messageImage: List<MessageImage>.from(
            json["message_image"].map((x) => MessageImage.fromJson(x))),
        user: json["user"],
        mobileuser: json["mobileuser"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "to": to,
        "groupid": groupid,
        "message": message,
        "type": type,
        "admin": admin,
        "is_read": isRead,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "message_image":
            List<dynamic>.from(messageImage!.map((x) => x.toJson())),
        "user": user,
        "mobileuser": mobileuser,
      };
}

class MessageImage {
  MessageImage({
    this.id,
    this.chatId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? chatId;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory MessageImage.fromJson(Map<String, dynamic> json) => MessageImage(
        id: json["id"],
        chatId: json["chat_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chat_id": chatId,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
