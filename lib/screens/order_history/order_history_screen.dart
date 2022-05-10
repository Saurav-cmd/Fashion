import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/order_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final OrderHistoryController _orderHistoryController = Get.put(OrderHistoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orderHistoryController.getOrderHistory(context);
  }

  @override
  Widget build(BuildContext context) {
    print(
        'order history lenth ${_orderHistoryController.oderHistory!.map((e) => e.status).toList()}');
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
      body: SingleChildScrollView(
        child: Obx(() {
          if (_orderHistoryController.isLoading.value) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: ChooseColor(0).appBarColor1,
                    ),
                  ],
                ),
              ),
            );
          }
          if(_orderHistoryController.oderHistory?.isEmpty ?? true){
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

          }
          else {
            return Column(
              children: [
                ..._orderHistoryController.canceledOrder
                    .map((e) => Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 10),
                  child: Container(
                    height: 160,
                    width: double.infinity,
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
                                    "${NepaliDateFormat("d MMMM, y").format(e!.date.toNepaliDateTime())}",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 5),
                              child: Text(
                                e.id.toString(),
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
                                MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'item',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black54),
                                  ),
                                  SizedBox(
                                    width: 175,
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
                                  left: 0, right: 12, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0),
                                    child: Text(
                                      e.numOfOrder.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      'Rs.${e.totalPrice}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Canceled by customer',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
                    .toList(),
                ..._orderHistoryController.yetRevApprove
                    .map((e) => Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 10),
                  child: Container(
                    height: 160,
                    width: double.infinity,
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
                                    "${NepaliDateFormat("d MMMM, y").format(e!.date.toNepaliDateTime())}",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 5),
                              child: Text(
                                e.id.toString(),
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
                                MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'item',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black54),
                                  ),
                                  SizedBox(
                                    width: 175,
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
                                  left: 0, right: 12, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0),
                                    child: Text(
                                      e.numOfOrder.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      'Rs.${e.totalPrice}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: Colors.orange.shade400,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'This order is yet to be reviewed',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.orange.shade400),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
                    .toList(),
                ..._orderHistoryController.underProcess
                    .map((e) => Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 10),
                  child: Container(
                    height: 160,
                    width: double.infinity,
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
                                    "${NepaliDateFormat("d MMMM, y").format(e!.date.toNepaliDateTime())}",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 5),
                              child: Text(
                                e.id.toString(),
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
                                MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    'item',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black54),
                                  ),
                                  SizedBox(
                                    width: 175,
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
                                  left: 0, right: 12, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0),
                                    child: Text(
                                      e.numOfOrder.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      'Rs.${e.totalPrice}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 10),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: Color(0xff046C98),
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Under process',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff046C98)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
                    .toList()
              ],
            );
          }
        }),
      ),
    );
  }
}
