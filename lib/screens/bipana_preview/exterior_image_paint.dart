import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_drawing/path_drawing.dart';

import '../../database/all_data_database.dart';
import '../../models/database_models/shade_color_database_model.dart';

double? rPassedChooseColor;
double? gPassedChooseColor;
double? bPassedChooseColor;
Color? colorValue;
List<Color?> recentColorList = [];
List<ShadeColorDatabase> allColorsData = [];

TextEditingController searchController = TextEditingController();

class ExteriorImagePaint extends StatefulWidget {
  ExteriorImagePaint({Key, key}) : super(key: key);

  @override
  State<ExteriorImagePaint> createState() => _ExteriorImagePaintState();
}

class _ExteriorImagePaintState extends State<ExteriorImagePaint> {
  List<ShadeColorDatabase> searchColor = [];
  var shadeData;
  getAllShadeColor() async {
    shadeData = await DatabaseHelper.instance.getShadeColorData();
    setState(() {
      allData();
    });
  }

  allData() async {
    for (int i = 0; i < shadeData.length; i++) {
      allColorsData.add(shadeData[i]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllShadeColor();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ValueNotifier(Offset.zero);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ChooseColor(0).bodyBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ChooseColor(0).appBarColor1,
          title: const Text("Visualize Color"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.010, vertical: size.height * 0.020),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.010),
                  child: Text(
                    "Select on image and tap on color to paint it",
                    style: TextStyle(color: ChooseColor(0).appBarColor1),
                  ),
                ),
                SizedBox(height: size.height * 0.020),
                Listener(
                  onPointerDown: (e) => notifier.value = e.localPosition,
                  onPointerMove: (e) => notifier.value = e.localPosition,
                  child: Stack(
                    children: [
                      Container(
                        height: 410,
                        color: Colors.transparent,
                        child: Image.asset(
                          "images/1.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        width: 340,
                        child: CustomPaint(
                          isComplex: true,
                          painter: HouseFillerPainter1(notifier),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.020),
                const ShowShadeColors(),
              ],
            ),
          ),
        ));
  }

  Offset toLocal(BuildContext context, Offset position) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    return renderBox.globalToLocal(position);
  }
}

class ShowShadeColors extends StatefulWidget {
  const ShowShadeColors({Key? key}) : super(key: key);

  @override
  State<ShowShadeColors> createState() => _ShowShadeColorsState();
}

class _ShowShadeColorsState extends State<ShowShadeColors> {
  Widget setupShadeColorContainer(BuildContext context) {
    return SizedBox(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: allColorsData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  rPassedChooseColor = allColorsData[i].rValue;
                  gPassedChooseColor = allColorsData[i].gValue;
                  bPassedChooseColor = allColorsData[i].bValue;
                  recentColorList.add(colorValue);
                  colorValue = Color.fromRGBO(
                      rPassedChooseColor!.toInt(),
                      gPassedChooseColor!.toInt(),
                      bPassedChooseColor!.toInt(),
                      1);
                  Navigator.pop(context, [
                    rPassedChooseColor,
                    gPassedChooseColor,
                    bPassedChooseColor,
                    colorValue,
                    recentColorList
                  ]);
                });
              },
              child: Stack(
                children: [
                  Container(
                    color: Color.fromRGBO(
                        allColorsData[i].rValue!.toInt(),
                        allColorsData[i].gValue!.toInt(),
                        allColorsData[i].bValue!.toInt(),
                        1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45, left: 5),
                    child: Text("${allColorsData[i].colorCode}"),
                  )
                ],
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recentColorList.clear();
    colorValue = Colors.transparent;
  }

  showAllColors(BuildContext context) async {
    final GlobalKey<FormState> _form = GlobalKey<FormState>();
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (ctx) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fashion's Color",
                          style: TextStyle(
                              color: ChooseColor(0).appBarColor1, fontSize: 14),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.clear))
                      ],
                    ),
                  ],
                ),
              ),
              content: setupShadeColorContainer(context),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.010, horizontal: size.width * 0.015),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shade",
                      style: TextStyle(color: ChooseColor(0).appBarColor1),
                    ),
                    Text(
                      "Original",
                      style: TextStyle(color: ChooseColor(0).appBarColor1),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.010),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showAllColors(context);
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 40,
                            width: 50,
                            decoration: BoxDecoration(
                              color: colorValue ?? Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text("N/A"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("images/1.png"),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.010),
              ],
            ),
          ),
        ),
        if (recentColorList.isNotEmpty)
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
              ),
            ),
            child: GridView.builder(
                itemCount: recentColorList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10, crossAxisSpacing: 5),
                itemBuilder: (ctx, i) {
                  return Container(
                    color: recentColorList[i],
                  );
                }),
          ),
      ],
    );
  }
}

class Shape {
  Shape(strPath, this.label, this.defaultColor, this.isSelected,
      this.selectedColor, this.tappedColor)
      : _path = parseSvgPathData(strPath);

  /// transforms a [_path] into [_transformedPath] using given [matrix]
  void transform(Matrix4 matrix) =>
      _transformedPath = _path.transform(matrix.storage);
  Path _path;
  Path? _transformedPath;
  String? label;
  final Color? defaultColor;
  bool? isSelected;
  Color? selectedColor;
  Color? tappedColor;
}

class HouseFillerPainter1 extends CustomPainter {
  HouseFillerPainter1(this._notifier) : super(repaint: _notifier);
  static final _data =
      '''m829.35 691.34.96 21.77h-33.58l-1.01-23z,m829.35 691.34-33.63-1.23 4.15-2.05 34.26 1.03 1.37 22.38-5.19 1.64z,
m818.5 506v7l-20.53.49 16.34-1.82s-.41-8.7 0-8.29 4.19 2.62 4.19 2.62z,m810.96 497.49-39.34-25.66v-2.25l47.98 31.72.13 1.92-5.82-3.81-1.55 7.79z,
m810.53 462.36.91 16.29-4.37-2.75-.58-12.26z,m810.01 500.25v9.52l-22.5 1.84-.7-10.22z,m810.01 500.25-23.2 1.14-1.13-16.46z,m802.04 311.49 6.31 8.56-32.84 5.78-.45-9.98.13-.01z,
m802.04 311.49-26.85 4.35-.13.01-.23-4.92.19-.01 24.48-2.86z,m773.08 272.22 26.42 35.84-24.48 2.86-.19.01z,m808.35 305.61-20.19-25.76 3.12-2.45 4.22 4.83 2.94 3.38.67-17.55 9.24 12.03z,
m797.97 513.53-10.25 1.14-.21-3.06 22.5-1.84 4.3 1.94z,m794.83 618.53 5.04 69.53-4.15 2.05 1.01 23-33.63 7.33-.76-3.5-4.84-93.36h12.08v-4.66l21.01-.39z,m793.76 604.32.09-.01.13 1.87h-.07l-52.27-11.84-.12-2.63z,
m781.65 240.57 10.85 17.74-1.22 19.09-3.12 2.45-24.39-31.14 4.73-3.7 6.58 7.82 6.57 7.81z,
m787.72 514.67 6.13 89.64-.09.01-52.24-12.61-1.01-20.67 45.34 12.26-.17-3.12-5.7-99.18 5.7 3.93 1.13 16.46.7 10.22z,m810 500.25-24.33-15.32-5.67-3.93-1.84-1.26-6.52-4.49v-3.41l39.36 25.65 1.4 9.71 1.55-7.79 5.82 3.81.62 10.23-1.89-.45v-7s-3.78-2.16-4.19-2.56 0 8.29 0 8.29l-4.3-1.94z,
m775.51 325.83 7.17 134.73-3.79-2.39-1.94-26.81-1.44-.06-7.01-165.28 4.58 6.2 1.75 38.71.23 4.92z,m772.86 481.65v11.88l-25.52 1.36v-11.88z,m771.62 471.83v3.41l-35.21 3.41-1.84-44.62 8.12-.72 26.48-2.31 6.34.3 1.44.06 1.94 26.81 3.79 2.39 24.39 15.34 4.37 2.75-.91-16.29 6.74 3.8 2.33 35.14-47.98-31.72z,
m769 617.09-2.46.35h-2s-.75-.14-.83-.35-.6-7.84-.6-7.84l26.47-2 1 11.32-21 .39z,m767.12 218.26 1.38 26.75-4.73 3.7-3.98-5.08-1.26-1.62-.01-.01.18-35.16z,m761.08 248.25 47.26 59.8v12l-6.3-8.56-2.54-3.44-26.43-35.83-4.57-6.22-5.68-7.71-1.16-1.29s-.41-6-.47-8.12a2.39 2.39 0 0 0 -.11-.63z,
m763.17 609.25a3.07 3.07 0 0 0 -1.78-.47 10.38 10.38 0 0 1 -3.48 0 19.2 19.2 0 0 0 -4-.65h-4.38l-2.17-.7v-9.48l42.3 9.29z,m761.25 272.56.19 3.78-25.23 2.46-3.01-2.81z,m760.77 262.97.48 9.59-28.05 3.43v-13.02z,m762.82 258.31 5.68 7.71 7.01 165.28-6.34-.3-7.73-154.66-.19-3.78-.48-9.59v-1.52l-4.15-3.14z,
m758.7 206.84-.18 35.16-15.01 1.37-20.52-27.81z,m760.77 262.97h-27.57l-66.66-83.09-.53-31.17 76.41 102.03 13.64-2.18.56 9.75 4.15 3.14z,m750.67 513.18-10.16-5.25-.96-3.28 11.12 5.52z,m742.42 610.21-.78-15.87 52.27 11.84h.07l.85 12.35h-4.24l-.95-11.32-42.3-9.3v9.49 4.17z,m747.34 483.01-10.93-4.36 35.21-3.41 6.52 4.49-.65 1.26-4.63.66z,
m756.06 248.56-13.64 2.18-76.42-102.03-.2-4.71 77.2 102.65 15.52-1.65 2.56 3.24a2.39 2.39 0 0 1 .11.65c.06 2.11.47 8.12.47 8.12l1.16 1.29h-6.2z,m743.37 394.14-.2 2.39-9.28-6.31-1.22-4.92z,m726 610-23.61-.28.75-11.82 5.49-2.26 10.37 1.61 1.18-2.92-1.32-3.5s-9.14-11.06-15.42-11.87l-3.07 3.42-.43-10 2.54-.11 38.03-1.27 1 20.67.12 2.63.78 15.87z,
m740.51 571.04-38.08 1.23v-3.69l38.22-1.36 2.07.59 9.16 2.64 33.8 9.73.17 3.12z,m733.68 502.87-1.49 2.25-21.84-9.69-1.22-4.71z,m727.07 439.55 2.31 6.69-27.09-18.36 3.35-2.32z,
m726.18 437.09-1.84-52.6 1.59-3.71-22.16-20.78 1.33 7.88 1 55.68zm7.82 127.61-2-58.07-20.47-9.15 1.09 60.86zm-1.76-59.58 1.49-2.25-24.55-12.15 1.22 4.71zm1.7-114.9 9.28 6.31.2-2.39-10.7-8.84zm6.62 117.7 10.16 5.26v-3l-11.12-5.52zm-34.87-82.36-3.35 2.32 27.09 18.36-2.31-6.69zm-32.46-209.48.55 20.33-6.38-7.11-.86-49.42 66.66 83.12v13l3 2.81 25.23-2.46 7.74 154.65-26.48 2.31v-34.43l-8.18-6.35.06 41.5 1.84 44.62 10.93 4.35v11.88l25.51-1.36v-11.87l4.64-.66.65-1.26 1.86 1.27 5.7 99.18-33.8-9.73-1.75-54-9.62-5.73 2.21 57.12-2.07-.59-38.22 1.36v3.69l-2.54.11-13.73-319v-19.59c.24-6-3.11-21.29-6.6-22.38s-6.35 4.64-6.35 4.64zm54.77 119.41-2.87-7.78-1.63-53.46 1.86-1.27-22.36-27.98 1.09 7.37 2.19 57.05-3.09 1.14z,
m725.93 380.78-1.59 3.71-19.24-16.59-1.33-7.88z,m702.99 245.01 22.33 27.97-1.86 1.27-19.39-21.87z,m720.13 594.33-1.18 2.92-10.36-1.6-26.83-4.11-1.85-.39 1.93-9.03 18.66 4.39 18.32 4.32z,m718.81 590.83-18.32-4.32-.17-4.13 3.07-3.42c6.28.81 15.42 11.87 15.42 11.87z,
m708.59 595.65-5.49 2.26-21.44-3.62.1-2.75z,m705.73 732.95.94 7.99-14.26 3.62-26.62-1.84v-15.15l9.22-1.63 30.01 1.08z,m703.17 310.57 3.09-1.14 18.83 18.28 2.87 7.78z,m702.35 613.17-14.79-.78 1.77 30.43h13.1zm0-3.43 23.65.26 4.72 112 31.66-5.11.76 3.5-57.41 12.61-.73-6-30-1.09-9.22 1.63v15.15l-6.78 1.87v-6.76l-4.9-118.88h.39a7.15 7.15 0 0 0 1.57-2.54c.14-.95 0-4.63 0-4.63l-23.06-1.48 2.53 7.85 4.84 122.55-24.29 6.55-5.46-140.56h8.73v-10.92l55.48 3.79 6.65.81.21-6.05 21.44 3.63z,
m681.34 265.16-126.34-134.77-290.42 82.55v3.06l-18.23 327.54h4.3l308.69-21.6s132.45 38.06 132.45 37.46l1.51.42zm4.82-11.79 13.73 319 .43 10-141-34.4-336.82 19.1 17.92-366 314.25-91.85z,m684.9 395.56.79 18.02-128.19-84.98-297.86 52.07 1.24-21.66 296.42-53.34z,m669.47 261.05 10.03 10.03-8.46.82-1.66 2.35z,m674.07 424.3.07-10.03 11.05 7.11v.01l-7.73.76-1.23 2.15z,m673.57 583.26 1.23 16.27-55.48-3.79v-9.23z,m599.29 584.35-.44 4.02-.82-21.5 75.54 16.39-54.25 3.25z,m669.38 274.25-24.65 10.11-8.23-5.81v-.01z,
m669.38 274.25-32.88 4.29-6.53.86-8.46-4.5 41.11-7z,m667.54 424.65 6.49 4.76-37.31 1.59-12.28-3.12z,m667.4 229.3-1.39-1.55-.98-49.78 1.51 1.91z,m666.01 148.71.53 31.17-1.51-1.91-.62-31.41z,m665.03 177.97.98 49.78-6-6.68-1.58-51.32z,m665.8 143.96.21 4.75-1.6-2.15-.1-4.58z,m664.41 146.56.62 31.41-6.6-8.22-1-32.51z,m664.31 141.98.1 4.58-6.98-9.32-.15-4.62z,m661.9 253.37.72 14.53-41.11 7v-13.24z,m589.54 178.35 72.36 75.02-40.39 8.29-68.78-59.51 37.22-7.32z,m742.96 246.65-77.16-102.69-1.49-1.98-7.03-9.36-1.58-2.1-98.06-130.52h6.27l159.08 215.56 20.52 27.81 15.01-1.37.01.01 1.26 1.62 3.98 5.08 24.39 31.14 20.19 25.76v2.45l-47.27-59.81-2.56-3.24z,
m658.43 169.75 1.58 51.32-1.97-2.2-1.43-51.39z,m657.43 137.24 1 32.51-1.82-2.27-.91-32.53z,m657.28 132.62.15 4.62-1.73-2.29v-4.43z,m656.1 611.78s.14 3.68 0 4.63a7.15 7.15 0 0 1 -1.57 2.54h-.39l-18.64-.8-2.5-7.88z,m654.53 133.38-101.26-133.38h4.37l98.06 130.52v4.43z,m655.7 134.95.91 32.53-22.17-27.64 20.09-6.46z,m553.27 0 101.26 133.38-20.09 6.46-103.76-129.36-230.03 79.07.43-9.94-1.78-2.19-5.19-3.54 210.99-73.88z,m646.25 462.22-2.11 2.36-15.35-7.12-1.59-5.02h2.25z,
m641.64 305.77-.82 3.9h-1.86l-15.03-12.9-1.43-5.33h2.56z,m640.81 309.67.83-3.9-16.58-14.33h-2.57l1.44 5.33 15 12.9zm-110.53-111.67 1.09.72 8.94 5.88 12.42-2.45 68.78 59.51v13.24l8.46 4.5 6.53-.86 8.23 5.81 24.65-10.11 1.62-2.34 8.46-.82 5.2 119.81-46.76-32.72-.81-46.46-12.69-11.26.82 48.86-24.22-16.94v-49l3.86-4.56-43.51-40.58h-3.17l3.93 11.3v55.64l-4.24-3-89.62 15.73.67-78.82 2.67-5.7v-3.59l-95.91 21.91v2.36l6.38 5.31v73.67l-121 21.25 7.71-134.63 6 3.69v8.53l12.83 11.46 210.71-55 .27-.3 15.84 14.22z,
m635.15 162.85v3.14l-.71 4.92-12.39-13.52-2.32-10.77z,m658 218.87-59.39-66.15v-23.56l3.27-2.81-44.24-53.63 2.94 10.64.39 27.4-4.62-5.15-86.6 25.2v-1.32l-.47-60.73 4.29-11.53-99.03 34.77 9.72 4.48-.87 59.47-86.66 25.21 3.92-91.6 230-79.07 103.79 129.36 22.17 27.63zm-27.53-35.41c.15-.4 0-11.05 0-11.05l-9-9.42.55 13s8.35 7.88 8.49 7.47zm-8.45-26.07 12.38 13.52.71-4.92v-3.14l-15.42-16.24z,
m624.44 414.37 42.45-4.2.65 14.48-43.1 3.23z,m609.24 446-4.45 3.58-39.27-16.8-.44-.19-3.9-11.46z,m644.14 464.58 2.11-2.36-16.8-9.78h-2.25l1.59 5zm-13.14 71.81-70.91-20.69-89.93 6.35-6.62-7.38.61-89.65 7.92-10.65-106.17 12.55 9.11 9.66-1.95 85.47-4.4 7.16-118 8.32 8.61-150.18 11 4.91 9 9.19 207-32 2.76-.41 26.76 15 17-2.84 18.21 4.27 15.58-2.07 57.9 31v13.51l12.24 3.09 37.28-1.59v-5.11h2.16l1.23-2.15 7.73-.76.83-.09 5.77 132.82-47.08-13.74-1.33-72.88-13.93-6.59zm-64.23-20.39 40.06 12-2-78.4 4.45-3.58-48.06-24.87 3.9 11.46.45.19z,
m604.9 278.8-3.86 4.56-38.89-33.84-3.93-11.3h3.17z,m557.64 72.72 44.28 53.63-3.27 2.81-38.07-45.8z,m598.03 566.87.82 21.5h-4.09l-5.63-1.33-1.74-2.56v-19.45l3.26-.77 3.02 12.63 2.98-10.42z,m597.84 562.33 77.79 18.32 3.36 14.78.92-4.28 1.85.39-.1 2.75-.21 6.05-6.65-.81-1.23-16.27-75.54-16.39-1.38-.4z,m593.48 379.83-26.94 3.57h-.01l-15.58 2.07-18.21-4.23 51.52-6.94z,
m593.48 379.83-.05-17.15 73.46 47.49-42.45 4.2-57.9-30.97z,m669.79 255.92 9.77 10.26-.06 4.9-10.03-10.03-.09 13.2-6.76-6.35-.72-14.53-72.36-75.02-1.21-.29 1.5-6.15 74.42 78.19 2.16 16.36z,m591.08 776.9v19.24l-449.34-40.14.41-15.77 9.52-139.65 11.36.45-.11-17.94 54.56-3.09-.81 15.56 14.74-.42 38.48 1.43v-17.41l214.83-11.16.32 16.47 28.24 3.89 21.09-1.84 2.46 185.87zm-120.37-58.34-7.51-11.18.45-97.11 6.1-10.71-108.63 2.05 8.46 9.69-.92 92.83-10.75 10.34zm-224.36-102.15 5.52-9.2-83.87 2.65 4.71 8.39-4.71 79.85-8.19 9.2 89.19 3.7-8.19-10.24z,
m589.95 194.83-37.22 7.32-12.42 2.45-8.93-5.88 49.87-11.27 7.26 7.06z,m589.13 587.04-47.06.71-7.7-1.22 53.02-2.05z,m587.39 565.03v19.45l-53.02 2.05v-18.52z,m587.39 565.03-53.02 2.98-28.66-6.66 54.25-1.84z,m674.14 414.27-.07 10.03-.04 5.11-6.49-4.76-.65-14.48-73.46-47.49.05 17.15-9.22-5.53-.19-18.12 2.36-.39 2.46 14.63 3.46-14.53 76.19 50.09 2.5 17.67 1.69-14.93 12.96 8.52-.5 4.14z,
m584.07 356.18.19 18.12-51.52 6.94-.22-16z,m584.07 356.18-51.55 9.06-28.03-17.55 53.17-9.12z,m581.04 169.13.21 18.32-49.87 11.27-1.1-.72 1.36-14.54z,m554.12 140.58 26.92 28.55-49.4 14.33-26.96-28.56z,m562.15 305.16 38.89 27.2v.01l24.22 16.94 12.68 8.86 46.76 32.72.2 4.67-127.6-89.89-296.42 53.34.27-4.69 120.95-21.25 86.2-15.14 89.61-15.73z,m545.83 762.68v6.37l-9 3.35-2.46-185.87 7.7 1.22z,m534.37 568.01v18.52l-28.66-2.87v-22.31z,m534.37 586.53-21.09 1.84-28.24-3.89 20.67-.82z,m532.74 381.24-17 2.84-26.76-15 6.63-.97 9.44-1.38z,m504.68 154.9 26.96 28.56-1.36 14.54-26.92-24.47z,m530.28 198-15.76 4.3-15.84-14.22-10.35-9.29 15.03-5.26z,m559.96 559.51-54.25 1.84-2.89-1.34 1.61-3.47 55.67-3.1 29.63 6.98.92 3.84-3.26.77z,
m505.1 0-210.99 73.88v-2.32l200.89-71.56z,m504.49 347.69 28.03 17.55.22 16-27.69-14.51z,m505.05 366.73-9.44 1.38-.75-5.16 7.1-16.36 2.53 1.1z,m554.12 140.58-49.44 14.32-1.32 18.63-15.03 5.26h-.01l-2.67.94-.51-19.81 2.41-1.44 6.7 11.16 8.1-20.08 52.28-14.61 28.91 30.36 2.93 20.4 1.86-7.65 1.21.29.41 16.48-1.44-.32-7.26-7.06-.21-18.32z,m557.66 338.57-53.17 9.12-2.53-1.1 1.93-4.43 53.75-9.09 28.07 18.46.72 4.26-2.36.39z,m498.68 188.08-.27.3-210.71 54.99-12.83-11.46v-8.53l-6.01-3.69 216.28-59.77.51 19.81 2.67-.94h.01z,
m487.27 562.07 7.59 15.05 7.96-17.11 2.89 1.34v22.31l-20.67.82-.32-16.47-.09-4.61z,m495.61 368.11-6.63.97-2.76.41-.16-18.28 1.98-1.05 6.82 12.79z,m486.06 351.21.16 18.28-207 31.95-8.98-9.18-10.98-4.91z,m485.44 345.28 2.6 4.88-1.98 1.05-226.8 36.14.22-3.86z,m482.58 0-299.96 107.17 2.18-25.38 222.44-81.79z,m473.57 57.23-4.29 11.53-85.02 27.71-9.72-4.48z,
m472.07 414.37-7.92 10.65-89.14 11.56-9.11-9.66z,m471.63 229.82v3.59l-2.67 5.69-86.86 20.3-6.38-5.31v-2.36z,m463.2 707.38 7.51 11.18-112.8-4.09 10.75-10.34z,m463.55 514.67 6.61 7.38-101.5 7.16 4.4-7.16z,m469.75 599.56-6.1 10.71-94.07 1.03-8.45-9.69z,m299.3 77.42 1.78 2.19-.43 9.94-3.92 91.6-7.96 2.31 5.34-109.58z,
m291.44 72.52 2.67-.96v2.32l-5.34 109.58-2.91.85z,m291.44 72.52-5.58 111.79-25.22 7.34 4.97-109.93v-.01z,m485.09 154.38 2.46 4.1-2.41 1.44-216.28 59.77v-4.91z,m269.89 579.15v17.4l-38.48-1.43-.21-18z,m269.89 579.15-38.69-2.03 253.43-13.72.09 4.61z,m679.56 266.18-9.77-10.26-3.38 10.55-2.16-16.37-74.42-78.19-1.5 6.15-1.86 7.65-2.93-20.4-28.91-30.31-52.28 14.6-8.1 20.09-6.7-11.16-2.46-4.1-216.23 60.4-4.28 1.17v-3.09l290.42-82.52 126.34 134.77 12 294.66-1.51-.42v-5.28l-5.83-132.82-.33-7.72-.78-18-.2-4.68-5.2-119.81z,
m262.59 85.62-.78 17.28-72.99 25.09-15.75-10.58z,m261.81 102.9-1.17 26.32-66.49 22.51 5.93 4.92-3.68 66.73-5.33 7.16 45-10.85q-.24 5.43-.51 10.85l-51.83 12.83-20.2 10.69 9.56-136.65 15.73 10.59z,m257.81 192.47 2.48-55.25.35-8 1.17-26.32.78-17.28.13-2.87 2.89-1.03-4.97 109.93z,m260.64 129.22-.35 8-60.21 19.43-5.93-4.92z,m685.69 417.24-12.96-8.52-1.69 14.93-2.5-17.67-76.19-50.09-3.46 14.53-2.46-14.63-.72-4.26-28.07-18.46-53.75 9.09-1.93 4.43-7.1 16.36-6.82-12.79-2.6-4.88-225.96 38.21.16-2.82 297.86-52.07 128.19 84.98.33 7.72-.83.09v-.01z,m251.87 607.21-5.52 9.2-73.69 1.84-4.71-8.39z,m559.34 521.94-308.69 21.6v-6l118-8.32 101.5-7.16 89.93-6.35 70.92 20.68 13.67 4 47.08 13.74v5.28c.04.59-132.41-37.47-132.41-37.47z,m246.35 543.54 18.23-327.51 4.28-1.25v4.91l-7.71 134.63-.27 4.69-1.24 21.66-.16 2.82-.22 3.86-8.61 150.18v6.01z,
m240.82 700.75 8.19 10.24-89.25-3.69 8.19-9.2z,m667.4 229.3 6.38 7.11 12.38 13.79v3.17l-131.53-144.15-314.25 91.85-3.5 1c.07-1.39.13-2.78.2-4.18l20.75-5.45 2.82-.82 25.22-7.34 2.91-.85 8-2.31 86.66-25.21 86.36-25.13 86.6-25.2 4.62 5.15 37.68 42 59.3 66.14 2 2.2 6 6.68z,
m236.45 211.1c-.13 2.86-.26 5.73-.4 8.59l-45 10.85 5.33-7.16z,m163 262.48 71.85-17.79q-.34 7.27-.69 14.51l-53.55 12.08z,m180.64 271.28 53.55-12.08-1.19 25.59-48.27 10.21 7.58 5.73-2.58 69.6-7.65 10.31 46.6-8.05q-.28 5.79-.58 11.58l-54.62 8.06-20.48 12.5 10-142.26h.1z,m233 284.79c-.12 2.44-.24 4.9-.36 7.36l-40.3 8.61-7.61-5.76z,m230.66 571.85 254.38-14.22 2.23 4.44-2.64 1.33-253.43 13.72-2.46-1.16z,m229.06 364.82c-.12 2.6-.26 5.21-.38 7.8l-46.6 8.05 7.65-10.31z,m154 414.12 73.2-11.19c-.16 3.09-.31 6.16-.46 9.25l-53.89 8.06z,m226.69 412.18q-.94 18.51-1.88 37l-50.12 5.19 8.33 5.19-4.65 76.55-8.45 9.83 50.08-4.23q-.37 7-.74 13.91l-57.45 2.45-20.63 15.52 11.13-159.22 1.65-.25 18.84 6.12z,
m224.82 449.17c-.11 2-.2 3.92-.31 5.89l-41.51 4.49-8.33-5.19z,m675.62 580.65-77.78-18.32-1.19 4.14-3 10.43-3-12.64-.92-3.84-29.64-7-55.66 3.11-1.61 3.47-8 17.11-7.59-15-2.23-4.48-254.34 14.22-1.92 4.15-6.55 14-2.31-10.55-1.52-6.92.9-16.92q.38-6.95.74-13.91l.45-8.48q2.06-39 4.06-78.17c.11-2 .2-3.93.31-5.89q.93-18.5 1.88-37c.15-3.09.3-6.16.46-9.25.06-1.31.14-2.6.2-3.91q.36-7.41.74-14.82.28-5.79.58-11.58c.12-2.59.26-5.2.38-7.8q1.8-36.29 3.55-72.67c.12-2.46.24-4.92.36-7.36l1.22-25.59q.34-7.24.69-14.51c.06-1.5.14-3 .21-4.53l.45-9.62q.27-5.41.51-10.85c.14-2.86.27-5.73.4-8.59s.28-6 .42-9l3.5-1-17.92 366 336.83-19.08 141 34.4.17 4.13-18.65-4.39-1.93 9-.92 4.29z,
m216.66 595.54.82-15.56 2.4-.52 2.31 10.54 6.55-14.04 2.46 1.16.21 18z,m220.45 533.23-.45 8.48-50.07 4.22 8.45-9.83 42.06-2.87z,m219.26 555.62-.9 16.92c0 .78-.08 1.54-.13 2.32l-76.83 6-.47-3.7.25-3.53 20.63-15.52z,m182.62 107.17 299.96-107.17h12.42l-200.89 71.56-2.67.96-25.83 9.19v.01l-2.89 1.03-99.21 35.34v-3.27z,m235.09 240.16-71.58 18.84h-.34l.34-4.91 20.2-10.69 51.83-12.83z,m163.51 259 71.58-18.84c-.07 1.52-.15 3-.21 4.53l-71.88 17.79h-.1l.24-3.5z,m163.51 118.09 99.21-35.34-.13 2.87-89.52 31.79-9.73 3.1z,m162.92 583.12.11 17.94-11.36-.45-10.28-.39.45-15.89z,m158.41 188.38-3.43 47.15-23.01 7.15-3.39 45.59 23.08-7.09-23.08 317.56 1.29 1.09 11.52.39 10.28.39-9.52 139.65-56.7-7.17 10.85-159.25-17.61 1.43 27.44-371.13 52.27-15.76z,
m153 404.73 20.5-12.47 54.62-8.06q-.37 7.41-.74 14.82l-74.78 11.41z,m154 414.12-1.65.25.27-3.94 74.74-11.43c-.06 1.31-.14 2.6-.2 3.91z,m141.4 580.82 76.83-6c.05-.78.09-1.54.13-2.32l1.52 6.92-2.4.52-54.56 3.14-21.08 1.21z,m152.31 414.37-11.13 159.22-.25 3.53.47 3.7.44 3.51-.45 15.89-11.52-.39-1.29-1.09 23.08-317.56 3.32-45.65 3.43-47.15 4.93-67.87 9.73-3.1-9.56 136.65-.34 4.91-.24 3.5-9.95 142.26-.4 5.7z
  '''
          .split(",");

  final _shapes = [
    Shape(_data[0], '', const Color(0xffacd266), false, null, null),
    Shape(_data[1], '', const Color(0xffacd266), false, null, null),
    Shape(_data[2], '', const Color(0x000fffff), false, null, null),
    Shape(_data[3], '', const Color(0xffed1e29), false, null, null),
    Shape(_data[4], '', const Color(0xffacd266), false, null, null),
    Shape(_data[5], '', const Color(0x000fffff), false, null, null),
    Shape(_data[6], '', const Color(0x000fffff), false, null, null),
    Shape(_data[7], "", const Color(0xffacd266), false, null, null),
    Shape(_data[8], "", const Color(0x000fffff), false, null, null),
    Shape(_data[9], "", const Color(0x000fffff), false, null, null),
    Shape(_data[10], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[11], "", const Color(0xffacd266), false, null, null),
    Shape(_data[12], "", const Color(0xffacd266), false, null, null),
    Shape(_data[13], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[14], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[15], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[16], "", const Color(0xffacd266), false, null, null),
    Shape(_data[17], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[18], "", const Color(0x000fffff), false, null, null),
    Shape(_data[19], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[20], "", const Color(0x000fffff), false, null, null),
    Shape(_data[21], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[22], "", const Color(0xffacd266), false, null, null),
    Shape(_data[23], "", const Color(0x000fffff), false, null, null),
    Shape(_data[24], "", const Color(0xffacd266), false, null, null),
    Shape(_data[25], "", const Color(0x000fffff), false, null, null),
    Shape(_data[26], "", const Color(0xffacd266), false, null, null),
    Shape(_data[27], "", const Color(0xffacd266), false, null, null),
    Shape(_data[28], "", const Color(0x000fffff), false, null, null),
    Shape(_data[29], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[30], "", const Color(0xffacd266), false, null, null),
    Shape(_data[31], "", const Color(0x000fffff), false, null, null),
    Shape(_data[32], "", const Color(0xffacd266), false, null, null),
    Shape(_data[33], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[34], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[35], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[36], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[37], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[38], "", const Color(0xffacd266), false, null, null),
    Shape(_data[39], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[40], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[41], "", const Color(0xffacd266), false, null, null),
    Shape(_data[42], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[43], "", const Color(0x000fffff), false, null, null),
    Shape(_data[44], "", const Color(0xffacd266), false, null, null),
    Shape(_data[45], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[46], "", const Color(0xffacd266), false, null, null),
    Shape(_data[47], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[48], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[49], "", const Color(0x000fffff), false, null, null),
    Shape(_data[50], "", const Color(0x000fffff), false, null, null),
    Shape(_data[51], "", const Color(0x000fffff), false, null, null),
    Shape(_data[52], "", const Color(0x000fffff), false, null, null),
    Shape(_data[53], "", const Color(0x000fffff), false, null, null),
    Shape(_data[54], "", const Color(0xffacd266), false, null, null),
    Shape(_data[55], "", const Color(0xffacd266), false, null, null),
    Shape(_data[56], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[57], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[58], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[59], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[60], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[61], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[62], "", const Color(0x000fffff), false, null, null),
    Shape(_data[63], "", const Color(0x000fffff), false, null, null),
    Shape(_data[64], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[65], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[66], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[67], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[68], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[69], "", const Color(0xffacd266), false, null, null),
    Shape(_data[70], "", const Color(0xffacd266), false, null, null),
    Shape(_data[71], "", const Color(0x000fffff), false, null, null),
    Shape(_data[72], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[73], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[74], "", const Color(0xffacd266), false, null, null),
    Shape(_data[75], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[76], "", const Color(0xffacd266), false, null, null),
    Shape(_data[77], "", const Color(0x000fffff), false, null, null),
    Shape(_data[78], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[79], "", const Color(0xffacd266), false, null, null),
    Shape(_data[80], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[81], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[82], "", const Color(0xffacd266), false, null, null),
    Shape(_data[83], "", const Color(0xffacd266), false, null, null),
    Shape(_data[84], "", const Color(0xffacd266), false, null, null),
    Shape(_data[85], "", const Color(0x000fffff), false, null, null),
    Shape(_data[86], "", const Color(0xffacd266), false, null, null),
    Shape(_data[87], "", const Color(0xffacd266), false, null, null),
    Shape(_data[88], "", const Color(0xffacd266), false, null, null),
    Shape(_data[89], "", const Color(0xffacd266), false, null, null),
    Shape(_data[90], "", const Color(0x000fffff), false, null, null),
    Shape(_data[91], "", const Color(0x000fffff), false, null, null),
    Shape(_data[92], "", const Color(0xffacd266), false, null, null),
    Shape(_data[93], "", const Color(0x000fffff), false, null, null),
    Shape(_data[94], "", const Color(0x000fffff), false, null, null),
    Shape(_data[95], "", const Color(0x000fffff), false, null, null),
    Shape(_data[96], "", const Color(0x000fffff), false, null, null),
    Shape(_data[97], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[98], "", const Color(0xffacd266), false, null, null),
    Shape(_data[99], "", const Color(0x000fffff), false, null, null),
    Shape(_data[100], "", const Color(0xffacd266), false, null, null),
    Shape(_data[101], "", const Color(0xffacd266), false, null, null),
    Shape(_data[102], "", const Color(0x000fffff), false, null, null),
    Shape(_data[103], "", const Color(0xffacd266), false, null, null),
    Shape(_data[104], "", const Color(0xffacd266), false, null, null),
    Shape(_data[105], "", const Color(0xffacd266), false, null, null),
    Shape(_data[106], "", const Color(0x000fffff), false, null, null),
    Shape(_data[107], "", const Color(0xffacd266), false, null, null),
    Shape(_data[108], "", const Color(0xffacd266), false, null, null),
    Shape(_data[109], "", const Color(0xffacd266), false, null, null),
    Shape(_data[110], "", const Color(0x000fffff), false, null, null),
    Shape(_data[111], "", const Color(0xffacd266), false, null, null),
    Shape(_data[112], "", const Color(0xffacd266), false, null, null),
    Shape(_data[113], "", const Color(0x000fffff), false, null, null),
    Shape(_data[114], "", const Color(0xffacd266), false, null, null),
    Shape(_data[115], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[116], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[117], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[118], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[119], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[120], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[121], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[122], "", const Color(0xffacd266), false, null, null),
    Shape(_data[123], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[124], "", const Color(0xff0c8c44), false, null, null),
    Shape(_data[125], "", const Color(0xffacd266), false, null, null),
    Shape(_data[126], "", const Color(0x000fffff), false, null, null),
    Shape(_data[127], "", const Color(0x000fffff), false, null, null),
    Shape(_data[128], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[129], "", const Color(0x000fffff), false, null, null),
    Shape(_data[130], "", const Color(0xffacd266), false, null, null),
    Shape(_data[131], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[132], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[133], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[134], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[135], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[136], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[137], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[138], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[139], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[140], "", const Color(0x000fffff), false, null, null),
    Shape(_data[141], "", const Color(0xffacd266), false, null, null),
    Shape(_data[142], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[143], "", const Color(0xffacd266), false, null, null),
    Shape(_data[144], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[145], "", const Color(0x000fffff), false, null, null),
    Shape(_data[146], "", const Color(0xffacd266), false, null, null),
    Shape(_data[147], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[148], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[149], "", const Color(0xffacd266), false, null, null),
    Shape(_data[150], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[151], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[152], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[153], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[154], "", const Color(0xffacd266), false, null, null),
    Shape(_data[155], "", const Color(0xffacd266), false, null, null),
    Shape(_data[156], "", const Color(0x000fffff), false, null, null),
    Shape(_data[157], "", const Color(0xffacd266), false, null, null),
    Shape(_data[158], "", const Color(0xffed1e29), false, null, null),
    Shape(_data[159], "", const Color(0xffacd266), false, null, null),
    Shape(_data[160], "", const Color(0xffacd266), false, null, null),
    Shape(_data[161], "", const Color(0xff0c8c44), false, null, null),
  ];

  final ValueNotifier<Offset> _notifier;
  final Paint _paint = Paint();
  Size _size = Size.zero;
  var selected;
  @override
  void paint(Canvas canvas, Size size) {
    if (size != _size) {
      _size = size;
      final fs = applyBoxFit(BoxFit.fill, const Size(710, 750), size);
      final r = Alignment.center.inscribe(fs.destination, Offset.zero & size);
      final matrix = Matrix4.translationValues(r.left, r.top, 0)
        ..scale(fs.destination.width / fs.source.width);
      for (var shape in _shapes) {
        if (_shapes.isNotEmpty) {
          shape.transform(matrix);
        }
      }
    }
    canvas
      ..clipRect(Offset.zero & size)
      ..drawColor(Colors.white, BlendMode.dstIn);
    Color? svgColor;

    for (int i = 0; i < _shapes.length; i++) {
      final path = _shapes[i]._transformedPath;
      selected = path!.contains(_notifier.value);
      if (selected) {
        svgColor = _shapes[i].defaultColor!;
        break;
      }
    }

    if (colorValue != null) {
      for (int i = 0; i < _shapes.length; i++) {
        if (svgColor == _shapes[i].defaultColor) {
          _paint
            ..color = (colorValue)!
            ..style = PaintingStyle.fill;
          _shapes[i].selectedColor = Colors.transparent;
          canvas.drawPath(_shapes[i]._transformedPath!, _paint);
          _shapes[i].selectedColor = colorValue;
        }
        if (_shapes[i].selectedColor != null) {
          _paint
            ..color = (_shapes[i].selectedColor)!
            ..style = PaintingStyle.fill;
          canvas.drawPath(_shapes[i]._transformedPath!, _paint);
          _shapes[i].selectedColor == null;
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
