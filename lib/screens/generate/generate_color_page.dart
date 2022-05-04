import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/main.dart';
import 'package:fashion_paints/models/database_models/book_marked_model.dart';
import 'package:fashion_paints/models/database_models/colorant_database_model.dart';
import 'package:fashion_paints/models/database_models/doubled_fencee_database_%20model.dart';
import 'package:fashion_paints/models/database_models/shade_color_database_model.dart';
import 'package:fashion_paints/screens/generate/product_detail_screen.dart';
import 'package:fashion_paints/widgets/dilogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Utils/contants.dart';
import '../../colors/colors_file.dart';
import '../book_marked/book_marked_screen.dart';
import '../saved/saved_screen.dart';


// ignore: must_be_immutable
class GenerateColorScreen extends StatefulWidget {
  GenerateColorScreen({Key,this.columnId,this.colorName,this.productName,this.canSize,this.base,this.colorants,this.fanDeckName,key}) : super(key: key);
  int?columnId;
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
  int?passedColumnId;
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
    print("THis is columnId $passedColumnId");
  }

  getDouble(String? value){
    double d =double.parse(value!);
    return d ;
  }

  grabFanDeckId(){
    //yo id maila fandeck_id directory vhitra fandeck_name_id.dart vhitra statically id haru save garaya ra rakhaya ko xu tai tanaya ho
    fanDeckId = Constants.fanDeckNameToId(passedFanDeckName);
    setState(() {
      getBaseName();
    });
  }

  List<String?> baseName = [];
  List<ShadeColorDatabase> colorValue = [];
  getBaseName()async {
    List<DoubleDefenceee?> doubleDefence = await DatabaseHelper.instance
        .queryDoubleDefence(passedProductName, fanDeckId, passedColorName);
    double? baseId = doubleDefence[0]!.base;
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
  getCylinderVolume() async{
    List<DoubleDefenceee?> doubleDefence = await DatabaseHelper.instance.queryDoubleDefence(passedProductName, fanDeckId, passedColorName);
    setState(() {
      calculatedCylinderVolume.clear();
    });
    if (getDouble(doubleDefence[0]?.fT) > 0.0) {
      cylinder.add("FT");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.fT!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.fT!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.kS) > 0) {
      cylinder.add("KS");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.kS!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.kS!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.lS) > 0) {
      cylinder.add("LS");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.lS!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.lS!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.lT) > 0) {
      cylinder.add("LT");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.lT!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.lT!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.mM) > 0) {
      cylinder.add("MM");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.mM!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.mM!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.mS) > 0) {
      cylinder.add("MS");
      if (selectedCanSize.toString().isEmpty || selectedCanSize == 0.0) {
        setState(() {
          calculatedCylinderVolume.clear();
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.mS!) * passedCanSize!);
        });
      } else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.mS!) * selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.mT) > 0) {
      cylinder.add("MT");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.mT!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.mT!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.pP) > 0) {
      cylinder.add("PP");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.pP!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.pP!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.rS) > 0) {
      cylinder.add("RS");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.rS!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.rS!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.rT) > 0) {
      cylinder.add("RT");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.rT!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.rT!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.sT) > 0) {
      cylinder.add("ST");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.sT!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.sT!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.tT) > 0) {
      cylinder.add("TT");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.tT!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.tT!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.uS) > 0) {
      cylinder.add("US");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.uS!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.uS!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.vT) > 0) {
      cylinder.add("VT");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.vT!).round()*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.vT!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.xT) > 0) {
      cylinder.add("XT");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.xT!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.xT!)*selectedCanSize);
        });
      }
    }
    if (getDouble(doubleDefence[0]?.zT) > 0) {
      cylinder.add("ZT");
      if(selectedCanSize.toString().isEmpty || selectedCanSize == 0.0){
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.zT!)*passedCanSize!);
        });
      }else if(selectedCanSize.toString().isEmpty || selectedCanSize != 0.0) {
        setState(() {
          calculatedCylinderVolume.add(double.parse(doubleDefence[0]!.zT!)*selectedCanSize);
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
  getColorants()async{
    for(int i=0;i<cylinder.length;i++){
      List<Colorants> colorantsData =await DatabaseHelper.instance.queryColorantsColor(cylinder[i]);
      if(colorantsData.isNotEmpty) {
        for (var e in colorantsData) {
          if (e.rValue != null && e.gValue != null && e.bValue != null && e.unitPrice!=null) {
            setState(() {
              rValue.add(e.rValue!.toInt());
              gValue.add(e.gValue!.toInt());
              bValue.add(e.bValue!.toInt());
              unitPrice.add(e.unitPrice!/100);
            });
          }else{
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
  getSingleColorantValue()async{
  List<ShadeColorDatabase>? shadeColorDataList = await DatabaseHelper.instance.queryShadeColor(passedColorName);
    setState(() {
      singleRValue = shadeColorDataList[0].rValue!.toInt();
      singleGValue = shadeColorDataList[0].gValue!.toInt();
      singleBValue = shadeColorDataList[0].bValue!.toInt();
    });
  }
  String selectedContainer="";
  double selectedCanSize=0;

  double? height1 =100;
  int? height2;
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar:AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:ChooseColor(0).appBarColor1,
            statusBarIconBrightness: Brightness.light// For iOS (dark icons)
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            if(passedColumnId==null) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) =>
                      ProductDetailScreen(fanDeckName: passedFanDeckName,
                        productName: passedProductName,)));
            }else{
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>const BookMarkedScreen()));
            }
          },
          icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Formula"),
        actions: [
          IconButton(onPressed:(){
            //yo chai khas ma save ho icon chai bookmark ko milaya ra halaya ko ho
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>SavedScreen(
              colorName: passedColorName,
              productName: passedProductName,
              canSize: selectedCanSize==0.0?passedCanSize:selectedCanSize,
              rColor: double.parse(singleRValue.toString()),
              gColor: double.parse(singleGValue.toString()),
              bColor: double.parse(singleBValue.toString()),
              fandeckId: fanDeckId,
            )));
          }, icon:const Icon(Icons.bookmark)),

          IconButton(
              onPressed:()async{
                if(passedColumnId==null) {
                  DatabaseHelper.instance.addBookMarkedData(
                      BookMarked(
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
                      )).whenComplete(() {
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
                                  "icons/logo 2.png", fit: BoxFit.fill,)),
                            SizedBox(width: size.width * 0.050),
                            Text(
                              'Color BookMarked',
                              maxLines: 2,
                              style: TextStyle(fontSize: size.height * 0.012 +
                                  size.width * 0.012),),
                          ],
                        ),
                      ),
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.grey.shade700,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    );
                    snackBarKey.currentState?.showSnackBar(snackBar);
                  });
                }else if(passedColumnId!=null){
                  DatabaseHelper.instance.updateBookMarkedData(
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
                    ),passedColumnId
                  ).whenComplete((){
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
                                  "icons/logo 2.png", fit: BoxFit.fill,)),
                            SizedBox(width: size.width * 0.050),
                            Text(
                              'BookMarked Updated',
                              maxLines: 2,
                              style: TextStyle(fontSize: size.height * 0.012 +
                                  size.width * 0.012),),
                          ],
                        ),
                      ),
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.grey.shade700,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    );
                    snackBarKey.currentState?.showSnackBar(snackBar);
                  });
                }
                    setState(() {
                      iconColor = Colors.red;
                    });
                    }, icon:Icon(Icons.star_border,color:passedColumnId==null?iconColor:iconColor=Colors.red,)),

          IconButton(onPressed:(){
            Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
          }, icon:const Icon(Icons.home)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: size.width*0.030,vertical: size.height*0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 210,
                          child: Text(
                            'Colour Code/Name',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: size.height*0.010+size.width*0.010,
                                fontWeight: FontWeight.w500),
                          )
                      ),
                      SizedBox(height: size.height*0.010),
                      Text(
                        '$passedColorName',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height*0.012+size.width*0.012,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product : $passedProductName',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height*0.012+size.width*0.012,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height:100 ,
                                width: 70,
                                color:Colors.grey.shade300,
                              ),
                              SizedBox(
                                child: AnimatedContainer(
                                  height:80,
                                  width:70,
                                  color:Color.fromRGBO(singleRValue, singleGValue, singleBValue, 1), duration:const Duration(seconds: 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height*0.015),
                      Text(
                        'Fandeck',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height*0.010+size.width*0.010,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        '$passedFanDeckName',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height*0.012+size.width*0.012,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),

                ),
              ),

              SizedBox(height: size.height*0.020),
              Text(
                'Base:',
                style: TextStyle(
                    color:ChooseColor(0).appBarColor1,
                    fontSize: size.height*0.010+size.width*0.010,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height*0.010),
              Text(
                '$baseName  $passedCanSize Ltr',
                style: TextStyle(
                    color:Colors.black,
                    fontSize: size.height*0.012+size.width*0.012,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height*0.020),
              Text(
                'Colourants:',
                style: TextStyle(
                    color:ChooseColor(0).appBarColor1,
                    fontSize: size.height*0.010+size.width*0.010,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: size.height*0.020),
              SizedBox(
                height:200,
                child: GridView.builder(
                    itemCount:calculatedCylinderVolume.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ), itemBuilder: (ctx,i){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            height: 100,
                            width: 70,
                            color:Colors.grey.shade300,
                          ),
                          // if(selectedCanSize.toString().isEmpty || selectedCanSize==0.0)
                            SizedBox(
                              child: Container(
                                height:calculatedCylinderVolume[i].truncateToDouble()  > 500
                                    ? 90:calculatedCylinderVolume[i].truncateToDouble()  > 400?80:calculatedCylinderVolume[i].truncateToDouble()  > 300?70:
                                      calculatedCylinderVolume[i].truncateToDouble()  > 200?60:calculatedCylinderVolume[i].truncateToDouble()  > 107?50
                                      :calculatedCylinderVolume[i],
                                width: 70,
                                color: Color.fromRGBO(
                                    rValue[i], gValue[i], bValue[i], 3),),
                            ),
                        ],
                      ),
                      Text(cylinder[i]!),
                      if(passedProductName=="relianceDist" || passedProductName=="shangrilaDist")
                        Text("${calculatedCylinderVolume[i]} Kg"),
                      if(passedProductName=="doubleDefenceEE" || passedProductName=="newUltraProtecEE" || passedProductName=="protecEE" || passedProductName=="newShangrilaEE" || passedProductName=="elegaIE" || passedProductName=="newBarpimoIE" || passedProductName=="newShangrilaIE")
                      Text("${calculatedCylinderVolume[i]} ML"),
                    ],
                  );

                }
                ),
              ),

              SizedBox(height: size.height*0.020),
              Text("Can Size:",style: TextStyle(fontSize: size.height*0.010+size.width*0.010,color: ChooseColor(0).appBarColor1,fontWeight: FontWeight.bold),),
              SizedBox(height: size.height*0.010),
              if(passedProductName=="doubleDefenceEE" || passedProductName=="newUltraProtecEE" || passedProductName=="protecEE" || passedProductName=="newShangrilaEE" || passedProductName=="elegaIE" || passedProductName=="newBarpimoIE" || passedProductName=="newShangrilaIE")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedContainer = "first";
                          selectedCanSize=1.0;
                          getCylinderVolume();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:selectedContainer=="first"?ChooseColor(0).appBarColor1:Colors.grey,
                            borderRadius:const BorderRadius.all(Radius.circular(10))
                        ),
                        child:Padding(
                          padding:EdgeInsets.symmetric(vertical: size.height*0.010,horizontal: size.width*0.030),
                          child: const Text("1 Ltr.",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedContainer="second";
                          selectedCanSize = 4.0;
                          getCylinderVolume();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:selectedContainer=="second"?ChooseColor(0).appBarColor1:Colors.grey,
                            borderRadius:const BorderRadius.all(Radius.circular(10))
                        ),
                        child:Padding(
                          padding:EdgeInsets.symmetric(vertical: size.height*0.010,horizontal: size.width*0.030),
                          child: const Text("4 Ltr.",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedContainer="third";
                          selectedCanSize = 10.0;
                          getCylinderVolume();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:selectedContainer=="third"?ChooseColor(0).appBarColor1:Colors.grey,
                            borderRadius:const BorderRadius.all(Radius.circular(10))
                        ),
                        child:Padding(
                          padding:EdgeInsets.symmetric(vertical: size.height*0.010,horizontal: size.width*0.030),
                          child: const Text("10 Ltr.",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedContainer = "fourth";
                          selectedCanSize = 20.0;
                          getCylinderVolume();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:selectedContainer=="fourth"?ChooseColor(0).appBarColor1:Colors.grey,
                            borderRadius:const BorderRadius.all(Radius.circular(10))
                        ),
                        child:Padding(
                          padding:EdgeInsets.symmetric(vertical: size.height*0.010,horizontal: size.width*0.030),
                          child: const Text("20 Ltr.",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    )
                  ],
                ),

              if(passedProductName=="relianceDist" || passedProductName=="shangrilaDist")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedContainer="first";
                          selectedCanSize = 1;
                          getCylinderVolume();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:selectedContainer=="first"?ChooseColor(0).appBarColor1:Colors.grey,
                            borderRadius:const BorderRadius.all(Radius.circular(10))
                        ),
                        child:Padding(
                          padding:EdgeInsets.symmetric(vertical: size.height*0.010,horizontal: size.width*0.030),
                          child: const Text("1 Kg",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedContainer="second";
                          selectedCanSize = 5;
                          getCylinderVolume();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:selectedContainer=="second"?ChooseColor(0).appBarColor1:Colors.grey,
                            borderRadius:const BorderRadius.all(Radius.circular(10))
                        ),
                        child:Padding(
                          padding:EdgeInsets.symmetric(vertical: size.height*0.010,horizontal: size.width*0.030),
                          child: const Text("5 Kg",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedContainer="third";
                          selectedCanSize = 10;
                          getCylinderVolume();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:selectedContainer=="third"?ChooseColor(0).appBarColor1:Colors.grey,
                            borderRadius:const BorderRadius.all(Radius.circular(10))
                        ),
                        child:Padding(
                          padding:EdgeInsets.symmetric(vertical: size.height*0.010,horizontal: size.width*0.030),
                          child: const Text("10 Kg",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedContainer="fourth";
                          selectedCanSize = 20;
                          getCylinderVolume();
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:selectedContainer=="fourth"?ChooseColor(0).appBarColor1:Colors.grey,
                            borderRadius:const BorderRadius.all(Radius.circular(10))
                        ),
                        child:Padding(
                          padding:EdgeInsets.symmetric(vertical: size.height*0.010,horizontal: size.width*0.030),
                          child: const Text("20 Kg",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    )
                  ],
                ),

              SizedBox(height: size.height*0.030),
              ConstrainedBox(
                constraints:BoxConstraints.tightFor(width: double.infinity,height:size.height*0.055),
                child: ElevatedButton(
                  child:Text('Price',maxLines: 1,style: TextStyle(fontSize:size.height*0.014+size.width*0.014),),
                  onPressed: ()async{
                    AlertBox().priceDialogueBox(
                        baseName[0],
                        selectedCanSize.toString().isEmpty ||selectedCanSize==0.0?passedCanSize:selectedCanSize,
                        rValue,
                        gValue,
                        bValue,
                        cylinder,
                        calculatedCylinderVolume,
                        unitPrice,
                        context
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary:ChooseColor(0).buttonColor,
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
