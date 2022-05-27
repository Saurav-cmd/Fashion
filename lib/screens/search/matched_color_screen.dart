import 'package:color_converter/color_converter.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/database/all_data_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var data;

class MatchedColorScreen extends StatefulWidget {
  MatchedColorScreen({Key, this.selectedColor, key}) : super(key: key);
  Color? selectedColor;
  @override
  State<MatchedColorScreen> createState() => _MatchedColorScreenState();
}

class _MatchedColorScreenState extends State<MatchedColorScreen> {
  Color? passedSelectedColor;
  String? removeFirst;
  var data;
  String? rValue;
  String? gValue;
  String? bValue;
  List rgbaList = [];
  List rgbList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedSelectedColor = widget.selectedColor;
    String? formatColor =
        passedSelectedColor.toString().split("(")[1].split(")")[0];
    String? removeFirst = formatColor.replaceFirst("0x", "#");
    print("This is removeFirst $removeFirst");
    hexToRGB(removeFirst);
  }

  hexToRGB(String? color) {
    data = RGB.fromHex(color!);
    rValue = data.toString().split(",")[0].toString();
    gValue = data.toString().split(",")[1].toString();
    bValue = data.toString().split(",")[2].toString();
    grabMatchingColor(rValue, gValue, bValue);
  }

  List<double?> rValueData = [];
  List<double?> gValueData = [];
  List<double?> bValueData = [];

  grabMatchingColor(String? rValue, String? gValue, String? bValue) async {
    final data = await DatabaseHelper.instance.queryShade(
        rValue! + "." + "0", gValue! + "." + "0", bValue! + "." + "0");
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        setState(() {
          rValueData.add(data[i].rValue);
          gValueData.add(data[i].gValue);
          bValueData.add(data[i].bValue);
        });
      }
    } else if (data == null) {
      print("This is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Matched Colors"),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.020, horizontal: size.width * 0.050),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Selected Color",
              style:
                  TextStyle(fontSize: size.height * 0.012 + size.width * 0.012),
            ),
            SizedBox(height: size.height * 0.010),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(color: passedSelectedColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.11, left: size.width * 0.050),
                      child: Text(
                        passedSelectedColor
                            .toString()
                            .split("(")[1]
                            .split(")")[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.15),
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: rValueData.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      rValueData[i]!.toInt(),
                                      gValueData[i]!.toInt(),
                                      bValueData[i]!.toInt(),
                                      1)),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.40),
            Container(
              width: 100,
              child: const Text(
                  "Note: Color picked from the image works on the principle of RGB value and Color Difference formulae, so it may not provide the actual result"),
            )
          ],
        ),
      ),
    );
  }
}
