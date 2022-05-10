import 'package:fashion_paints/database/all_data_database.dart';
import 'package:fashion_paints/models/database_models/book_marked_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../colors/colors_file.dart';
import '../generate/generate_color_page.dart';

class BookMarkedScreen extends StatefulWidget {
  const BookMarkedScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkedScreen> createState() => _BookMarkedScreenState();
}

class _BookMarkedScreenState extends State<BookMarkedScreen> {

  List<BookMarked> bookMarkedDataList = [];
  getBookMarkedData()async{
    final bookMarkedData = await DatabaseHelper.instance.getBookMarkedData();
    for(var e in bookMarkedData){
      setState(() {
        bookMarkedDataList.add(e);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookMarkedData();
    DatabaseHelper;
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
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
        title: const Text("Bookmarks"),
        actions: [
          IconButton(onPressed:(){
            Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
          }, icon:const Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: size.width*0.030,vertical: size.height*0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recently bookmarked colors",style: TextStyle(color: ChooseColor(0).appBarColor1,fontSize:size.height*0.012+size.width*0.012),),
            SizedBox(height: size.height*0.020),
            Expanded(
              child: ListView.builder(
                physics:const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: bookMarkedDataList.length,
                  itemBuilder:(ctx,i){
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>GenerateColorScreen(
                          columnId: bookMarkedDataList[i].id,
                          colorName: bookMarkedDataList[i].colorName,
                          productName: bookMarkedDataList[i].productName,
                          canSize: bookMarkedDataList[i].canSize!.toDouble(),
                          fanDeckName: bookMarkedDataList[i].fandeckName,
                        )));
                      },
                      child: Container(
                        decoration:const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width:1.0, color: Colors.black),
                          ),
                        ),
                        child: Padding(
                          padding:EdgeInsets.symmetric(vertical: size.height*0.010),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${bookMarkedDataList[i].colorName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.012+size.width*0.012),),
                                  SizedBox(height: size.height*0.008),
                                  Text("${bookMarkedDataList[i].productName}"),
                                  SizedBox(height: size.height*0.008),
                                  Text("${bookMarkedDataList[i].fandeckName}"),
                                  SizedBox(height: size.height*0.008),
                                  Text("${bookMarkedDataList[i].canSize}"),
                                ],
                              ),

                              Padding(
                                padding:EdgeInsets.only(right: size.width*0.020),
                                child: Container(
                                  height: size.height*0.070,
                                  width: size.width*0.15,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(bookMarkedDataList[i].canColorR!.toInt(),bookMarkedDataList[i].canColorG!.toInt(), bookMarkedDataList[i].canColorB!.toInt(),1),
                                      boxShadow:const [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 1.0,
                                        )
                                      ]
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
