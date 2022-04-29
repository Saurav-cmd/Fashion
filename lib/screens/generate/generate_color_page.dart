import 'dart:ffi';

import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/models/database_models/colorant_database_model.dart';
import 'package:fashion_paints/models/database_models/doubled_fencee_database_%20model.dart';
import 'package:fashion_paints/models/database_models/shade_color_database_model.dart';
import 'package:fashion_paints/screens/generate/product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Utils/contants.dart';
import '../../colors/colors_file.dart';


class GenerateColorScreen extends StatefulWidget {
  GenerateColorScreen({Key,this.colorName,this.productName,this.canSize,this.base,this.colorants,this.fanDeckName,key}) : super(key: key);

  String? colorName;
  String? productName;
  String? canSize;
  double? base;
  String? colorants;
  String? fanDeckName;
  @override
  State<GenerateColorScreen> createState() => _GenerateColorScreenState();
}

class _GenerateColorScreenState extends State<GenerateColorScreen> {
  String? passedColorName;
  String? passedProductName;
  String? passedCanSize;
  double? passedBase;
  String? passedColorants;
  String? passedFanDeckName;
  double? fanDeckId;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedColorName = widget.colorName;
    passedProductName = widget.productName;
    passedCanSize = widget.canSize;
    passedBase = widget.base;
    passedColorants = widget.colorants;
    passedFanDeckName = widget.fanDeckName;
    grabFanDeckId();

  }

  getDouble(String? value){
    double d =double.parse(value!);
    print(d);
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
  List<String?> cylinder = [];
  List<String?> cylinderVolume = [];
  getBaseName()async{
    List<DoubleDefenceee?> doubleDefence= await DatabaseHelper.instance.queryDoubleDefence(passedProductName, fanDeckId, passedColorName);
    double? baseId = doubleDefence[0]!.base;
    final baseColorData = await DatabaseHelper.instance.getColorBaseData();
      for(int j=0;j<baseColorData.length;j++){
        if( baseId == baseColorData[j].bId){
          setState(() {
            baseName.add(baseColorData[j].base);
          });
        }
    }

    if(getDouble(doubleDefence[0]?.fT)>0.0){
      cylinder.add("FT");
      cylinderVolume.add(doubleDefence[0]!.fT);
    }
    if(getDouble(doubleDefence[0]?.kS)>0){
      cylinder.add("KS");
      cylinderVolume.add(doubleDefence[0]!.kS);
    }
    if(getDouble(doubleDefence[0]?.lS)>0){
      cylinder.add("LS");
      cylinderVolume.add(doubleDefence[0]!.lS);
    }
    if(getDouble(doubleDefence[0]?.lT)>0){
      cylinder.add("LT");
      cylinderVolume.add(doubleDefence[0]!.lT);
    }
    if(getDouble(doubleDefence[0]?.mM)>0){
      cylinder.add("MM");
      cylinderVolume.add(doubleDefence[0]!.mM);
    } if(getDouble(doubleDefence[0]?.mS)>0){
      cylinder.add("MS");
      cylinderVolume.add(doubleDefence[0]!.mS);
    } if(getDouble(doubleDefence[0]?.mT)>0){
      cylinder.add("MT");
      cylinderVolume.add(doubleDefence[0]!.mT);
    }
    if(getDouble(doubleDefence[0]?.pP)>0){
      cylinder.add("PP");
      cylinderVolume.add(doubleDefence[0]!.pP);
    }
    if(getDouble(doubleDefence[0]?.rS)>0){
      cylinder.add("RS");
      cylinderVolume.add(doubleDefence[0]!.rS);
    }
    if(getDouble(doubleDefence[0]?.rT)>0){
      cylinder.add("RT");
      cylinderVolume.add(doubleDefence[0]!.rT);
    }
    if(getDouble(doubleDefence[0]?.sT)>0){
      cylinder.add("ST");
      cylinderVolume.add(doubleDefence[0]!.sT);
    }
    if(getDouble(doubleDefence[0]?.tT)>0){
      cylinder.add("TT");
      cylinderVolume.add(doubleDefence[0]!.tT);
    } if(getDouble(doubleDefence[0]?.uS)>0){
      cylinder.add("US");
      cylinderVolume.add(doubleDefence[0]!.uS);
    } if(getDouble(doubleDefence[0]?.vT)>0){
      cylinder.add("VT");
      cylinderVolume.add(doubleDefence[0]!.vT);
    } if(getDouble(doubleDefence[0]?.xT)>0){
      cylinder.add("XT");
      cylinderVolume.add(doubleDefence[0]!.xT);
    }
    if(getDouble(doubleDefence[0]?.zT)>0){
      cylinder.add("ZT");
      cylinderVolume.add(doubleDefence[0]!.zT);
    }
    setState(() {
      getColorants();
    });
  }

  List<int> rValue = [];
  List<int> gValue = [];
  List<int> bValue = [];
  //yo colorants table lai query garaya ko bata data tanne function bana ko ho
  getColorants()async{
    for(int i=0;i<cylinder.length;i++){
      List<Colorants> colorantsData =await DatabaseHelper.instance.queryColorantsColor(cylinder[i]);
      if(colorantsData.isNotEmpty) {
        colorantsData.forEach((e) {
          if (e.rValue != null && e.gValue != null && e.bValue != null) {
            setState(() {
              rValue.add(e.rValue!.toInt());
              gValue.add(e.gValue!.toInt());
              bValue.add(e.bValue!.toInt());
            });
          }else{
            return;
          }
        });
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
  String? selectedContainer;
  String? selectedCanSize;

  double? height1 =100;
  int? height2;
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
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(fanDeckName: passedFanDeckName,productName: passedProductName,)));
          },
          icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Formula"),
        actions: [
          IconButton(onPressed:(){
          }, icon:const Icon(Icons.bookmark)),

          IconButton(onPressed:(){

          }, icon:const Icon(Icons.star_border)),

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
                                  color:Color.fromRGBO(singleRValue, singleGValue, singleBValue, 1), duration: Duration(seconds: 1),
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
                '${baseName}  $passedCanSize',
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
                    itemCount: cylinder.length,
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
                            height:100 ,
                            width: 70,
                            color:Colors.grey.shade300,
                          ),
                          SizedBox(
                            child:Container(
                              height:double.parse(cylinderVolume[i]!),
                              width:70,
                              color:Color.fromRGBO(rValue[i], gValue[i], bValue[i], 3),),
                            ),
                        ],
                      ),
                      Text(cylinder[i]!),
                      Text("${cylinderVolume[i]!} ML"),
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
                          selectedCanSize="1 Ltr";
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
                          selectedCanSize = "4 Ltr";
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
                          selectedCanSize = "10 Ltr";
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
                          selectedCanSize = "20 Ltr";
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
                          selectedCanSize = "1 Kg";
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
                          selectedCanSize = "5 Kg";
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
                          selectedCanSize = "10 Kg";
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
                          selectedCanSize = "20 Kg";
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
                  onPressed: ()async{},
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
