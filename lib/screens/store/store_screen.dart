import 'package:connectivity/connectivity.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/add_to_cart_controller.dart';
import 'package:fashion_paints/controllers/store_controller.dart';
import 'package:fashion_paints/screens/store/get_cart_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../order_history/order_history_screen.dart';


class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int testPrice = 1000;
  final StoreController _storeController = Get.put(StoreController());
  final CartController _cartController = Get.put(CartController());

  final _findStoreController = TextEditingController();
  List storeSearch = [];
// final  OrderHistoryController _orderHistoryController =
//   Get.put(OrderHistoryController());

  Future fetchStore() async {
    await _storeController.fetchProduct(context).whenComplete(() {
      _storeController.productItem;

      addStoreProduct();
    });
  }

  addStoreProduct() async {
    setState(() {
      storeSearch.clear();
    });
    for (int i = 0; i < _storeController.productItem.length; i++) {
      if (_storeController.productItem != null) {
        setState(() {
          storeSearch.add(_storeController.productItem[i]);
        });
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();







    // Connectivity().checkConnectivity().then((internetconnection) {
    //   if (internetconnection == ConnectivityResult.none) {
    //     print('no internet detected in initstate');
    //     forAddToCart(BuildContext context) {
    //       Widget RetryButton = TextButton(
    //           onPressed: () {
    //             Connectivity().checkConnectivity().then((newinternetconnection) {
    //               if (newinternetconnection != ConnectivityResult.none) {
    //                 Navigator.pop(context);
    //                 WidgetsBinding.instance?.addPostFrameCallback((_) {
    //                   fetchStore();
    //                 });
    //
    //
    //               }
    //             });
    //           },
    //           child: Container(
    //             height: 40,
    //             width: MediaQuery.of(context).size.width * 0.31,
    //             color: ChooseColor(0).appBarColor1,
    //             child: Center(
    //               child: Text(
    //                 'Retry'.toUpperCase(),
    //                 style: const TextStyle(
    //                     color: Colors.white, fontWeight: FontWeight.w500),
    //               ),
    //             ),
    //           ));
    //       AlertDialog alert = AlertDialog(
    //         contentPadding: EdgeInsets.zero,
    //         title: WillPopScope(
    //           onWillPop: () async => false,
    //           child: Column(
    //             children: const [
    //               Text(
    //                 "No Internet Connection",
    //                 style: TextStyle(
    //                     color: Colors.black87,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 16),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Image(
    //                 image: AssetImage(
    //                   "icons/network.png",
    //                 ),
    //                 height: 60,
    //                 width: 60,
    //               ),
    //             ],
    //           ),
    //         ),
    //         content: const Padding(
    //           padding: EdgeInsets.only(left: 40.0, right: 30, top: 10),
    //           child: Text(
    //             "Please recheck your internet connection and try again.",
    //             style: const TextStyle(color: Colors.black54, fontSize: 16),
    //           ),
    //         ),
    //         //Text("Are you sure to Place your Order ?"),
    //         actions: [
    //           RetryButton,
    //         ],
    //       );
    //       showDialog(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return alert;
    //         },
    //       );
    //       showDialog(
    //         barrierDismissible: false,
    //         context: context,
    //         builder: (BuildContext context) {
    //           return alert;
    //         },
    //       );
    //     }
    //
    // }});


    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchStore();
    });
    _findStoreController.addListener(() {
      _runFilter(_findStoreController.value.text);
    });
    _storeController.fetchProduct(context);
  }

  void _runFilter(String enterKeyword) {
    List results = [];
    if (enterKeyword.isEmpty) {
      results = _storeController.productItem;
    } else {
      results = _storeController.productItem
          .where((u) => (u.categoryName.toLowerCase())
          .contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      storeSearch = results;
    });
  }

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: _storeController.isLoading.value
          ? Colors.grey.shade100
          : ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed("Dealer_button_Navigation_Bar");
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white60,
          iconSize: 20,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1,
            statusBarIconBrightness: Brightness.light),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Fashion Paints Store"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartItem()));
                //Navigator.of(context).pushNamed("Cart_screen");
              },
              icon: const Icon(Icons.shopping_cart)),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=> OrderHistory()));
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible:
              _storeController.productItem.toString().replaceAll('', '') ==
                  ''
                  ? false
                  : true,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.040,
                      vertical: size.height * 0.015),
                  child: Form(
                    key: _form,
                    child: TextFormField(
                      controller: _findStoreController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: size.height * 0.001,
                            horizontal: size.width * 0.030),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        // labelText: 'Phone Number',
                        fillColor: const Color(0xffF6F9FA),
                        filled: true,
                        hintText: 'Search Item by name',
                        prefixIcon: const Icon(Icons.search),
                        hintStyle: TextStyle(
                            fontSize: size.height * 0.012 + size.width * 0.012,
                            color: Colors.black26),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //test Start card
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0),
            //   child: Text('$startCard'),
            // ),
            //test start card

            // Text(
            //   "Artistic Paint",
            //   style: TextStyle(
            //       color: ChooseColor(0).appBarColor1,
            //       fontWeight: FontWeight.w600,
            //       fontSize: size.height * 0.012 + size.width * 0.012),
            // ),
            Obx(() {
              if (_storeController.isLoading.value) {
                return Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15)),
                          height: 70,
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: ChooseColor(0).buttonColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (_storeController.productItem.isEmpty) {
                return Padding(
                  padding:
                  const EdgeInsets.only(left: 25.0, right: 25, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "No Internet Connection",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ChooseColor(0).appBarColor1,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Please recheck your internet connection and try again.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ChooseColor(0).appBarColor1, fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage("icons/network.png"))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 50),
                        child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                              height: 45,
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.resolveWith(
                                        (states) => Colors.transparent),
                                side: MaterialStateProperty.resolveWith(
                                        (states) =>
                                        BorderSide(color: Color(0xff443F77))),
                              ),
                              onPressed: () {
                                WidgetsBinding.instance
                                    ?.addPostFrameCallback((_) {
                                  fetchStore();
                                });
                              },
                              child: const Text(
                                'Retry',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xff443F77),
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  ),
                );
              } else {
                return Wrap(
                  direction: Axis.horizontal,
                  children: [
                    ...storeSearch
                        .map(
                          (e) => Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15.0, left: 14, right: 7),
                        child: GestureDetector(
                          // onPanDown: (detils){
                          //   print(detils.localPosition);
                          // },
                          onTap: () {
                            _storeController.storeNumber.value = 1;

                            //storeNumber class here
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return GetX<StoreController>(builder: (_) {
                                  return Container(
                                    height: 230,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 80,
                                              width: 80,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: AssetImage(
                                                          'icons/logo 2.png'))),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                      size.width * 0.020),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 25.0,
                                                        left: 25),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          e.productName,
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black87,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          e.categoryName,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: ChooseColor(
                                                                  0)
                                                                  .buttonColor),
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          'Quantity',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                              fontSize: 18,
                                                              color: ChooseColor(
                                                                  0)
                                                                  .buttonColor),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              right: 15.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    15.0),
                                                                child:
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    _storeController
                                                                        .decrement();
                                                                    print(
                                                                        'decrement is pressed');
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .minimize_sharp),
                                                                ),
                                                              ),
                                                              Container(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300,
                                                                height: 35,
                                                                width: 35,
                                                                child: Center(
                                                                    child: Text(_
                                                                        .storeNumber
                                                                        .toString())),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                    3.0),
                                                                child:
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    _storeController
                                                                        .increment(
                                                                        e.price);
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .add),
                                                                ),
                                                              ),
                                                              //testPrice *
                                                              //                                                                             _storeController
                                                              //                                                                                 .storeNumber.toInt()
                                                              Container(
                                                                  child: Text(
                                                                    'Rs.${e.price * _storeController.storeNumber.toInt()}',

                                                                    //'Rs.${e.price}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                        18,
                                                                        color: ChooseColor(
                                                                            0)
                                                                            .buttonColor,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                  ))
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            String dealerId = 'BT001';

                                            Connectivity()
                                                .checkConnectivity()
                                                .then(
                                                    (internetconnection) async {
                                                  if (internetconnection ==
                                                      ConnectivityResult.none) {
                                                    Navigator.pop(context);
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
                                                    print(
                                                        'id of product ${e.id}');
                                                    print(
                                                        ' quanity${_storeController.storeNumber}');
                                                    print(
                                                        'dealerid ${dealerId}');
                                                    Navigator.pop(context);

                                                    _cartController.addToCart(
                                                        context,
                                                        dealerId,
                                                        e.id,
                                                        _storeController
                                                            .storeNumber);
                                                  }
                                                });
                                          },
                                          child: Container(
                                            height: 45,
                                            width: double.infinity,
                                            color:
                                            ChooseColor(0).buttonColor,
                                            child: const Center(
                                                child: Text(
                                                  'ADD ITEMS',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                              },
                            );
                          },
                          child: Container(
                            color: Colors.white,
                            //  color: Colors.grey.shade100,
                            // height: 140,
                            width: size.width * 0.27,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5),
                                  child: Container(
                                    height: 80,
                                    width: size.width * 25,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                'icons/logo 2.png'))),
                                  ),
                                ),
                                Text(
                                  e.productName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: size.height * 0.008 +
                                          size.width * 0.008),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Center(
                                  child: Text('Rs ${e.price}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                          ChooseColor(0).buttonColor)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                //   Ex
                                //   Expanded(child: Text('Prashant'))
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                        .toList()
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
