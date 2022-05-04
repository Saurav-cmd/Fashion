import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/widgets/dilogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/database_models/saved_model.dart';

class SavedScreen extends StatefulWidget {
  SavedScreen({Key,this.colorName,this.productName,this.canSize,this.rColor,this.gColor,this.bColor,this.fandeckId,key}) : super(key: key);
  String?colorName;
  String?productName;
  double?canSize;
  double?rColor;
  double?gColor;
  double?bColor;
  double?fandeckId;
  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  String?passedColorName;
  String?passedProductName;
  double?passedCanSize;
  double?passedRColor;
  double?passedGColor;
  double?passedBColor;
  double?passedFandeckId;
  TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedColorName = widget.colorName;
    passedProductName = widget.productName;
    passedCanSize = widget.canSize;
    passedRColor = widget.rColor;
    passedGColor = widget.gColor;
    passedBColor = widget.bColor;
    passedFandeckId = widget.fandeckId;
    getSavedData();

    searchController.addListener(() {
      _runFilter(searchController.value.text);
    });
  }

  List<Saved>savedDataList = [];
  getSavedData()async{
    final data = await DatabaseHelper.instance.getSavedData();
    for(var e in data){
      setState(() {
        savedDataList.add(e);
      });
    }
  }

  List<Saved> searchCustomer = [];
  void _runFilter(String enterKeyword){
    //  List<Map<String, dynamic>> results = [];
    List<Saved> results = [];

    if (enterKeyword.isEmpty){
      results = savedDataList;

    }
    else{
      results = savedDataList.where(
            (e) => (e.customerName!.toLowerCase().contains(enterKeyword.toLowerCase(),)),
      ).toList();
    }setState(() {
      searchCustomer = results;
    });

  }


  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:ChooseColor(0).appBarColor1,
          statusBarIconBrightness: Brightness.light// For iOS (dark icons)
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacementNamed("Dealer_button_Navigation_Bar");
          },
          icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Save"),
        actions: [
          IconButton(onPressed:(){
            Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
          }, icon:const Icon(Icons.home))
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width*0.040,vertical: size.height*0.015),
              child: Form(
                key: _form,
                child:TextFormField(
                  decoration:InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: size.height*0.001,horizontal: size.width*0.030),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red,width: 1),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    // labelText: 'Phone Number',
                    fillColor:const Color(0xffF6F9FA),
                    filled: true,
                    hintText: 'Search customer',
                    prefixIcon:const Icon(Icons.search),
                    hintStyle:TextStyle(fontSize: size.height*0.012+size.width*0.012,color: Colors.black26),
                  ),
                  controller: searchController,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width*0.040,vertical: size.height*0.020),
              child: ListView.builder(
                physics:const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: searchCustomer.length,
                itemBuilder:(ctx,i){
                  return GestureDetector(
                    onTap: (){
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${searchCustomer[i].customerName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.012+size.width*0.012),),
                            SizedBox(height: size.height*0.008),
                            Text("${searchCustomer[i].address}"),
                            SizedBox(height: size.height*0.008),
                            Text("${searchCustomer[i].contact}"),
                            SizedBox(height: size.height*0.008),
                            Divider(
                              color: Colors.black87,
                              thickness: size.width*0.005,
                            )
                          ],

                        ),

                        Padding(
                          padding:EdgeInsets.only(right: size.width*0.020),
                          child: Container(
                            height: size.height*0.050,
                            width: size.width*0.10,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(searchCustomer[i].rColor!.toInt(),searchCustomer[i].gColor!.toInt(),searchCustomer[i].bColor!.toInt(),1),
                                boxShadow:const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 1.0,
                                  )
                                ]
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            ),)
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () {
          AlertBox().addCustomerDialogueBox(passedColorName,passedProductName,passedCanSize,passedRColor,passedGColor,passedBColor,passedFandeckId,context);
        },
        backgroundColor:ChooseColor(0).buttonColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
