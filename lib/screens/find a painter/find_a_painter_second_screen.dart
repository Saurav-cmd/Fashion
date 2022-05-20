import 'dart:async';
import 'dart:io';

import 'package:fashion_paints/controllers/painter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../colors/colors_file.dart';
import '../../widgets/dilogue_box.dart';

class PainterStatus extends StatefulWidget {
  const PainterStatus({Key? key}) : super(key: key);

  @override
  _PainterStatusState createState() => _PainterStatusState();
}

class _PainterStatusState extends State<PainterStatus> {
  PainterController pC = Get.put(PainterController());
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  double? lat;
  double? long;
  late StreamSubscription<Position> positionStream;

  //permission check garya ko
  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  //location fetch garaya ko
  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    long = position.longitude;
    lat = position.latitude;

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 500,
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      long = position.longitude;
      lat = position.latitude;

      setState(() {
        //refresh UI on update
      });
    });
    fetchPainterData(lat, long);
  }

  Future<String?> fetchPainterData(double? latitude, double? longitude) async {
    try {
      final result = await InternetAddress.lookup("example.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print("There is wifi connection");
        await pC.findNearbyPainter(latitude, longitude).whenComplete(() {
          setState(() {
            pC.painterData;
          });
        });
      }
    } on SocketException catch (_) {
      AlertBox().noWifiConnection(context);
      print('not connected');
    }

    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkGps();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                Navigator.of(context).pushNamed("Button_Navigation_Bar");
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0xff443F77),
        title: const Text(
          'Find A Painter',
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
                      Navigator.of(context).pushNamed("Button_Navigation_Bar");
                    }),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: Column(
          children: [
            Obx(() {
              if (pC.isLoading.value) {
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
                              "Finding Painter.....",
                              overflow: TextOverflow.clip,
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      )
                    ],
                  ))),
                );
              }
              return ListView.builder(
                  itemCount: pC.painterData!.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 14.0, bottom: 14, left: 12),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage('images/painter.png'))),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        child: Text(
                                          '${pC.painterData![i].firstName} ${pC.painterData![i].lastName}',
                                          style: TextStyle(
                                              fontSize: size.height * 0.012 +
                                                  size.width * 0.012,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Status',
                                            style: TextStyle(
                                                fontSize: size.height * 0.012 +
                                                    size.width * 0.012,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.010,
                                          ),
                                          if (pC.painterData![i].status == 1)
                                            const Icon(
                                              Icons.radio_button_checked,
                                              color: Colors.green,
                                              size: 15,
                                            ),
                                          if (pC.painterData![i].status == 0)
                                            const Icon(
                                              Icons.radio_button_checked,
                                              color: Colors.red,
                                              size: 15,
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${pC.painterData![i].phone}',
                                  style: TextStyle(
                                      fontSize: size.height * 0.010 +
                                          size.width * 0.010,
                                      color: Colors.black87),
                                ),
                                Text(
                                  '${pC.painterData![i].address}',
                                  style: TextStyle(
                                      fontSize: size.height * 0.011 +
                                          size.width * 0.011,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    );
                  });
            })
          ],
        ),
      ),
    );
  }
}
