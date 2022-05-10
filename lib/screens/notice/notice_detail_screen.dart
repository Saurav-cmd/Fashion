import 'package:fashion_paints/screens/notice/notice_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors/colors_file.dart';
class NoticeDetails extends StatefulWidget {
  const NoticeDetails({Key,
    @required this.title,
    @required this.date,
    @required this.details,
    @required this.image,

    key}) : super(key: key);
  final String ?title;
  final String ?date;
  final String ?details;
  final List ?image;

  @override
  _NoticeDetailsState createState() => _NoticeDetailsState();
}

class _NoticeDetailsState extends State<NoticeDetails> {
  String ?faTitle;
  String ?faDate;
  String ?faDetails;
  List ?faImages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    faTitle =widget.title;
    faDate =widget.date;
    faDetails=widget.details;
    faImages =widget.image;
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    print('faImage$faImages');

    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1, // For iOS (dark icons)
            statusBarIconBrightness: Brightness.light),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0xff443F77),
        title: const Text(
          'Notice Details',
          style: TextStyle(color: Colors.white),
        ),
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
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: size.width*0.030,vertical: size.height*0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                        SizedBox(width: 140,
                            child: Text(faTitle.toString(),style: const TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w500),)),
                        Text( faDate.toString(),style: TextStyle(fontSize: 12,color: Colors.grey.shade500),),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(faDetails.toString(),style: TextStyle(color: Colors.grey.shade600,fontSize: 14),),
                    const SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('IMAGES',style: TextStyle(fontSize: 16,color: ChooseColor(0).appBarColor1,fontWeight: FontWeight.w600),),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 12,


              children: [
                ...faImages!.map((e) =>







                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(


                        //  margin: EdgeInsets.only(right: 15,bottom: 15),
                        child: InkWell(
                          onTap: (){
                            // print('99999${e}');
                            // print('7777${imageLinkSplit[imageNameSplit.indexOf(e)]}');
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoticeImage(
                              Image: e,


                              //imageShik: e,


                              //]
                            )));
                          },
                          child: Container(

                            color:Colors.black12,

                            padding: const EdgeInsets.only(
                                left: 2.0, bottom: 2.0),

                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 25,
                                    width: 80,
                                    color:Colors.black26,
                                    child: Center(
                                      child: Text(e.toString().trimRight().substring(8),style: const TextStyle(fontSize: 9,color: Colors.white),
                                      ),
                                    )

                                ),


                              ],
                            ),
                          ),
                        ),
                        height: 100,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(4),
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(e))),
                      ),
                    )).toList(),
              ],
            ),
            // GestureDetector(
            //   onTap: (){
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoticeImage(Image: "https://www.californiapaints.com/wp-content/uploads/Painting-Basics.jpg",
            //     )));
            //   },
            //   child: Container(
            //     height: 90,
            //     width: 90,
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         fit: BoxFit.fill,
            //         image: NetworkImage("https://www.californiapaints.com/wp-content/uploads/Painting-Basics.jpg")
            //       )
            //     ),
            //   ),
            // )



          ],
        ),
      ),
    );
  }
}
