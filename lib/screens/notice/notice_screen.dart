import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/static_testing_list/tab_bar_notice.dart';
import 'package:flutter/material.dart';

class NoticeHomeScreen extends StatefulWidget {
  const NoticeHomeScreen({Key? key}) : super(key: key);

  @override
  _NoticeHomeScreenState createState() => _NoticeHomeScreenState();
}

class _NoticeHomeScreenState extends State<NoticeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor:ChooseColor(0).bodyBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: size.width*0.030,vertical: size.height*0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text('Notices',style:TextStyle(color: Color(0xff4C488C),fontSize: 18,fontWeight: FontWeight.w600),),
              const SizedBox(
                height: 10,
              ),
              const Text('Recent notices from Fashion color studio.'),
              const SizedBox(height: 10,),
              ...tapBarNotice.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 20,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 80,
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
    ));
  }
}
//notice testing
//for commit
