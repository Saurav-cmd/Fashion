import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../colors/colors_file.dart';
import '../../controllers/confirm_order_controller.dart';
import '../../controllers/get_cart_data_controller.dart';
import '../../models/apis_model/get_cart_data_model.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int sum = 0;
  int totalPrice = 0;
  int totalPrice1 = 0;
  int sum1 = 0;
  List<GetCartData?> priceList = [];
  List<GetCartData?> quantityList = [];

  final GetCartController gCD = Get.put(GetCartController());
  final ConfirmOrderController cOC = Get.put(ConfirmOrderController());

  final ConfirmOrderController _confirmOrderController =
      Get.put(ConfirmOrderController());

  fetchApiData() async {
    await gCD.getAllCartData(context)!.whenComplete(() {
      setState(() {
        gCD.cartList;
        total();
      });
    });
  }

  //yo total vhana ko first ma page ma aaune bitikai ko total calculate garxa
  total() async {
    gCD.cartList!.forEach((e) {
      setState(() {
        sum = e.quantity! * e.price!;
        totalPrice = totalPrice + sum;
      });
    });
  }

  // yesle aaba plus or minus button click grayo vhane tai anusar calculate garxa
  totalCalculate(int? quantity, int? price) async {
    setState(() {
      totalPrice1 = 0;
      gCD.cartList!.forEach((e) {
        setState(() {
          sum = e.quantity! * e.price!;
          totalPrice1 = sum + totalPrice1;
        });
      });
    });
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          iconSize: 20,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ChooseColor(0).appBarColor1,
        ),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Cart"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed("Dealer_button_Navigation_Bar");
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      body: Obx(() {
        if (gCD.isLoading.value) {
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
                            "Fetching cart list please wait...",
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
        if (gCD.cartList!.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: Column(
              children: [
                Center(
                    child: Text(
                  'Your Cart is Empty',
                  style: TextStyle(
                      fontSize: 20, color: ChooseColor(0).appBarColor1),
                )),
              ],
            ),
          );
        } else {
          return Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...gCD.cartList!
                        .map(
                          (e) => Dismissible(
                            key: ValueKey(e.id),
                            confirmDismiss: (direction) {
                              return showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                        title: WillPopScope(
                                          onWillPop: () async => false,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Are you sure?',
                                                style: TextStyle(
                                                    color: ChooseColor(0)
                                                        .appBarColor1),
                                              ),
                                            ],
                                          ),
                                        ),
                                        content: const Text(
                                          'Do you want to remove the item from the cart',
                                          // textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                Connectivity()
                                                    .checkConnectivity()
                                                    .then(
                                                        (internetconnection) async {
                                                  if (internetconnection ==
                                                      ConnectivityResult.none) {
                                                    Navigator.of(ctx)
                                                        .pop(false);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                backgroundColor:
                                                                    Colors.red,
                                                                content: Text(
                                                                  "No Internet Connection...",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                )));
                                                  } else {
                                                    gCD.deleteCartData(
                                                        e.id, context);
                                                    Navigator.of(ctx).pop(true);
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.31,
                                                color:
                                                    ChooseColor(0).buttonColor,
                                                child: Center(
                                                  child: Text(
                                                    'YES'.toUpperCase(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.of(ctx).pop(false);
                                              },
                                              child: Container(
                                                height: 40,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.31,
                                                color:
                                                    ChooseColor(0).buttonColor,
                                                child: Center(
                                                  child: Text(
                                                    'No'.toUpperCase(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ));
                            },
                            onDismissed: (direction) {
                              print('api call can be used in future');
                            },
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Theme.of(context).errorColor,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 330),
                                child: Icon(
                                  Icons.delete,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.020,
                                  horizontal: size.width * 0.025),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5.0,
                                          ),
                                          child: Container(
                                            height: 75,
                                            width: 75,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: AssetImage(
                                                        'icons/logo 2.png'))),
                                          ),
                                        ),
                                        Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.020),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${e.productName}',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${e.categoryName}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: ChooseColor(0)
                                                          .buttonColor),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Quantity',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: ChooseColor(0)
                                                          .buttonColor),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 15.0),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            if (e.quantity ==
                                                                1) {
                                                              e.quantity;
                                                            } else {
                                                              e.quantity =
                                                                  e.quantity! -
                                                                      1;
                                                            }
                                                          });
                                                          totalCalculate(
                                                              e.quantity,
                                                              e.price);
                                                        },
                                                        icon: Icon(Icons
                                                            .minimize_sharp),
                                                      ),
                                                    ),
                                                    Container(
                                                      color:
                                                          Colors.grey.shade300,
                                                      height: 30,
                                                      width: 30,
                                                      child: Center(
                                                          child: Text(
                                                        '${e.quantity}'
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      )),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 3.0),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            e.quantity =
                                                                e.quantity! + 1;
                                                            totalCalculate(
                                                                e.quantity,
                                                                e.price);
                                                          });
                                                        },
                                                        icon: Icon(Icons.add),
                                                      ),
                                                    ),
                                                    Container(
                                                        //width: 85,
                                                        child: Text(
                                                      'Rs.${e.quantity! * e.price!}',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: ChooseColor(0)
                                                              .buttonColor,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    //cart items ends here
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.025),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        height: 45,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total'),
                              if (totalPrice1 == 0)
                                Text(
                                  '${totalPrice}',
                                  style: TextStyle(
                                      color: ChooseColor(0).buttonColor,
                                      fontSize: 18),
                                ),
                              if (totalPrice1 != 0)
                                Text(
                                  '${totalPrice1}',
                                  style: TextStyle(
                                      color: ChooseColor(0).buttonColor,
                                      fontSize: 18),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (cOC.isLoading.value) {
                return Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.015),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ChooseColor(0).appBarColor1,
                    ),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    Connectivity()
                        .checkConnectivity()
                        .then((internetConnection) {
                      if (internetConnection == ConnectivityResult.none) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "No Internet Connection...",
                                  style: TextStyle(fontSize: 16),
                                )));
                      } else {
                        for (int i = 0; i < gCD.cartList!.length; i++) {
                          cOC.confirmOrder(
                              gCD.cartList![i].productId,
                              gCD.cartList![i].quantity,
                              gCD.cartList![i].id,
                              DateFormat("yyyy-MM-dd").format(DateTime.now()),
                              context);
                        }
                      }
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: ChooseColor(0).buttonColor,
                      ),
                      height: 45,
                      width: double.infinity,
                      child: const Center(
                          child: Text(
                        'Confirm Order',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ))),
                );
              }
            })
          ]);
        }
      }),
    );
  }
}
