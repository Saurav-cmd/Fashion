// To parse this JSON data, do
//
//     final statementList = statementListFromJson(jsonString);

import 'dart:convert';

StatementList statementListFromJson(String str) =>
    StatementList.fromJson(json.decode(str));

String statementListToJson(StatementList data) => json.encode(data.toJson());

class StatementList {
  String? ledgerFile;
  Null ledgerUpdateDate;

  StatementList({this.ledgerFile, this.ledgerUpdateDate});

  StatementList.fromJson(Map<String, dynamic> json) {
    ledgerFile = json['ledger_file'];
    ledgerUpdateDate = json['ledger_update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ledger_file'] = this.ledgerFile;
    data['ledger_update_date'] = this.ledgerUpdateDate;
    return data;
  }
}
