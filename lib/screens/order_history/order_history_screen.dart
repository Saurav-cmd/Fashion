import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/static_testing_list/cancel_order.dart';
import 'package:fashion_paints/static_testing_list/review_order.dart';
import 'package:fashion_paints/static_testing_list/under_process_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OrderHistory extends StatefulWidget {
  const OrderHistory({Key ?key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:ChooseColor(0).appBarColor1, // For iOS (dark icons)
            statusBarIconBrightness: Brightness.light
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios,size:15,color: Colors.white,),
              onPressed: () {
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor:ChooseColor(0).appBarColor1,
        title: const Text('Order History',style: TextStyle(color: Colors.white),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
                    }),
              ],
            ),
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...cancelOrder.map((e) =>Padding(
              padding:EdgeInsets.symmetric(horizontal: size.width*0.030,vertical: size.height*0.020),
              child: Container(
                height: 160,
                width: double.infinity,

                child: InkWell(
                  onTap: (){
                  },
                  child: Card(
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 60,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Order id',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.black54),),
                              Text('${e['date']}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black45),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,top: 5),
                          child: Text('${e['orderId']}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 35,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('item',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.black54),),
                              SizedBox(width: 175,),
                              Text('Price',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black45),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 35,top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text('${e['item']}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),),
                              ),
                              Text('Rs.${e['Price']}', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),)
                            ],
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:10.0,top: 10),
                          child: Row(
                            children: [
                              Icon(Icons.radio_button_checked,color: Colors.red,size: 15,),
                              SizedBox(width: 10,),
                              Text('Canceled by customer',style: TextStyle(fontSize: 12,color: Colors.red),)
                            ],
                          ),
                        )

                      ],
                    ),


                  ),
                ),
              ),
            )
            ).toList(),

            ...reviewedOrder.map((e) =>Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10),
              child: Container(
                height: 160,
                width: double.infinity,

                child: InkWell(
                  onTap: (){
                  },
                  child: Card(
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 60,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Order id',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.black54),),
                              Text('${e['date']}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black45),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,top: 5),
                          child: Text('${e['orderId']}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 35,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('item',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.black54),),
                              SizedBox(width: 175,),
                              Text('Price',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black45),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 35,top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text('${e['item']}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),),
                              ),
                              Text('Rs.${e['Price']}', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),)
                            ],
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:10.0,top: 10),
                          child: Row(
                            children: [
                              Icon(Icons.radio_button_checked,color: Colors.orange.shade400,size: 15,),
                              SizedBox(width: 10,),
                              Text('This order is yet to be reviewed',style: TextStyle(fontSize: 12,color: Colors.orange.shade400),)
                            ],
                          ),
                        )

                      ],
                    ),


                  ),
                ),
              ),
            )
            ).toList(),
            ...underProcess.map((e) =>Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10),
              child: Container(
                height: 160,
                width: double.infinity,

                child: InkWell(
                  onTap: (){
                  },
                  child: Card(
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 60,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Order id',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.black54),),
                              Text('${e['date']}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black45),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,top: 5),
                          child: Text('${e['orderId']}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 35,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('item',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.black54),),
                              SizedBox(width: 175,),
                              Text('Price',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black45),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 35,top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text('${e['item']}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),),
                              ),
                              Text('Rs.${e['Price']}', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontSize: 18),)
                            ],
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:10.0,top: 10),
                          child: Row(
                            children: [
                              Icon(Icons.radio_button_checked,color: Color(0xff046C98),size: 15,),
                              SizedBox(width: 10,),
                              Text('Under process',style: TextStyle(fontSize: 12,color: Color(0xff046C98)),)
                            ],
                          ),
                        )

                      ],
                    ),


                  ),
                ),
              ),
            )
            ).toList()




          ],
        ),
      ),
    );
  }
}
