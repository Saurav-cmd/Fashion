import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/models/database_models/doubled_fencee_database_%20model.dart';
import 'package:fashion_paints/screens/generate/product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../colors/colors_file.dart';
import '../../fandeck_id/fandeck_name_id.dart';

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
    getBaseName();
  }

  grabFanDeckId(){
    //yo id maila fandeck_id directory vhitra fandeck_name_id.dart vhitra statically id haru save garaya ra rakhaya ko xu tai tanaya ho
    fanDeckId = FanDeckNameId().fanDeckNameToId(passedFanDeckName);
  }

  List<String?> baseName = [];
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
    print("This is base Name :- $baseName");
  }

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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
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
                          Container(
                            height: 100,
                            width:50,
                            color: Colors.grey,
                          )
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
                '${baseName[0]}  $passedCanSize',
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

              SizedBox(
                height:100,
                width: double.infinity,
                child: GridView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                    ), itemBuilder: (ctx,i){
                  return const Card(
                      color:Colors.grey
                  );
                }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
