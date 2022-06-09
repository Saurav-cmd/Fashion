import 'dart:convert';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/models/database_models/style_dist_model.dart';
import 'package:fashion_paints/models/database_models/weather_proof_extemulsion_model.dart';
import 'package:fashion_paints/models/searched_data_holder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/all_data_database.dart';
import '../../models/database_models/shade_color_database_model.dart';
import '../../models/database_models/smart_dist_model.dart';
import '../generate/generate_color_page.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  String? token;
  List<ShadeColorDatabase> databaseDataList = [];
  List<String?> allColorCodeList = [];

  filterDatabaseData() async {
    print("ya vhitra aayo");
    final databaseData = await DatabaseHelper.instance.getShadeColorData();
    for (int i = 0; i < databaseData.length; i++) {
      print("${databaseData[i].colorName}");
      setState(() {
        allColorCodeList.add(databaseData[i].colorName);
      });
    }
  }

  List<WeatherProofExtemusion?> weatherDataList = [];
  List<StyleDist> styleList = [];
  List<SmartDist> smartList = [];
  List<SearchedDataHolder> searchedDataList = [];
  getData() async {
    final databaseData = await DatabaseHelper.instance.getShadeColorData();
    final weatherProofData =
        await DatabaseHelper.instance.queryWeatherProof(searchController.text);
    final styleDistemperData = await DatabaseHelper.instance
        .queryStyleDistemper(searchController.text);
    final smartDistemperData = await DatabaseHelper.instance
        .querySmartDistemper(searchController.text);
    /* final cosmeticInteriorData = await DatabaseHelper.instance
        .queryCosmeticInterior(searchController.text);*/
    for (int i = 0; i < databaseData.length; i++) {
      if (databaseData[i].colorName == searchController.text) {
        setState(() {
          databaseDataList.add(databaseData[i]);
        });
      }
    }

    for (int i = 0; i < weatherProofData!.length; i++) {
      setState(() {
        weatherDataList.clear();
        weatherDataList.add(weatherProofData[i]);
        for (int i = 0; i < weatherDataList.length; i++) {
          SearchedDataHolder sH = SearchedDataHolder(
              weatherDataList[i]!.colorName,
              weatherDataList[i]!.colorCode,
              weatherDataList[i]!.fandeck.toString(),
              "",
              null,
              null,
              null);
          searchedDataList.add(sH);
        }
      });
    }

    for (int i = 0; i < styleDistemperData!.length; i++) {
      setState(() {
        styleList.clear();
        styleList.add(styleDistemperData[i]);
        for (int i = 0; i < styleList.length; i++) {
          SearchedDataHolder sH = SearchedDataHolder(
              styleList[i].colorName,
              styleList[i].colorCode,
              styleList[i].fandeck.toString(),
              "",
              null,
              null,
              null);
          searchedDataList.add(sH);
        }
      });
    }

    for (int i = 0; i < smartDistemperData!.length; i++) {
      setState(() {
        smartList.clear();
        smartList.add(smartDistemperData[i]);
        for (int i = 0; i < smartList.length; i++) {
          SearchedDataHolder sH = SearchedDataHolder(
              smartList[i].colorName,
              smartList[i].colorCode,
              smartList[i].fandeck.toString(),
              "",
              null,
              null,
              null);
          searchedDataList.add(sH);
        }
      });
    }
  }

  getSharedPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      setState(() {
        token = jsonDecode(userData)['token'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPreferenceData();
    filterDatabaseData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("Search_Screen");
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white60,
          iconSize: 20,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ChooseColor(0).appBarColor1,
        ),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Search code"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed("Dealer_button_Navigation_Bar");
              },
              icon: const Icon(Icons.home)),
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
                  child: TypeAheadFormField(
                    suggestionsCallback: (pattern) => allColorCodeList.where(
                        (items) => items!
                            .toLowerCase()
                            .contains(pattern.toLowerCase().toString())),
                    itemBuilder: (_, String? item) => ListTile(
                      title: Text(item!),
                    ),
                    onSuggestionSelected: (String? val) {
                      setState(() {
                        searchController.text = val!;
                        searchedDataList.clear();
                        getData();
                      });
                    },
                    getImmediateSuggestions: true,
                    hideOnEmpty: true,
                    hideSuggestionsOnKeyboardHide: false,
                    noItemsFoundBuilder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("No Color Found"),
                    ),
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: searchController,
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
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.020),
            child: SizedBox(
              height: 500,
              child: searchController.text.isNotEmpty
                  ? ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: searchedDataList.length,
                      itemBuilder: (ctx, i) {
                        return GestureDetector(
                          onTap: () {
                            if (token != null) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => GenerateColorScreen(
                                        canSize: 1,
                                        fanDeckName: searchedDataList[i]
                                                    .fandeck ==
                                                "1.0"
                                            ? "Fashion Paints Ambiance Plus CS"
                                            : searchedDataList[i].fandeck ==
                                                    "2.0"
                                                ? "Spirit 1050 Fandeck"
                                                : searchedDataList[i].fandeck ==
                                                        "3.0"
                                                    ? "Color Symphony Fandeck"
                                                    : searchedDataList[i]
                                                                .fandeck ==
                                                            "4.0"
                                                        ? "Color Cosmos Fandeck"
                                                        : searchedDataList[i]
                                                                    .fandeck ==
                                                                "5.0"
                                                            ? "BP-2300"
                                                            : searchedDataList[
                                                                            i]
                                                                        .fandeck ==
                                                                    "6.0"
                                                                ? "AP-CP"
                                                                : "",
                                        colorName:
                                            databaseDataList[i].colorName! +
                                                "(" +
                                                databaseDataList[i].colorCode! +
                                                ")",
                                      )));
                            }
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${databaseDataList[i].colorCode}(${databaseDataList[i].colorName})",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    if (searchedDataList[i].fandeck == "1.0")
                                      const Text(
                                        "Fashion Paints Ambiance Plus CS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    if (searchedDataList[i].fandeck == "2.0")
                                      const Text(
                                        "Spirit 1050 Fandeck",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    if (searchedDataList[i].fandeck == "3.0")
                                      const Text(
                                        "Color Symphony Fandeck",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    if (searchedDataList[i].fandeck == "4.0")
                                      const Text(
                                        "Color Cosmos Fandeck",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    if (searchedDataList[i].fandeck == "5.0")
                                      const Text(
                                        "BP-2300",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    if (searchedDataList[i].fandeck == "6.0")
                                      const Text(
                                        "AP-CP",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 10),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(
                                          databaseDataList[i].rValue!.toInt(),
                                          databaseDataList[i].gValue!.toInt(),
                                          databaseDataList[i].bValue!.toInt(),
                                          1),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                  : Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Type color name or color code to search",
                              style: TextStyle(
                                  color: ChooseColor(0).appBarColor1,
                                  fontSize:
                                      size.height * 0.014 + size.width * 0.014,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
