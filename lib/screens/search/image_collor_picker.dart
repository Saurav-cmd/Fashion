import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/screens/search/matched_color_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;

class ColorPicker extends StatefulWidget {
  ColorPicker({Key, this.cameraImage, this.galleryImage, this.title, key})
      : super(key: key);
  File? cameraImage;
  File? galleryImage;
  String? title;
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  File? passedCameraImage;
  File? passedGalleryImage;
  String? passedTitle;

  String imagePath = 'images/1.jpeg';
  GlobalKey imageKey = GlobalKey();
  GlobalKey paintKey = GlobalKey();

  // CHANGE THIS FLAG TO TEST BASIC IMAGE, AND SNAPSHOT.
  bool useSnapshot = true;

  // based on useSnapshot=true ? paintKey : imageKey ;
  // this key is used in this example to keep the code shorter.
  GlobalKey? currentKey;

  final StreamController<Color> _stateController = StreamController<Color>();
  img.Image? photo;

  @override
  void initState() {
    currentKey = useSnapshot ? paintKey : imageKey;
    super.initState();
    passedCameraImage = widget.cameraImage;
    passedGalleryImage = widget.galleryImage;
    passedTitle = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        title: Text("$passedTitle"),
        backgroundColor: ChooseColor(0).appBarColor1,
        elevation: 0,
      ),
      body: StreamBuilder(
          initialData: Colors.green[500],
          stream: _stateController.stream,
          builder: (buildContext, snapshot) {
            Color? selectedColor = (snapshot.data ?? Colors.green) as ui.Color?;
            return Column(
              children: [
                Stack(
                  children: <Widget>[
                    RepaintBoundary(
                      key: paintKey,
                      child: GestureDetector(
                        onPanDown: (details) {
                          searchPixel(details.globalPosition);
                        },
                        onPanUpdate: (details) {
                          searchPixel(details.globalPosition);
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.file(
                            passedCameraImage!,
                            key: imageKey,
                            fit: BoxFit.fill,
                            //scale: .8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Color"),
                      Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                            color: selectedColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2))
                            ]),
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Text('$selectedColor',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                              width: size.width * 0.25,
                              height: size.height * 0.050),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => MatchedColorScreen(
                                        selectedColor: selectedColor,
                                      )));
                            },
                            child: Text("PROCEED"),
                            style: ElevatedButton.styleFrom(
                                primary: ChooseColor(0).appBarColor1),
                          ))
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  void searchPixel(Offset globalPosition) async {
    if (photo == null) {
      await (useSnapshot ? loadSnapshotBytes() : loadImageBundleBytes());
    }
    _calculatePixel(globalPosition);
  }

  void _calculatePixel(Offset globalPosition) {
    RenderBox box = currentKey!.currentContext!.findRenderObject() as RenderBox;
    Offset localPosition = box.globalToLocal(globalPosition);

    double px = localPosition.dx;
    double py = localPosition.dy;

    if (!useSnapshot) {
      double widgetScale = box.size.width / photo!.width;
      px = (px / widgetScale);
      py = (py / widgetScale);
    }

    int pixel32 = photo!.getPixelSafe(px.toInt(), py.toInt());
    int hex = abgrToArgb(pixel32);

    _stateController.add(Color(hex));
  }

  Future<void> loadImageBundleBytes() async {
    ByteData imageBytes = await rootBundle.load(passedCameraImage.toString());
    setImageBytes(imageBytes);
  }

  Future<void> loadSnapshotBytes() async {
    RenderRepaintBoundary boxPaint =
        paintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image capture = await boxPaint.toImage();
    ByteData? imageBytes =
        await capture.toByteData(format: ui.ImageByteFormat.png);
    setImageBytes(imageBytes!);
    capture.dispose();
  }

  void setImageBytes(ByteData imageBytes) {
    List<int> values = imageBytes.buffer.asUint8List();
    photo = null;
    photo = img.decodeImage(values);
  }
}

// image lib uses uses KML color format, convert #AABBGGRR to regular #AARRGGBB
int abgrToArgb(int argbColor) {
  int r = (argbColor >> 16) & 0xFF;
  int b = argbColor & 0xFF;
  return (argbColor & 0xFF00FF00) | (b << 16) | r;
}
