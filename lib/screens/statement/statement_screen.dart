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
      AlertBox().noWifiConnection(5, "", "", context);
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ChooseColor(0).bodyBackgroundColor,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:
                  ChooseColor(0).appBarColor1, // For iOS (dark icons)
              statusBarIconBrightness: Brightness.light),
          elevation: 0,
          title: Text("Statement Pdf"),
          backgroundColor: ChooseColor(0).appBarColor1,
        ),
        body: Obx(() {
          if (sC.isLoading.value) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.3,
                      left: size.width * 0.1,
                      right: size.width * 0.1),
                  child: Card(
                      child: Center(
                          child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.height * 0.008 + size.width * 0.008,
                            top: size.height * 0.008 + size.width * 0.008,
                            bottom: size.height * 0.008 + size.width * 0.008),
                        child: CircularProgressIndicator(
                          color: ChooseColor(0).appBarColor1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.030,
                        ),
                        child: SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              "Fetching statement please wait.....",
                              overflow: TextOverflow.clip,
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      )
                    ],
                  ))),
                ),
              ],
            );
          } else
            return const PDF().fromUrl(
              sC.data!.ledgerFile!,
              placeholder: (double progress) =>
                  Center(child: Text('$progress %')),
              errorWidget: (dynamic error) => Center(
                  child: Text(
                "File Not Found!",
                style: TextStyle(
                    color: ChooseColor(0).appBarColor1,
                    fontWeight: FontWeight.w400),
              )),
            );
        }));
  }
}
