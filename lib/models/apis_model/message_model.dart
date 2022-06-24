// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  List<Messages>? messages;

  Message({this.messages});

  Message.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  int? id;
  int? from;
  int? to;
  Null groupid;
  String? message;
  String? type;
  int? admin;
  int? isRead;
  String? createdAt;
  String? updatedAt;
  List<MessageImage>? messageImage;
  User? user;
  Null mobileuser;

  Messages(
      {this.id,
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
      this.mobileuser});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = json['from'];
    to = json['to'];
    groupid = json['groupid'];
    message = json['message'];
    type = json['type'];
    admin = json['admin'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['message_image'] != null) {
      messageImage = <MessageImage>[];
      json['message_image'].forEach((v) {
        messageImage!.add(new MessageImage.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    mobileuser = json['mobileuser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from'] = this.from;
    data['to'] = this.to;
    data['groupid'] = this.groupid;
    data['message'] = this.message;
    data['type'] = this.type;
    data['admin'] = this.admin;
    data['is_read'] = this.isRead;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.messageImage != null) {
      data['message_image'] =
          this.messageImage!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['mobileuser'] = this.mobileuser;
    return data;
  }
}

class MessageImage {
  int? id;
  int? chatId;
  String? image;
  String? createdAt;
  String? updatedAt;

  MessageImage(
      {this.id, this.chatId, this.image, this.createdAt, this.updatedAt});

  MessageImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatId = json['chat_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chat_id'] = this.chatId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? userType;
  String? app;
  String? status;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.userType,
      this.app,
      this.status,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    userType = json['user_type'];
    app = json['app'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['user_type'] = this.userType;
    data['app'] = this.app;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
