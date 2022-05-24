import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchedColorScreen extends StatefulWidget {
  MatchedColorScreen({Key, this.selectedColor, key}) : super(key: key);
  Color? selectedColor;
  @override
  State<MatchedColorScreen> createState() => _MatchedColorScreenState();
}

class _MatchedColorScreenState extends State<MatchedColorScreen> {
  Color? passedSelectedColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedSelectedColor = widget.selectedColor;
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
                    passedSelectedColor.toString().split("(")[1].split(")")[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height * 0.40),
            Container(
              width: 100,
              child: Text(
                  "Note: Color picked from the image works on the principle of RGB value and Color Difference formulae, so it may not provide the actual result"),
            )
          ],
        ),
      ),
    );
  }
}
