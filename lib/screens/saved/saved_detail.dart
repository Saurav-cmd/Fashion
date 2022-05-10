import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavedDetailPage extends StatefulWidget {
  SavedDetailPage({Key,this.customerName,this.customerAddress,this.contact,this.id,this.colorData,key}) : super(key: key);
  String?customerName;
  String?customerAddress;
  String?contact;
  int? id;
  List<ColorInfo>? colorData = [];
  @override
  State<SavedDetailPage> createState() => _SavedDetailPageState();
}

class _SavedDetailPageState extends State<SavedDetailPage> {
  String?passedCustomerName;
  String?passedCustomerAddress;
  String?passedContact;
  int?passedId;
  List<ColorInfo>? passedColorData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedCustomerName = widget.customerName;
    passedCustomerAddress = widget.customerAddress;
    passedContact = widget.contact;
    passedId = widget.id;
    passedColorData = widget.colorData;
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
            Navigator.of(context).pushReplacementNamed("Saved_screen");
          },
          icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Saved Detail"),
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
            Text("Name : $passedCustomerName ",style: TextStyle(fontSize: size.height*0.014+size.width*0.014,color: ChooseColor(0).appBarColor1),),
            SizedBox(height: size.height*0.015),
            Text("Address : $passedCustomerAddress ",style: TextStyle(fontSize: size.height*0.014+size.width*0.014,color: ChooseColor(0).appBarColor1),),
            SizedBox(height: size.height*0.015),
            Text("Contact : $passedContact ",style: TextStyle(fontSize: size.height*0.014+size.width*0.014,color: ChooseColor(0).appBarColor1),),
            SizedBox(height: size.height*0.035),

            Expanded(
                child:ListView.builder(
                  itemCount: passedColorData?.length,
                    itemBuilder:(ctx,i){
                      return Padding(
                        padding:EdgeInsets.symmetric(vertical: size.height*0.010),
                        child: Container(
                            decoration: BoxDecoration(
                            border: Border(
                            bottom: BorderSide(width:1.0, color: Colors.lightBlue.shade900),
                            )
                            ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${passedColorData![i].colorName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.012+size.width*0.012),),
                                  Text("${passedColorData![i].productName}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: size.height*0.010+size.width*0.010)),
                                  SizedBox(height: size.height*0.020),
                                  Text("${passedColorData![i].canSize} Ltr"),
                                ],
                              ),
                          Container(
                            height: size.height*0.050,
                            width: size.width*0.10,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(passedColorData![i].rValue!.toInt(),passedColorData![i].gValue!.toInt(),passedColorData![i].bValue!.toInt(),1),
                                boxShadow:const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 1.0,
                                  )
                                ]
                            ),
                          )
                            ],
                          ),
                        ),
                      );
                })
            )
          ],
        ),
      ),
    );
  }
}
