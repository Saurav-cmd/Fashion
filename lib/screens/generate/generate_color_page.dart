import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/main.dart';
import 'package:fashion_paints/models/database_models/book_marked_model.dart';
import 'package:fashion_paints/models/database_models/colorant_database_model.dart';
import 'package:fashion_paints/models/database_models/shade_color_database_model.dart';
import 'package:fashion_paints/screens/generate/product_detail_screen.dart';
import 'package:fashion_paints/widgets/dilogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Utils/contants.dart';
import '../../colors/colors_file.dart';
import '../../models/database_models/cosmetic_int_emulsion_database_model.dart';
import '../book_marked/book_marked_screen.dart';
import '../saved/saved_screen.dart';

// ignore: must_be_immutable
class GenerateColorScreen extends StatefulWidget {
  GenerateColorScreen(
      {Key,
      this.columnId,
      this.colorName,
      this.productName,
      this.canSize,
      this.base,
      this.colorants,
      this.fanDeckName,
      key})
      : super(key: key);
  int? columnId;
  String? colorName;
  String? productName;
  double? canSize;
  double? base;
  String? colorants;
  String? fanDeckName;
  @override
  State<GenerateColorScreen> createState() => _GenerateColorScreenState();
}

class _GenerateColorScreenState extends State<GenerateColorScreen> {
  int? passedColumnId;
  String? passedColorName;
  String? passedProductName;
  double? passedCanSize;
  double? passedBase;
  String? passedColorants;
  String? passedFanDeckName;
  double? fanDeckId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedColumnId = widget.columnId;
    passedColorName = widget.colorName;
    passedProductName = widget.productName;
    passedCanSize = widget.canSize;
    passedBase = widget.base;
    passedColorants = widget.colorants;
    passedFanDeckName = widget.fanDeckName;
    grabFanDeckId();
    DatabaseHelper;
  }

  getDouble(String? value) {
    double d = double.parse(value!);
    return d;
  }

  grabFanDeckId() {
    //yo id maila fandeck_id directory vhitra fandeck_name_id.dart vhitra statically id haru save garaya ra rakhaya ko xu tai tanaya ho
    fanDeckId = Constants.fanDeckNameToId(passedFanDeckName);
    setState(() {
      getBaseName();
    });
  }

  List<String?> baseName = [];
  List<ShadeColorDatabase> colorValue = [];
  getBaseName() async {
    List<CosmeticInt> cosmeticIntEmu = await DatabaseHelper.instance
        .queryCosmeticInt(
            passedProductName, fanDeckId, passedColorName!.split("(").first);
    double? baseId = cosmeticIntEmu[0].base;
    final baseColorData = await DatabaseHelper.instance.getColorBaseData();
    for (int j = 0; j < baseColorData.length; j++) {
      if (baseId == baseColorData[j].bId) {
        setState(() {
          baseName.add(baseColorData[j].base);
          getCylinderVolume();
        });
      }
    }
  }

  List<String?> cylinder = [];
  List<double> calculatedCylinderVolume = [];
  getCylinderVolume() async {
    List<CosmeticInt?> cosmeticInt = await DatabaseHelper.instance
        .queryCosmeticInt(
            passedProductName, fanDeckId, passedColorName!.split("(").first);
    setState(() {
      calculatedCylinderVolume.clear();
    });
    if (getDouble(cosmeticInt[0]?.whf.toString()) > 0.0) {
      cylinder.add("WHF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.whf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.whf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.fbf.toString()) > 0) {
      cylinder.add("FBF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.fbf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.fbf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.fgf.toString()) > 0) {
      cylinder.add("FGF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.fgf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.fgf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.fef.toString()) > 0) {
      cylinder.add("FEF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.fef.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.fef.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.yof.toString()) > 0) {
      cylinder.add("YOF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.yof.toString()).toStringAsFixed(3);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.yof.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.fvf.toString()) > 0) {
      cylinder.add("FVF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.fvf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.fvf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.iyf.toString()) > 0) {
      cylinder.add("IYF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.iyf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.iyf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.mgf.toString()) > 0) {
      cylinder.add("MGF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.mgf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.mgf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.irf.toString()) > 0) {
      cylinder.add("IRF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.irf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.irf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.rof.toString()) > 0) {
      cylinder.add("ROF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.rof.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.rof.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.erf.toString()) > 0) {
      cylinder.add("ERF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.erf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.erf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.myf.toString()) > 0) {
      cylinder.add("MYF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.myf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.myf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.lbf.toString()) > 0) {
      cylinder.add("LBF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.lbf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.lbf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.lgf.toString()) > 0) {
      cylinder.add("LGF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.lgf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.lgf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.eyf.toString()) > 0) {
      cylinder.add("EYF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.eyf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.eyf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    if (getDouble(cosmeticInt[0]?.ruf.toString()) > 0) {
      cylinder.add("RUF");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.ruf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * passedCanSize!;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      } else if (selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          String value =
              double.parse(cosmeticInt[0]!.ruf.toString()).toStringAsFixed(2);
          double? value1 = double.parse(value);
          double? calculate = value1 * selectedCanSize;
          double? fixed = double.parse(calculate.toStringAsFixed(2));
          calculatedCylinderVolume.add(fixed);
        });
      }
    }
    getColorants();
  }

  List<int> rValue = [];
  List<int> gValue = [];
  List<int> bValue = [];
  List<double> unitPrice = [];
  //yo colorants table lai query garaya ko bata data tanne function bana ko ho
  getColorants() async {
    for (int i = 0; i < cylinder.length; i++) {
      List<Colorants> colorantsData =
          await DatabaseHelper.instance.queryColorantsColor(cylinder[i]);
      if (colorantsData.isNotEmpty) {
        for (var e in colorantsData) {
          if (e.rValue != null &&
              e.gValue != null &&
              e.bValue != null &&
              e.unitPrice != null) {
            setState(() {
              rValue.add(e.rValue!.toInt());
              gValue.add(e.gValue!.toInt());
              bValue.add(e.bValue!.toInt());
              unitPrice.add(e.unitPrice! / 100);
            });
          } else {
            return;
          }
        }
      }
      setState(() {
        getSingleColorantValue();
      });
    }
  }

  //yo shade color lai query garaya ko bata data tanne function bana ko ho
  int singleRValue = 0;
  int singleGValue = 0;
  int singleBValue = 0;
  getSingleColorantValue() async {
    List<ShadeColorDatabase> shadeColorDataList = await DatabaseHelper.instance
        .queryShadeColor(passedColorName!.split("(").first);
    // setState(() {
    singleRValue = shadeColorDataList[0].rValue!.toInt();
    singleGValue = shadeColorDataList[0].gValue!.toInt();
    singleBValue = shadeColorDataList[0].bValue!.toInt();
    // });
  }

  String selectedContainer = "";
  double selectedCanSize = 0.0;

  double? height1 = 100;
  int? height2;
  Color iconColor = Colors.white;

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
            if (passedColumnId == null) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => ProductDetailScreen(
                        fanDeckName: passedFanDeckName,
                        productName: passedProductName,
                      )));
            } else {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => const BookMarkedScreen()));
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white60,
          iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Formula"),
        actions: [
          IconButton(
              onPressed: () {
                //yo chai khas ma save ho icon chai bookmark ko milaya ra halaya ko ho
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (ctx) => SavedScreen(
                          colorName: passedColorName,
                          productName: passedProductName,
                          canSize: selectedCanSize == 0
                              ? passedCanSize
                              : selectedCanSize,
                          rColor: double.parse(singleRValue.toString()),
                          gColor: double.parse(singleGValue.toString()),
                          bColor: double.parse(singleBValue.toString()),
                          fandeckId: fanDeckId,
                        )));
              },
              icon: const Icon(Icons.bookmark)),
          IconButton(
              onPressed: () async {
                if (passedColumnId == null) {
                  DatabaseHelper.instance
                      .addBookMarkedData(BookMarked(
                    fandeckId: fanDeckId?.toInt(),
                    colorName: passedColorName,
                    productName: passedProductName,
                    fandeckName: passedFanDeckName,
                    canSize: selectedCanSize == 0
                        ? passedCanSize
                        : selectedCanSize.toDouble(),
                    canColorR: double.parse(singleRValue.toString()),
                    canColorG: double.parse(singleGValue.toString()),
                    canColorB: double.parse(singleBValue.toString()),
                  ))
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
                              'Color BookMarked',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize:
                                      size.height * 0.012 + size.width * 0.012),
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
                } else if (passedColumnId != null) {
                  DatabaseHelper.instance
                      .updateBookMarkedData(
                          BookMarked(
                            id: passedColumnId,
                            fandeckId: fanDeckId?.toInt(),
                            colorName: passedColorName,
                            productName: passedProductName,
                            fandeckName: passedFanDeckName,
                            canSize: selectedCanSize == 0.0
                                ? passedCanSize
                                : selectedCanSize,
                            canColorR: double.parse(singleRValue.toString()),
                            canColorG: double.parse(singleGValue.toString()),
                            canColorB: double.parse(singleBValue.toString()),
                          ),
                          passedColumnId)
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
                              'BookMarked Updated',
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize:
                                      size.height * 0.012 + size.width * 0.012),
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
                }
                setState(() {
                  iconColor = Colors.red;
                });
              },
              icon: Icon(
                Icons.star_border,
                color:
                    passedColumnId == null ? iconColor : iconColor = Colors.red,
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.030, vertical: size.height * 0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 210,
                          child: Text(
                            'Colour Code/Name',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize:
                                    size.height * 0.010 + size.width * 0.010,
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(height: size.height * 0.010),
                      Text(
                        '$passedColorName',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.012 + size.width * 0.012,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product : $passedProductName',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    size.height * 0.012 + size.width * 0.012,
                                fontWeight: FontWeight.w600),
                          ),
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height: 100,
                                width: 70,
                                color: Colors.grey.shade300,
                              ),
                              SizedBox(
                                child: AnimatedContainer(
                                  height: 80,
                                  width: 70,
                                  color: Color.fromRGBO(singleRValue,
                                      singleGValue, singleBValue, 1),
                                  duration: const Duration(seconds: 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.015),
                      Text(
                        'Fandeck',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.010 + size.width * 0.010,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$passedFanDeckName',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.012 + size.width * 0.012,
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
                'Base:',
                style: TextStyle(
                    color: ChooseColor(0).appBarColor1,
                    fontSize: size.height * 0.010 + size.width * 0.010,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height * 0.010),
              //here
              if (passedProductName == "cosmeticintemulsion" ||
                  passedProductName == "magnetextemulsion" ||
                  passedProductName == "weatherproofextemulsion")
                Text(
                  '$baseName  ${selectedCanSize == 0.0 ? passedCanSize : selectedCanSize} Ltr',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: size.height * 0.012 + size.width * 0.012,
                      fontWeight: FontWeight.w500),
                ),
              if (passedProductName == "smartdist" ||
                  passedProductName == "styledist")
                Text(
                  '$baseName  $passedCanSize Kg',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: size.height * 0.012 + size.width * 0.012,
                      fontWeight: FontWeight.w500),
                ),
              SizedBox(height: size.height * 0.020),
              Text(
                'Colourants:',
                style: TextStyle(
                    color: ChooseColor(0).appBarColor1,
                    fontSize: size.height * 0.010 + size.width * 0.010,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height * 0.010),
              SizedBox(
                height: 130,
                child: GridView.builder(
                    itemCount: calculatedCylinderVolume.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemBuilder: (ctx, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height: 80,
                                width: 70,
                                color: Colors.grey.shade300,
                              ),
                              // if(selectedCanSize.toString().isEmpty || selectedCanSize==0.0)
                              SizedBox(
                                child: Container(
                                  height: calculatedCylinderVolume[i]
                                              .truncateToDouble() >
                                          500
                                      ? 90
                                      : calculatedCylinderVolume[i]
                                                  .truncateToDouble() >
                                              400
                                          ? 80
                                          : calculatedCylinderVolume[i]
                                                      .truncateToDouble() >
                                                  300
                                              ? 70
                                              : calculatedCylinderVolume[i]
                                                          .truncateToDouble() >
                                                      200
                                                  ? 60
                                                  : calculatedCylinderVolume[i]
                                                              .truncateToDouble() >
                                                          107
                                                      ? 50
                                                      : calculatedCylinderVolume[
                                                          i],
                                  width: 70,
                                  color: Color.fromRGBO(
                                      rValue[i], gValue[i], bValue[i], 3),
                                ),
                              ),
                            ],
                          ),
                          Text(cylinder[i]!),
                          if (passedProductName == "cosmeticintemulsion" ||
                              passedProductName == "magnetextemulsion" ||
                              passedProductName == "weatherproofextemulsion")
                            Text("${calculatedCylinderVolume[i]} ML"),
                          if (passedProductName == "smartdist" ||
                              passedProductName == "styledist")
                            Text("${calculatedCylinderVolume[i]} KG"),
                        ],
                      );
                    }),
              ),
              SizedBox(height: size.height * 0.020),

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
                          getCylinderVolume();
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
                          getCylinderVolume();
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
                          getCylinderVolume();
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
                          getCylinderVolume();
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
                          getCylinderVolume();
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
                          getCylinderVolume();
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
                          getCylinderVolume();
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
                          getCylinderVolume();
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

              SizedBox(height: size.height * 0.030),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: double.infinity, height: size.height * 0.055),
                child: ElevatedButton(
                  child: Text(
                    'Price',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: size.height * 0.014 + size.width * 0.014),
                  ),
                  onPressed: () async {
                    AlertBox().priceDialogueBox(
                        baseName[0],
                        selectedCanSize.toString().isEmpty ||
                                selectedCanSize == 0.0
                            ? passedCanSize
                            : selectedCanSize,
                        rValue,
                        gValue,
                        bValue,
                        cylinder,
                        calculatedCylinderVolume,
                        unitPrice,
                        context);
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
