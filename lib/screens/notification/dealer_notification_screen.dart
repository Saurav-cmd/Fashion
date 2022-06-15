import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/notice_log_controller.dart';
import 'dealer_notification_pdf_screen.dart';

class DealerNotificationScreen extends StatefulWidget {
  const DealerNotificationScreen({Key? key}) : super(key: key);

  @override
  _DealerNotificationScreenState createState() =>
      _DealerNotificationScreenState();
}

class _DealerNotificationScreenState extends State<DealerNotificationScreen> {
  NoticeLogController nLC = Get.put(NoticeLogController());

  fetchApiData() async {
    await nLC.getNoticeLogData(context).whenComplete(() {
      nLC.noticeLogData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchApiData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ChooseColor(0).bodyBackgroundColor,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:
                  ChooseColor(0).appBarColor1, // For iOS (dark icons)
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
                  // Navigator.of(context)
                  //     .pushReplacementNamed("Dealer_button_Navigation_Bar");
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          elevation: 0,
          backgroundColor: ChooseColor(0).appBarColor1,
          title: const Text(
            'Notification List',
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
                        Navigator.of(context)
                            .pushNamed("Dealer_button_Navigation_Bar");
                      }),
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.020, horizontal: size.width * 0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notification of all the events and notices are listed here.",
                style: TextStyle(color: ChooseColor(0).appBarColor1),
              ),
              Obx(() {
                if (nLC.isLoading.value) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.3,
                        left: size.width * 0.1,
                        right: size.width * 0.1),
                    child: Card(
                        child: Center(
                            child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.height * 0.008 + size.width * 0.008,
                              top: size.height * 0.008 + size.width * 0.008,
                              bottom: size.height * 0.008 + size.width * 0.008),
                          child: CircularProgressIndicator(
                            color: ChooseColor(0).appBarColor1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.030,
                          ),
                          child: SizedBox(
                              width: size.width * 0.5,
                              child: const Text(
                                "Fetching notification list please wait...",
                                overflow: TextOverflow.clip,
                              )),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        )
                      ],
                    ))),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: nLC.noticeLogData!.length,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.015),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => DealerNotificationPdf()));
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: 210,
                                              child: Text(
                                                '${nLC.noticeLogData![i].title}',
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          Text(
                                            '${nLC.noticeLogData![i].date.toString().split(" ")[0]}',
                                            style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.020,
                                      ),
                                      Text(
                                        '${nLC.noticeLogData![i].notice}',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
              }),
            ],
          ),
        ));
  }
}
