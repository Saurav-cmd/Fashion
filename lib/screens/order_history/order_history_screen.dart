import 'dart:io';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/order_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

import '../../widgets/dilogue_box.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  OrderHistoryController oHC = Get.put(OrderHistoryController());

  fetchApiData() async {
    try {
      final internet = await InternetAddress.lookup("example.com");
      if (internet.isNotEmpty && internet[0].rawAddress.isNotEmpty) {
        print("There is internet connection");
        oHC.getOrderHistory(context).whenComplete(() {
          setState(() {
            oHC.orderHistory;
          });
        });
      }
    } on SocketException catch (_) {
      AlertBox().noWifiConnection(14, "", "", context);
      print("Not Connected");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchApiData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1, // For iOS (dark icons)
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
                //store_screen
                Navigator.pop(context);
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text(
          'Order History',
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
      body: Obx(() {
        if (oHC.isLoading.value) {
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
                            "Fetching order list please wait...",
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
        }
        if (oHC.orderHistory!.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: Column(
              children: [
                Center(
                    child: Text(
                  'Your Order History is Empty',
                  style: TextStyle(
                      fontSize: 20, color: ChooseColor(0).appBarColor1),
                )),
              ],
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () => fetchApiData(),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: oHC.orderHistory!.length,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.010,
                        horizontal: size.width * 0.020),
                    child: Container(
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          elevation: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 30, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Order id',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black54),
                                    ),
                                    Text(
                                      "${NepaliDateFormat("d MMMM, y").format(oHC.orderHistory![i].date!.toNepaliDateTime())}",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 5),
                                child: Text(
                                  oHC.orderHistory![i].id.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 35, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'item',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black54),
                                    ),
                                    Text(
                                      'Price',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 35, top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      oHC.orderHistory![i].numOfOrder
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      'Rs.${oHC.orderHistory![i].totalPrice}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, top: 10, bottom: 10),
                                child: Row(
                                  children: [
                                    if (oHC.orderHistory![i].status ==
                                        "Approved")
                                      Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.green,
                                        size: 15,
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Sent to Dispatch")
                                      Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.lightBlue,
                                        size: 15,
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Dispatched")
                                      Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Pending")
                                      Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Declined")
                                      Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Cancelled")
                                      Icon(
                                        Icons.radio_button_checked,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                    SizedBox(
                                      width: 10,
                                      height: size.height * 0.010,
                                    ),
                                    if (oHC.orderHistory![i].status ==
                                        "Approved")
                                      Text(
                                        'Approved',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.green),
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Sent to Dispatch")
                                      Text(
                                        'Sent to Dispatch',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.lightBlue),
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Dispatched")
                                      Text(
                                        'Order Dispatched',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Pending")
                                      Text(
                                        'Order Pending',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.yellow),
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Declined")
                                      Text(
                                        'Declined',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.red),
                                      ),
                                    if (oHC.orderHistory![i].status ==
                                        "Cancelled")
                                      Text(
                                        'Order Cancelled',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.red),
                                      ),
                                  ],
                                ),
                              )
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
    );
  }
}
