import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../database/all_data_database.dart';
import '../../models/database_models/shade_color_database_model.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  List<ShadeColorDatabase> databaseDataList = [];
  List<String?> allColorCodeList = [];

  filterDatabaseData() async {
    final databaseData = await DatabaseHelper.instance.getCosmeticIntData();
    for (int i = 0; i < databaseData.length; i++) {
      setState(() {
        allColorCodeList.add(databaseData[i].colorName);
      });
    }
  }

  getData() async {
    final databaseData = await DatabaseHelper.instance.getShadeColorData();
    for (int i = 0; i < databaseData.length; i++) {
      if (databaseData[i].colorName == searchController.text) {
        setState(() {
          databaseDataList.add(databaseData[i]);
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: databaseDataList.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.black),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${databaseDataList[i].colorCode}(${databaseDataList[i].colorName})",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
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
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
