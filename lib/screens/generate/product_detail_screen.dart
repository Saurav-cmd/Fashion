import 'package:fashion_paints/Utils/contants.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/main.dart';
import 'package:fashion_paints/screens/generate/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../models/database_models/cosmetic_int_emulsion_database_model.dart';
import 'generate_color_page.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen(
      {Key, this.productName, this.fanDeckName, this.emulsionOrDistemper, key})
      : super(key: key);
  String? productName;
  String? fanDeckName;
  String? emulsionOrDistemper;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? passedProductName;
  double? fanDeckId;
  String? passedFanDeckName;
  String? passedEmulsionOrDistemper;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController colorController = TextEditingController();

  int clickedItemPosition = 0;

  grabFanDeckId() {
    //yo id maila fandeck_id directory vhitra fandeck_name_id.dart vhitra statically id haru save garaya ra rakhaya ko xu tai tanaya ho
    fanDeckId = Constants.fanDeckNameToId(passedFanDeckName);
    print("This is fan deck id $fanDeckId");
  }

  List<CosmeticInt> databaseDataList = [];
  //fandeck id anusar database ko data filter gardai databaseDataList ma halaya ko ho
  filterDatabaseData() async {
    final databaseData = await DatabaseHelper.instance.getCosmeticIntData();
    for (int i = 0; i < databaseData.length; i++) {
      // print("This is fandeck from database ${databaseData[i].cosmeticId}");
      if (databaseData[i].fandeck == fanDeckId) {
        databaseDataList.add(databaseData[i]);
      }
    }
    allColorCode();
  }

  List<String?> allColorCodeList = [];
  //aaba databaseDataList ma sab data save xa but hami lai color name or code matra chaya ko ho tai vhaya ra filtre gardai allColorCodeList ma halaya ko
  allColorCode() {
    for (int i = 0; i < databaseDataList.length; i++) {
      if (databaseDataList[i].colorCode == databaseDataList[i].colorName) {
        allColorCodeList.add(databaseDataList[i].colorName);
      } else {
        allColorCodeList.add(databaseDataList[i].colorName! +
            "(" +
            databaseDataList[i].colorCode! +
            ")");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedProductName = widget.productName;
    passedFanDeckName = widget.fanDeckName;
    passedEmulsionOrDistemper = widget.emulsionOrDistemper;
    grabFanDeckId();
    filterDatabaseData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    colorController;
  }

  String? selectedContainer;
  double? selectedCanSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1,
            statusBarIconBrightness: Brightness.light // For iOS (dark icons)
            ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) =>
                    ProductScreen(fanDeckName: passedFanDeckName)));
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white60,
          iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Colour Selection"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.030, vertical: size.height * 0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Select colour and can size"),
              SizedBox(height: size.height * 0.020),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.010),
                      Text(
                        "Fandeck",
                        style: TextStyle(
                            fontSize: size.height * 0.010 + size.width * 0.010),
                      ),
                      SizedBox(height: size.height * 0.005),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 210,
                              child: Text(
                                '$passedFanDeckName',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: size.height * 0.012 +
                                        size.width * 0.012,
                                    fontWeight: FontWeight.w500),
                              )),
                          const Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'icons/generate (1).png',
                            ),
                            height: 50,
                            width: 50,
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.005),
                      Text(
                        "Product",
                        style: TextStyle(
                            fontSize: size.height * 0.010 + size.width * 0.010),
                      ),
                      SizedBox(height: size.height * 0.010),
                      Text(
                        '$passedProductName',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.011 + size.width * 0.011,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.020),
              Text(
                "Colour Code/Name",
                style: TextStyle(
                    fontSize: size.height * 0.010 + size.width * 0.010,
                    color: ChooseColor(0).appBarColor1,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.010),
              Form(
                  key: _form,
                  child: TypeAheadFormField(
                    suggestionsCallback: (pattern) => allColorCodeList.where(
                        (items) => items!
                            .toLowerCase()
                            .contains(pattern.toLowerCase().toString())),
                    itemBuilder: (_, String? item) => ListTile(
                      title: Text(item!),
                    ),
                    onSuggestionSelected: (String? val) {
                      colorController.text = val!;
                    },
                    getImmediateSuggestions: true,
                    hideOnEmpty: true,
                    hideSuggestionsOnKeyboardHide: false,
                    noItemsFoundBuilder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("No Color Found"),
                    ),
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: colorController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Colour Code/Name',
                        hintStyle: TextStyle(
                            fontSize: size.height * 0.012 + size.width * 0.012,
                            color: Colors.black26),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: size.height * 0.001,
                            horizontal: size.width * 0.030),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Choose a color";
                      }
                    },
                  )),
              SizedBox(height: size.height * 0.020),
              Text(
                "Can Size:",
                style: TextStyle(
                    fontSize: size.height * 0.010 + size.width * 0.010,
                    color: ChooseColor(0).appBarColor1,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.010),
              if (passedProductName == "cosmeticintemulsion" ||
                  passedProductName == "magnetextemulsion" ||
                  passedProductName == "weatherproofextemulsion")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = "first";
                          selectedCanSize = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedContainer == "first"
                                ? ChooseColor(0).appBarColor1
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.030),
                          child: const Text(
                            "1 Ltr.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = "second";
                          selectedCanSize = 4;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedContainer == "second"
                                ? ChooseColor(0).appBarColor1
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.030),
                          child: const Text(
                            "4 Ltr",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = "third";
                          selectedCanSize = 10;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedContainer == "third"
                                ? ChooseColor(0).appBarColor1
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.030),
                          child: const Text(
                            "10 Ltr",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = "fourth";
                          selectedCanSize = 20;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedContainer == "fourth"
                                ? ChooseColor(0).appBarColor1
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.030),
                          child: const Text(
                            "20 Ltr.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              if (passedProductName == "smartdist" ||
                  passedProductName == "styledist")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = "first";
                          selectedCanSize = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedContainer == "first"
                                ? ChooseColor(0).appBarColor1
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.030),
                          child: const Text(
                            "1 Kg",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = "second";
                          selectedCanSize = 5;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedContainer == "second"
                                ? ChooseColor(0).appBarColor1
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.030),
                          child: const Text(
                            "5 Kg",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = "third";
                          selectedCanSize = 10;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedContainer == "third"
                                ? ChooseColor(0).appBarColor1
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.030),
                          child: const Text(
                            "10 Kg",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = "fourth";
                          selectedCanSize = 20;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectedContainer == "fourth"
                                ? ChooseColor(0).appBarColor1
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.030),
                          child: const Text(
                            "20 Kg",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              SizedBox(height: size.height * 0.020),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: double.infinity, height: size.height * 0.055),
                child: ElevatedButton(
                  child: Text(
                    'Generate',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: size.height * 0.014 + size.width * 0.014),
                  ),
                  onPressed: () async {
                    if (_form.currentState?.validate() == true) {
                      if (selectedCanSize == null) {
                        final SnackBar snackBar = SnackBar(
                          content: const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              'Please select a can size',
                              maxLines: 2,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.grey.shade700,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        );
                        snackBarKey.currentState?.showSnackBar(snackBar);
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => GenerateColorScreen(
                                  fanDeckName: passedFanDeckName,
                                  productName: passedProductName,
                                  colorName: colorController.text,
                                  canSize: selectedCanSize,
                                  navId: 1,
                                )));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ChooseColor(0).buttonColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
