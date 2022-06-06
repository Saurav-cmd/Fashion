import 'dart:convert';
import 'dart:io';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/statement_controller.dart';
import '../../widgets/dilogue_box.dart';

class StatementPdf extends StatefulWidget {
  StatementPdf({Key, key}) : super(key: key);
  @override
  State<StatementPdf> createState() => _StatementPdfState();
}

class _StatementPdfState extends State<StatementPdf> {
  StatementController sC = Get.put(StatementController());
  String? pdfUrl;
  String? token;
  int? userId;
  String? dealerId;

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      setState(() {
        token = jsonDecode(userData)['token'];
        userId = jsonDecode(userData)['user_id'];
        dealerId = jsonDecode(userData)['dealer_id'];
        getApiData();
      });
    } else {
      return null;
    }
  }

  getApiData() async {
    try {
      final result = await InternetAddress.lookup("example.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return await sC
            .getStatementData(dealerId, token, context)
            .whenComplete(() {
          setState(() {
            sC.data;
          });
        });
      }
    } on SocketException catch (_) {
      AlertBox().noWifiConnection(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print("This is dealerId $dealerId");
    print("This is token id $token");
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1, // For iOS (dark icons)
            statusBarIconBrightness: Brightness.light),
        elevation: 0,
        title: Text("Statement Pdf"),
        backgroundColor: ChooseColor(0).appBarColor1,
      ),
      body: const PDF().fromUrl(
        sC.data!.ledgerFile!,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(
            child: Text(
          "File Not Found!",
          style: TextStyle(
              color: ChooseColor(0).appBarColor1, fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
