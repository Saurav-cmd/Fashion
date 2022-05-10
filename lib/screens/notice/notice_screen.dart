import 'package:connectivity/connectivity.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/notice_controller.dart';
import 'package:fashion_paints/static_testing_list/tab_bar_notice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

import '../../widgets/dilogue_box.dart';
import 'notice_detail_screen.dart';

class NoticeHomeScreen extends StatefulWidget {
  const NoticeHomeScreen({Key? key}) : super(key: key);

  @override
  _NoticeHomeScreenState createState() => _NoticeHomeScreenState();
}

class _NoticeHomeScreenState extends State<NoticeHomeScreen> {
  final NoticeController _noticeController = Get.put(NoticeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Connectivity().checkConnectivity().then((internetconnection) {
      if (internetconnection == ConnectivityResult.none) {
        AlertBox().forAddToCart(context);
      }
    });
    _noticeController.getAllNotices(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: ChooseColor(0).bodyBackgroundColor,
          body: Obx(() {
            if (_noticeController.isLoading.value) {
              return Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Column(
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        color: ChooseColor(0).appBarColor1,
                      ),
                    ),
                  ],
                ),
              );
            }
            if (_noticeController.noticeList.isEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                          'No Notice',
                          style: TextStyle(
                              fontSize: 20, color: ChooseColor(0).appBarColor1),
                        )),
                  ],
                ),
              );
            }


            else {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.030,
                      vertical: size.height * 0.020),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Notices',
                        style: TextStyle(
                            color: Color(0xff4C488C),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Recent notices from Fashion color studio.'),
                      const SizedBox(
                        height: 10,
                      ),
                      ..._noticeController.noticeList.map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GestureDetector(
                          onTap: () {
                            print('pdf links ${_noticeController.pdfLink.map((e) => e.active).toList()}');
                            print('image${e.noticeimage!.map((e) => e.file).toList()}');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NoticeDetails(
                                  title: e.title,
                                  date: NepaliDateFormat("d MMMM")
                                      .format(
                                      e.date!.toNepaliDateTime()),
                                  details: e.notice,
                                  image:e.noticeimage!.map((e) => e.file).toList()
                                  ,
                                )));
                          },
                          child: Container(
                            height: 90,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 20, right: 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width:200,
                                          child: Text(
                                            e.title!,
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.w500),
                                          )),
                                      Text(
                                        NepaliDateFormat("d MMMM").format(
                                            e.date!.toNepaliDateTime()),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "${e.notice!.length>60?e.notice!.substring(0,60)+'...':e.notice}",
                                    maxLines: 2,
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
                      ))
                          .toList()
                    ],
                  ),
                ),
              );
            }
          }),
        ));
  }
}
//notice testing
//for commit
