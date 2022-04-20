import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/static_testing_list/notification_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class DealerNotificationScreen extends StatefulWidget {
  const DealerNotificationScreen({Key ?key}) : super(key: key);

  @override
  _DealerNotificationScreenState createState() => _DealerNotificationScreenState();
}

class _DealerNotificationScreenState extends State<DealerNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:ChooseColor(0).appBarColor1, // For iOS (dark icons)
            statusBarIconBrightness: Brightness.dark
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios,size:15,color: Colors.white,),
              onPressed: () {
                Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor:ChooseColor(0).appBarColor1,
        title: const Text('Notification',style: TextStyle(color: Colors.white),),
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
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: size.width*0.030,vertical: size.height*0.020),
          child: Column(
            children:  [
              const Text('Notification of all the events and notices are listed here.',style: TextStyle(fontSize: 13),),
              const SizedBox(
                height: 15,
              ),
              ...notificationList.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.all(Radius.circular(10.0)),



                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 20,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 210,
                                child: Text('${e['title']}',style: const TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w500),)),
                            Text('${e['date']}',style: TextStyle(fontSize: 12,color: Colors.grey.shade500),),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('${e['desc']}',style: TextStyle(color: Colors.grey.shade600,fontSize: 14),),
                        const SizedBox(
                          height: 10,
                        ),

                      ],
                    ),
                  ),
                ),
              )).toList()


            ],
          ),
        ),
      ),
    );
  }
}
