import 'dart:io';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../controllers/user_notification_controller.dart';
import '../../widgets/dilogue_box.dart';

class NoticeHomeScreen extends StatefulWidget {
  const NoticeHomeScreen({Key? key}) : super(key: key);

  @override
  _NoticeHomeScreenState createState() => _NoticeHomeScreenState();
}

class _NoticeHomeScreenState extends State<NoticeHomeScreen> {
  int currentPage = 1;
  UserNotificationController uNC = Get.put(UserNotificationController());
  ScrollController scrollController = ScrollController();
  int total = 5;
  var isLoading = false;
  int page = 1;

  fetchNotificationData() async {
    try {
      final result = await InternetAddress.lookup("example.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return await uNC.getUserNotificationData().whenComplete(() {
          uNC.notificationData;
        });
      }
    } on SocketException catch (_) {
      AlertBox().noWifiConnection(13, "", "", context);
    }
  }

  void pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (uNC.notificationData.length < total)) {
      setState(() {
        isLoading = true;
        page += 1;
        fetchNotificationData();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(pagination);
    fetchNotificationData();
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
                  Navigator.of(context)
                      .pushNamed("Dealer_button_Navigation_Bar");
                },
              );
            },
          ),
          elevation: 0,
          backgroundColor: ChooseColor(0).appBarColor1,
          title: const Text(
            'Notification',
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
                            .pushNamed("Button_Navigation_Bar");
                      }),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Obx(() {
              if (uNC.isLoading.value) {
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
                              "Fetching Notifications.....",
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
                      itemCount: uNC.notificationData.length,
                      itemBuilder: (ctx, i) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.020,
                              horizontal: size.width * 0.020),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 20, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 210,
                                          child: Text(
                                            '${uNC.notificationData[i]!.title}',
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          )),
                                      Text(
                                        DateFormat.yMd().format(uNC
                                            .notificationData[i]!.date!
                                            .toLocal()),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${uNC.notificationData[i]!.notice}',
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.020,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
            }),
          ],
        ));
  }
}
