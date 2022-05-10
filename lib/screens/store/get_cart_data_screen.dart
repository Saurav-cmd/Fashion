import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../colors/colors_file.dart';
import '../../controllers/confirm_order_controller.dart';
import '../../controllers/delete_cart_item.dart';
import '../../controllers/get_cart_data_controller.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final GetCartController _getCartController = Get.put(GetCartController());
  final DeleteCartItemController _deleteCartItemController =
  Get.put(DeleteCartItemController());
  final ConfirmOrderController _confirmOrderController =Get.put(ConfirmOrderController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('everytime when getcart data is open');
    _getCartController.getAllCartData(context);
  }

  // void increment(var quantity) {
  //
  //     quantity++;
  //     print('quantity increase ${quantity}');
  //
  // }
  //
  // void decrement(var quantity) {
  //
  //     print('testing quantity ${quantity--}');
  //     if (quantity > 1) {
  //       quantity--;
  //     }
  //
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.of(context)
            //     .pushReplacementNamed("Dealer_button_Navigation_Bar");
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
          // GestureDetector(
          //     onTap: () {
          //       Navigator.of(context).pushNamed("Order_history_screen");
          //     },
          //     child: Icon(Icons.reorder)),
          // //child: Image.asset("icons/saved.png")),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed("Dealer_button_Navigation_Bar");
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      body: Obx(() {
        if (_getCartController.isLoading.value) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: ChooseColor(0).appBarColor1,
                  ),
                ),
              ),
            ],
          );
        }
        if (_getCartController.cartList?.isEmpty ?? true) {
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
          return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //      _deleteCartItemController.deleteItem(context, e.id);
                        //                         print('id of cart item ${e.id}');
                        ..._getCartController.cartList!
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    Navigator.of(ctx).pop(false);
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

                                                    // AlertBox().noWifiConnection(context);
                                                    // AlertBox().forAddToCart(context,dealerId,e.id,_storeController.storeNumber);

                                                  } else {
                                                    _deleteCartItemController
                                                        .deleteItem(
                                                        context, e.id);
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

                                      //
                                      //
                                      // ElevatedButton(
                                      //     onPressed: (){
                                      //    _deleteCartItemController.deleteItem(context, e.id);
                                      //    Navigator.of(ctx).pop(true);
                                      // },
                                      //
                                      //     child: const Text('YES')),
                                      // ElevatedButton(
                                      //     onPressed: (){
                                      //   Navigator.of(ctx).pop(false);
                                      // }, child: const Text('NO'))
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
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, top: 10),
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
                                                              var passQuantity = e
                                                                  .quantity
                                                                  .toInt();

                                                              print(
                                                                  'decrement is pressed');
                                                              // decrement(
                                                              //     passQuantity);
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
                                                              var passQuantity = e
                                                                  .quantity
                                                                  .toInt();
                                                              print(
                                                                  'increment is pressed');

                                                              // increment(
                                                              //     passQuantity);
                                                            },
                                                            icon: Icon(Icons.add),
                                                          ),
                                                        ),
                                                        Container(
                                                          //width: 85,
                                                            child: Text(
                                                              'Rs.${e.quantity * e.price}',
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
                        //cart item start here

                        /* Padding(
                      padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 15),
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
                                            image: AssetImage('icons/logo 2.png'))),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.020),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(top: 5.0, left: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "aluminium paints",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: ChooseColor(0).buttonColor),
                                            ),
                                            const SizedBox(
                                              height:10,
                                            ),
                                            Text(
                                              'Quantity',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: ChooseColor(0).buttonColor),
                                            ),
                                            Row(
                                              // mainAxisAlignment:
                                              // MainAxisAlignment
                                              //     .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 15.0),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      decrement();
                                                    },
                                                    icon: Icon(Icons.minimize_sharp),
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.grey.shade300,
                                                  height: 30,
                                                  width: 35,
                                                  child: Center(
                                                      child: Text(
                                                        '${startNumber}'.toString(),
                                                        style: TextStyle(fontSize: 12),
                                                      )),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 3.0),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      increment();
                                                    },
                                                    icon: Icon(Icons.add),
                                                  ),
                                                ),
                                                Container(
                                                  //width: 85,
                                                    child: Text(
                                                      'Rs.${75*startNumber}',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: ChooseColor(0).buttonColor,
                                                          fontWeight: FontWeight.w600),
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
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 15),
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
                                            image: AssetImage('icons/logo 2.png'))),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.020),
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(top: 5.0, left: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "aluminium paints",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: ChooseColor(0).buttonColor),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Quantity',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: ChooseColor(0).buttonColor),
                                            ),
                                            Row(
                                              // mainAxisAlignment:
                                              // MainAxisAlignment
                                              //     .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 15.0),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      decrement();
                                                    },
                                                    icon: Icon(Icons.minimize_sharp),
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.grey.shade300,
                                                  height: 30,
                                                  width: 35,
                                                  child: Center(
                                                      child: Text(
                                                        '${startNumber}'.toString(),
                                                        style: TextStyle(fontSize: 12),
                                                      )),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 3.0),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      increment();
                                                    },
                                                    icon: Icon(Icons.add),
                                                  ),
                                                ),
                                                Container(
                                                  //width: 85,
                                                    child: Text(
                                                      'Rs.${85*startNumber}',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: ChooseColor(0).buttonColor,
                                                          fontWeight: FontWeight.w600),
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
                    ),*/

                        //cart items ends here
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0, left: 15),
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
                                  Text(
                                    'Rs.0',
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
                GestureDetector(
                  onTap: (){
                    Connectivity().checkConnectivity().then((internetconnection) {
                      if (internetconnection == ConnectivityResult.none) {
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




                      }else{
                        print('another method');
                        List passingList =_getCartController.cartList!.map((e) => e.id).toList();
                        _confirmOrderController.confirmOrder(context, passingList);

                      }
                    });


                    print('order id all checking ${_getCartController.cartList!.map((e) => e.id).toList()}');
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
                ),
              ]);
        }
      }),
    );
  }
}

//dummy testing project
/*
import 'package:fashion_paints/controllers/get_cartdata_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../colors/colors_file.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final GetCartController _getCartController =Get.put(GetCartController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCartController.getAllCartData(context);


  }

  int startNumber =1;
  void increment(){
    setState(() {
      startNumber++;
    });
  }
  void decrement() {
    setState(() {
      if (startNumber > 1) {
        startNumber--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed("Dealer_button_Navigation_Bar");
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
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("Order_history_screen");
              },
              child: Icon(Icons.reorder)),
          //child: Image.asset("icons/saved.png")),
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed("Dealer_button_Navigation_Bar");
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0, right: 15, top: 15),
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
                                        image: AssetImage('icons/logo 2.png'))),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.020),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 5.0, left: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Name',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "aluminium paints",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: ChooseColor(0).buttonColor),
                                        ),
                                        const SizedBox(
                                          height:10,
                                        ),
                                        Text(
                                          'Quantity',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: ChooseColor(0).buttonColor),
                                        ),
                                        Row(
                                          // mainAxisAlignment:
                                          // MainAxisAlignment
                                          //     .spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15.0),
                                              child: IconButton(
                                                onPressed: () {
                                                  decrement();
                                                },
                                                icon: Icon(Icons.minimize_sharp),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.grey.shade300,
                                              height: 30,
                                              width: 35,
                                              child: Center(
                                                  child: Text(
                                                    '${startNumber}'.toString(),
                                                    style: TextStyle(fontSize: 12),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 3.0),
                                              child: IconButton(
                                                onPressed: () {
                                                  increment();
                                                },
                                                icon: Icon(Icons.add),
                                              ),
                                            ),
                                            Container(
                                              //width: 85,
                                                child: Text(
                                                  'Rs.${75*startNumber}',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: ChooseColor(0).buttonColor,
                                                      fontWeight: FontWeight.w600),
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
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15.0, right: 15, top: 15),
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
                                        image: AssetImage('icons/logo 2.png'))),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.020),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 5.0, left: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Name',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "aluminium paints",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: ChooseColor(0).buttonColor),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Quantity',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: ChooseColor(0).buttonColor),
                                        ),
                                        Row(
                                          // mainAxisAlignment:
                                          // MainAxisAlignment
                                          //     .spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15.0),
                                              child: IconButton(
                                                onPressed: () {
                                                  decrement();
                                                },
                                                icon: Icon(Icons.minimize_sharp),
                                              ),
                                            ),
                                            Container(
                                              color: Colors.grey.shade300,
                                              height: 30,
                                              width: 35,
                                              child: Center(
                                                  child: Text(
                                                    '${startNumber}'.toString(),
                                                    style: TextStyle(fontSize: 12),
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 3.0),
                                              child: IconButton(
                                                onPressed: () {
                                                  increment();
                                                },
                                                icon: Icon(Icons.add),
                                              ),
                                            ),
                                            Container(
                                              //width: 85,
                                                child: Text(
                                                  'Rs.${85*startNumber}',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: ChooseColor(0).buttonColor,
                                                      fontWeight: FontWeight.w600),
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



                //cart items ends here
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15),
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
                          Text(
                            'Rs. 12000',
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
        Container(
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
      ]),
    );
  }
}
*/
