import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavedDetailPage extends StatefulWidget {
  SavedDetailPage({Key,this.customerName,this.customerAddress,this.contact,key}) : super(key: key);
  String?customerName;
  String?customerAddress;
  String?contact;

  @override
  State<SavedDetailPage> createState() => _SavedDetailPageState();
}

class _SavedDetailPageState extends State<SavedDetailPage> {
  String?passedCustomerName;
  String?passedCustomerAddress;
  String?passedContact;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedCustomerName = widget.customerName;
    passedCustomerAddress = widget.customerAddress;
    passedContact = widget.contact;
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

          /*  Expanded(
                child:ListView.builder(
                    itemBuilder:(ctx,i){

                })
            )*/
          ],
        ),
      ),
    );
  }
}
