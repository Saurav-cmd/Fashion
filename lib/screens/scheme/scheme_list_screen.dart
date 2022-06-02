import 'dart:io';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/price_list_controller.dart';
import 'package:fashion_paints/screens/price/pdf_viewer_screen.dart';
import 'package:fashion_paints/widgets/dilogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

//schemeList and price list ko data module same xa tai vhaya ra price list kai model use garaya ko scheme list ko lagi ne and scheme list ko controller price list controller mai xa
class SchemeList extends StatefulWidget {
  const SchemeList({Key? key}) : super(key: key);

  @override
  _SchemeListState createState() => _SchemeListState();
}

class _SchemeListState extends State<SchemeList> {
  PriceListController pLC = Get.put(PriceListController());

  Future<String?> fetchApiData() async {
    try {
      final internet = await InternetAddress.lookup("example.com");
      if (internet.isNotEmpty && internet[0].rawAddress.isNotEmpty) {
        print("Internet success");
        await pLC.getSchemeListData(context).whenComplete(() {
          setState(() {
            pLC.priceData;
          });
        });
      }
    } on SocketException catch (_) {
      AlertBox().noWifiConnection(context);
      print("Not Connected");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchApiData();
    super.initState();
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
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("Dealer_button_Navigation_Bar");
                },
              );
            },
          ),
          elevation: 0,
          backgroundColor: ChooseColor(0).appBarColor1,
          title: const Text(
            'Scheme List',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.home_filled,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed("Dealer_button_Navigation_Bar");
                      }),
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.020, horizontal: size.width * 0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Scheme list published by Fashion Paints",
                style: TextStyle(color: ChooseColor(0).appBarColor1),
              ),
              Obx(() {
                if (pLC.isLoading.value) {
                  return Padding(
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
                                "Fetching price list please wait...",
                                overflow: TextOverflow.clip,
                              )),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        )
                      ],
                    ))),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: pLC.priceData.length,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.015),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => PricePdf(
                                          pdfFile: pLC.priceData[i].image!,
                                          title: "Scheme List Pdf",
                                        )));
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: 210,
                                              child: Text(
                                                '${pLC.priceData[i].title}',
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          const Image(
                                            image: AssetImage(
                                              'icons/pdf.png',
                                            ),
                                            height: 45,
                                            width: 35,
                                          )
                                        ],
                                      ),
                                      Text(
                                        '${pLC.priceData[i].content}',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
              }),
            ],
          ),
        ));
  }
}
