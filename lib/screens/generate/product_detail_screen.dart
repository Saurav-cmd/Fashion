import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/models/database_models/doubled_fencee_database_%20model.dart';
import 'package:fashion_paints/screens/generate/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../fandeck_id/fandeck_name_id.dart';
import 'generate_color_page.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key,
    this.productName,
    this.fanDeckName,
    this.emulsionOrDistemper,
    key}) : super(key: key);
  String? productName;
  String? fanDeckName;
  String? emulsionOrDistemper;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? passedProductName;
  double? fanDeckId;
  String? passedFanDeckName;
  String? passedEmulsionOrDistemper;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController colorController = TextEditingController();

  int clickedItemPosition = 0;

  grabFanDeckId(){
    //yo id maila fandeck_id directory vhitra fandeck_name_id.dart vhitra statically id haru save garaya ra rakhaya ko xu tai tanaya ho
    fanDeckId = FanDeckNameId().fanDeckNameToId(passedFanDeckName);
  }

  List<DoubleDefenceee> databaseDataList = [];
  filterDatabaseData()async{
    final databaseData =await DatabaseHelper.instance.getDoubleFenceeData();
    for(int i=0;i<databaseData.length;i++){
      if(databaseData[i].fanDeck == fanDeckId){
        setState(() {
          databaseDataList.add(databaseData[i]);
        });
      }
    }
    allColorCode();
  }

  List<String?> allColorCodeList = [];
  allColorCode(){
    for(int i=0;i<databaseDataList.length;i++){
      if(databaseDataList[i].colorCode==databaseDataList[i].colorName){
        allColorCodeList.add(databaseDataList[i].colorName);
      }else{
        allColorCodeList.add(databaseDataList[i].colorName!+"("+databaseDataList[i].colorCode!+")");
      }
    }
  }

  List<String?> searchedList = [];
  searchTextFormFieldData(String? textData){
    print("This is text data $textData");
    print("This is all color code list $allColorCodeList");
    for(int i=0;i<allColorCodeList.length;i++){
      if(allColorCodeList[i] == textData){
        searchedList.addAll(allColorCodeList);
      }
      print("this is search list $searchedList");
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedProductName = widget.productName;
    passedFanDeckName = widget.fanDeckName;
    passedEmulsionOrDistemper = widget.emulsionOrDistemper;
    grabFanDeckId();
    filterDatabaseData();
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
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>ProductScreen(fanDeckName: passedFanDeckName)));
            },
            icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
          ),
          backgroundColor: ChooseColor(0).appBarColor1,
          title: const Text("Colour Selection"),
          actions: [
            IconButton(onPressed:(){
              Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
            }, icon:const Icon(Icons.home))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: size.width*0.030,vertical: size.height*0.020),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Select colour and can size"),
                SizedBox(height: size.height*0.020),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height*0.010),
                        Text("Fandeck",style: TextStyle(fontSize: size.height*0.010+size.width*0.010),),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children:[
                            SizedBox(
                                width: 210,
                                child: Text(
                                  '$passedFanDeckName',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: size.height*0.012+size.width*0.012,
                                      fontWeight: FontWeight.w500),
                                )),

                            const Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'icons/generate (1).png',
                              ),
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                        Text("Product",style: TextStyle(fontSize: size.height*0.010+size.width*0.010),),
                        SizedBox(height: size.height*0.010),
                        Text(
                          '$passedProductName',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.height*0.011+size.width*0.011,fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.020),
                Text("Colour Code/Name",style: TextStyle(fontSize: size.height*0.010+size.width*0.010,color: ChooseColor(0).appBarColor1,fontWeight: FontWeight.bold),),
                SizedBox(height: size.height*0.010),
                Form(
                  key: _form,
                  child: TextFormField(
                    onChanged: (text){
                      searchTextFormFieldData(text);
                    },
                    textAlign: TextAlign.start,
                    decoration:  InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: size.height*0.001,horizontal: size.width*0.030),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red,width: 1),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText:'Colour Code/Name',
                      hintStyle:TextStyle(fontSize: size.height*0.012+size.width*0.012,color: Colors.black26),
                    ),
                    controller:colorController,
                  ),
                ),

                SizedBox(height: size.height*0.020),
                Text("Can Size:",style: TextStyle(fontSize: size.height*0.010+size.width*0.010,color: ChooseColor(0).appBarColor1,fontWeight: FontWeight.bold),),
                SizedBox(
                  height:100,
                  width: double.infinity,
                  child: GridView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                      ), itemBuilder: (ctx,i){
                    return GestureDetector(
                      onTap:() => setState(() => clickedItemPosition = i),
                      child: Card(
                        color:clickedItemPosition==i?ChooseColor(0).appBarColor1:Colors.transparent,
                        child:const Center(child: Text("1 Litre",style: TextStyle(color: Colors.white),)),
                      ),
                    );
                  }
                  ),
                ),
                SizedBox(height: size.height*0.020),
                ConstrainedBox(
                  constraints:BoxConstraints.tightFor(width: double.infinity,height:size.height*0.055),
                  child: ElevatedButton(
                    child:Text('Generate',maxLines: 1,style: TextStyle(fontSize:size.height*0.014+size.width*0.014),),
                    onPressed: ()async{
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>const GenerateColorScreen()));
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

