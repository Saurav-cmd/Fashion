import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/models/customer.dart';
import 'package:fashion_paints/screens/saved/saved_detail.dart';
import 'package:fashion_paints/widgets/dilogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../../models/database_models/saved_customer_detail_color.dart';
import '../../models/database_models/saved_customer_detail_model.dart';

class SavedScreen extends StatefulWidget {
  SavedScreen(
      {Key,
      this.colorName,
      this.productName,
      this.canSize,
      this.rColor,
      this.gColor,
      this.bColor,
      this.fandeckId,
      key})
      : super(key: key);
  String? colorName;
  String? productName;
  double? canSize;
  double? rColor;
  double? gColor;
  double? bColor;
  double? fandeckId;

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  String? passedColorName;
  String? passedProductName;
  double? passedCanSize;
  double? passedRColor;
  double? passedGColor;
  double? passedBColor;
  double? passedFandeckId;
  TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedColorName = widget.colorName;
    passedProductName = widget.productName;
    passedCanSize = widget.canSize;
    passedRColor = widget.rColor;
    passedGColor = widget.gColor;
    passedBColor = widget.bColor;
    passedFandeckId = widget.fandeckId;
    getSavedData();
  }

  List<SavedCustomerDetail> savedDataList = [];
  List<int?> databaseColumnId = [];
  List<int?> anotherDatabase = [];

  getSavedData() async {
    final data = await DatabaseHelper.instance.getSavedData();
    final data1 = await DatabaseHelper.instance.getSavedCustomerColorData();
    for (var e in data) {
      setState(() {
        savedDataList.add(e);
        databaseColumnId.add(e.id);
      });
    }

    for (var e in data1) {
      setState(() {
        anotherDatabase.add(e.cDForeignKey);
      });
    }

    setState(() {
      searchController.addListener(() {
        _runFilter(searchController.value.text);
      });
    });
    querySavedCustomerColor();
  }

  List<String?> productNameList = [];
  List<String?> colorNameList = [];
  List<double?> canSizeList = [];
  List<double?> rColorList = [];
  List<double?> gColorList = [];
  List<double?> bColorList = [];
  List<int?> databaseForeignKey = [];

  List<Customer> costumerList = [];

  List<CustomerSavedColor> queryData = [];

  querySavedCustomerColor() async {
    // final data = await DatabaseHelper.instance.getSavedData();
    for (var i in savedDataList) {
      List<ColorInfo> colorInfo = [];
      /*  print("This is savedDataList is ${i.id}");*/
      final data = await DatabaseHelper.instance
          .queryCustomerSavedColor(i.id, i.colorName);
      for (var e in data) {
        setState(() {
          productNameList.add(e.productName);
          colorNameList.add(e.colorName);
          canSizeList.add(e.canSize);
          rColorList.add(e.rColor);
          gColorList.add(e.gColor);
          bColorList.add(e.bColor);
          ColorInfo cI = ColorInfo(
              cid: e.cDForeignKey,
              colorName: e.colorName,
              canSize: e.canSize,
              rValue: e.rColor,
              gValue: e.gColor,
              bValue: e.bColor,
              productName: e.productName);
          colorInfo.add(cI);
        });
      }

      Customer cU = Customer(
          id: i.id,
          customerName: i.customerName,
          address: i.address,
          contact: i.contact,
          colorData: colorInfo);
      costumerList.add(cU);
    }
  }

  List<Customer> searchCustomer = [];

  void _runFilter(String enterKeyword) {
    List<Customer> results = [];

    if (enterKeyword.isEmpty) {
      results = costumerList;
    } else {
      results = costumerList
          .where(
            (e) => (e.customerName!.toLowerCase().contains(
                  enterKeyword.toLowerCase(),
                )),
          )
          .toList();
    }
    setState(() {
      searchCustomer = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1,
            statusBarIconBrightness: Brightness.light // For iOS (dark icons)
            ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed("Dealer_button_Navigation_Bar");
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white60,
          iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Save"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.040,
                  vertical: size.height * 0.015),
              child: Form(
                key: _form,
                child: TextFormField(
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
                    hintText: 'Search customer',
                    prefixIcon: const Icon(Icons.search),
                    hintStyle: TextStyle(
                        fontSize: size.height * 0.012 + size.width * 0.012,
                        color: Colors.black26),
                  ),
                  controller: searchController,
                ),
              ),
            ),
          ),
          if (searchController.text.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.040,
                  vertical: size.height * 0.020),
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: searchCustomer.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        if (passedColorName != null ||
                            passedProductName != null) {
                          DatabaseHelper.instance
                              .addSavedCustomerColorData(CustomerSavedColor(
                                  cDForeignKey: searchCustomer[i].id,
                                  colorName: passedColorName,
                                  productName: passedProductName,
                                  canSize: passedCanSize,
                                  fandeckId: passedFandeckId,
                                  rColor: passedRColor,
                                  gColor: passedGColor,
                                  bColor: passedBColor))
                              .whenComplete(() {
                            final SnackBar snackBar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: size.height * 0.045,
                                        width: size.width * 0.2,
                                        child: Image.asset(
                                          "icons/logo 2.png",
                                          fit: BoxFit.fill,
                                        )),
                                    SizedBox(width: size.width * 0.050),
                                    Text(
                                      'Color Saved',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: size.height * 0.012 +
                                              size.width * 0.012),
                                    ),
                                  ],
                                ),
                              ),
                              duration: const Duration(seconds: 1),
                              backgroundColor: Colors.grey.shade700,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            );
                            snackBarKey.currentState?.showSnackBar(snackBar);
                          });
                        } else if (passedColorName == null ||
                            passedProductName == null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => SavedDetailPage(
                                    customerName: costumerList[i].customerName,
                                    customerAddress: costumerList[i].address,
                                    contact: costumerList[i].contact,
                                    id: costumerList[i].id,
                                    colorData: costumerList[i].colorData,
                                  )));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0, color: Colors.lightBlue.shade900),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${searchCustomer[i].customerName}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.height * 0.012 +
                                          size.width * 0.012),
                                ),
                                SizedBox(height: size.height * 0.008),
                                Text("${searchCustomer[i].address}"),
                                SizedBox(height: size.height * 0.008),
                                Text("${searchCustomer[i].contact}"),
                                SizedBox(height: size.height * 0.008),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 0.020),
                              child: SizedBox(
                                height: 50,
                                width: 80,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: searchCustomer.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5),
                                  itemBuilder: (ctx, j) {
                                    return Container(
                                      height: size.height * 0.050,
                                      width: size.width * 0.10,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              searchCustomer[i]
                                                  .colorData![j]
                                                  .rValue!
                                                  .toInt(),
                                              searchCustomer[i]
                                                  .colorData![j]
                                                  .gValue!
                                                  .toInt(),
                                              searchCustomer[i]
                                                  .colorData![j]
                                                  .bValue!
                                                  .toInt(),
                                              1),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 1.0,
                                            )
                                          ]),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          if (searchController.text.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.040,
                  vertical: size.height * 0.020),
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: costumerList.length,
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () async {
                        if (passedColorName != null ||
                            passedProductName != null) {
                          DatabaseHelper.instance
                              .addSavedCustomerColorData(CustomerSavedColor(
                                  cDForeignKey: costumerList[i].id,
                                  colorName: passedColorName,
                                  productName: passedProductName,
                                  canSize: passedCanSize,
                                  fandeckId: passedFandeckId,
                                  rColor: passedRColor,
                                  gColor: passedGColor,
                                  bColor: passedBColor))
                              .whenComplete(() {
                            final SnackBar snackBar = SnackBar(
                              content: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: size.height * 0.045,
                                        width: size.width * 0.2,
                                        child: Image.asset(
                                          "icons/logo 2.png",
                                          fit: BoxFit.fill,
                                        )),
                                    SizedBox(width: size.width * 0.050),
                                    Text(
                                      'Color Saved',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: size.height * 0.012 +
                                              size.width * 0.012),
                                    ),
                                  ],
                                ),
                              ),
                              duration: const Duration(seconds: 1),
                              backgroundColor: Colors.grey.shade700,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            );
                            snackBarKey.currentState?.showSnackBar(snackBar);
                          });
                        } else if (passedColorName == null ||
                            passedProductName == null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => SavedDetailPage(
                                    customerName: costumerList[i].customerName,
                                    customerAddress: costumerList[i].address,
                                    contact: costumerList[i].contact,
                                    id: costumerList[i].id,
                                    colorData: costumerList[i].colorData,
                                  )));
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${costumerList[i].customerName}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.012 +
                                            size.width * 0.012),
                                  ),
                                  SizedBox(height: size.height * 0.008),
                                  Text("${costumerList[i].address}"),
                                  SizedBox(height: size.height * 0.008),
                                  Text("${costumerList[i].contact}"),
                                  SizedBox(height: size.height * 0.008),
                                  Text("${costumerList[i].id}")
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: size.width * 0.020),
                                child: SizedBox(
                                  height: 50,
                                  width: 80,
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        costumerList[i].colorData!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5),
                                    itemBuilder: (ctx, j) {
                                      return Container(
                                        height: size.height * 0.050,
                                        width: size.width * 0.10,
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                costumerList[i]
                                                    .colorData![j]
                                                    .rValue!
                                                    .toInt(),
                                                costumerList[i]
                                                    .colorData![j]
                                                    .gValue!
                                                    .toInt(),
                                                costumerList[i]
                                                    .colorData![j]
                                                    .bValue!
                                                    .toInt(),
                                                1),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 1.0,
                                              )
                                            ]),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
        ],
      ),
      floatingActionButton: passedColorName != null || passedProductName != null
          ? FloatingActionButton(
              onPressed: () {
                AlertBox().addCustomerDialogueBox(
                    passedColorName,
                    passedProductName,
                    passedCanSize,
                    passedRColor,
                    passedGColor,
                    passedBColor,
                    passedFandeckId,
                    context);
              },
              backgroundColor: ChooseColor(0).buttonColor,
              child: const Icon(Icons.add),
            )
          : Container(),
    );
  }
}
