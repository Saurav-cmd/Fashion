import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/statement_controller.dart';
import 'package:fashion_paints/screens/statement/statement_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/local_notification.dart';

class DealerHomePage extends StatefulWidget {
  const DealerHomePage({Key? key}) : super(key: key);

  @override
  State<DealerHomePage> createState() => _DealerHomePageState();
}

class _DealerHomePageState extends State<DealerHomePage> {
  StatementController sC = Get.put(StatementController());
  int? dueAmount;
  int? chequeInHand;
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFcm();
    listenFcm();
    requestPermission();
    initialMessage();
    onAppBackground();
    getSharedPreferenceData();
  }

  final List<String> imageList = [
    'https://static9.depositphotos.com/1167801/1083/i/600/depositphotos_10837356-stock-photo-paint-dripping.jpg',
    'https://www.californiapaints.com/wp-content/uploads/Painting-Basics.jpg',
  ];

  getSharedPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      setState(() {
        dueAmount = jsonDecode(userData)['due_amount'];
        chequeInHand = jsonDecode(userData)['cheque_in_hand'];
      });
    }
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void initialMessage() async {
    LocalNotificationService.initialize(context);
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        print("this is message $message");
        final routeFromMessage = message.data["flag"];
        print("This is notification message initial $routeFromMessage");
        print("This is notification message initial $message");
        if (routeFromMessage == "pricelist") {
          Get.toNamed("Price_List_screen", preventDuplicates: true);
        } else if (routeFromMessage == "scheme") {
          Get.toNamed("Scheme_List_screen", preventDuplicates: true);
        } else if (routeFromMessage == "ledger") {
          Get.toNamed("Statement_screen", preventDuplicates: true);
        } else if (routeFromMessage == "notice") {
          Get.toNamed("Notices_screen", preventDuplicates: true);
        } else if (routeFromMessage == "chat") {
          Get.toNamed("Message_screen", preventDuplicates: true);
        } else if (routeFromMessage == "chequeAndDue") {
          Get.toNamed("Profile_screen", preventDuplicates: true);
        } else if (routeFromMessage == "order") {
          Get.toNamed("Order_history_screen", preventDuplicates: true);
        } else if (routeFromMessage == "product") {
          Get.toNamed("store_screen", preventDuplicates: true);
        }
      }
      if (message == null) {
        print("No Notification to show");
      }
    });
  }

  void listenFcm() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              enableVibration: true,
              enableLights: true,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
      LocalNotificationService.display(message);
    });
  }

  void loadFcm() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  void onAppBackground() async {
    //this will comes in play when app is in background running and user taps on that notification and user is redirected to particular route
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      final routeFromMessage = message.data["flag"];
      // RemoteNotification? notification = message.notification;
      print("This is routeFromMessage background $message");
      print("This is routeFromMessage background $routeFromMessage");
      if (message.notification != null) {
        if (routeFromMessage == "pricelist") {
          Get.toNamed("Price_List_screen", preventDuplicates: true);
        } else if (routeFromMessage == "scheme") {
          Get.toNamed("Scheme_List_screen", preventDuplicates: true);
        } else if (routeFromMessage == "ledger") {
          Get.toNamed("Statement_screen", preventDuplicates: true);
        } else if (routeFromMessage == "notice") {
          Get.toNamed("Notices_screen", preventDuplicates: true);
        } else if (routeFromMessage == "chat") {
          Get.toNamed("Message_screen", preventDuplicates: true);
        } else if (routeFromMessage == "chequeAndDue") {
          Get.toNamed("Profile_screen", preventDuplicates: true);
        } else if (routeFromMessage == "order") {
          Get.toNamed("Order_history_screen", preventDuplicates: true);
        } else if (routeFromMessage == "product") {
          Get.toNamed("store_screen", preventDuplicates: true);
        }
      }
    });
  }

  void showSnackBar() {
    final size = MediaQuery.of(context).size;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Press again to close app!',
        maxLines: 2,
        style: TextStyle(fontSize: size.height * 0.011 + size.width * 0.011),
        textAlign: TextAlign.center,
      ),
      duration: const Duration(milliseconds: 600),
      backgroundColor: Colors.grey.shade700,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ));
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    SystemNavigator.pop();
  }

  DateTime oldTime = DateTime.now();
  DateTime newTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        newTime = DateTime.now();
        int difference = newTime.difference(oldTime).inMilliseconds;
        oldTime = newTime;
        if (difference < 1000) {
          hideSnackBar();
          return true;
        } else {
          showSnackBar();
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: ChooseColor(0).bodyBackgroundColor,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:
                  ChooseColor(0).appBarColor2, // For iOS (dark icons)
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: ChooseColor(0).appBarColor2,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed("Dealer_Notification_List_screen");
            },
            icon: const Icon(Icons.notifications),
            color: ChooseColor(0).appBarColor1,
          ),
          title: SizedBox(
              // height: size.height*0.050,
              width: size.width * 0.30,
              child: Image.asset(
                "icons/logo 2.png",
                fit: BoxFit.fill,
              )),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("Search_Screen");
              },
              icon: const Icon(Icons.search),
              color: ChooseColor(0).appBarColor1,
              iconSize: 30,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.030, vertical: size.height * 0.020),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: imageList
                      .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image.network(e, fit: BoxFit.cover),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: size.height * 0.3,
                    autoPlay: false,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                  ),
                ),
                SizedBox(height: size.height * 0.020),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: ChooseColor(0).buttonColor,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.030),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.020),
                            Text(
                              "Total Due Amount",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      size.height * 0.010 + size.width * 0.010),
                            ),
                            SizedBox(height: size.height * 0.005),
                            Text(
                              "Rs $dueAmount",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      size.height * 0.012 + size.width * 0.012),
                            ),
                            SizedBox(height: size.height * 0.010),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.030),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.020),
                            Text(
                              "N/A",
                              style: TextStyle(
                                  color: ChooseColor(0).appBarColor1,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      size.height * 0.010 + size.width * 0.010),
                            ),
                            SizedBox(height: size.height * 0.005),
                            Text(
                              "Cheque In Hand",
                              style: TextStyle(
                                  color: ChooseColor(0).appBarColor1,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      size.height * 0.012 + size.width * 0.012),
                            ),
                            SizedBox(height: size.height * 0.010),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size.width * 0.030),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: size.height * 0.020),
                            Text(
                              "N/A",
                              style: TextStyle(
                                  color: ChooseColor(0).appBarColor1,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      size.height * 0.010 + size.width * 0.010),
                            ),
                            SizedBox(height: size.height * 0.005),
                            Text(
                              "$chequeInHand",
                              style: TextStyle(
                                  color: ChooseColor(0).appBarColor1,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      size.height * 0.012 + size.width * 0.012),
                            ),
                            SizedBox(height: size.height * 0.010),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.020),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.005),
                  child: Text(
                    "Fashion Paints Menu",
                    style: TextStyle(
                        color: ChooseColor(0).appBarColor1,
                        fontWeight: FontWeight.w700,
                        fontSize: size.height * 0.012 + size.width * 0.012),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("Price_List_screen");
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: size.width <= 411.42857142857144 &&
                                    size.height <= 683.4285714285714
                                ? EdgeInsets.symmetric(
                                    horizontal: size.width * 0.038,
                                    vertical: size.height * 0.0095)
                                : EdgeInsets.symmetric(
                                    horizontal: size.width * 0.012,
                                    vertical: size.height * 0),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: size.height * 0.1,
                                    child: Image.asset("icons/price.png")),
                                SizedBox(height: size.height * 0.0),
                                Center(
                                    child: Text(
                                  "Price List",
                                  style: TextStyle(
                                      color: ChooseColor(0).appBarColor1,
                                      fontSize: size.height * 0.009 +
                                          size.width * 0.009),
                                )),
                                SizedBox(height: size.height * 0.010),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed("Bipana_Preview_screen");
                        },
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.010,
                                vertical: size.height * 0.010),
                            child: Column(
                              children: [
                                Image.asset(
                                    "icons/undraw_house_searching_re_stk8 (1) 1.png"),
                                SizedBox(height: size.height * 0.020),
                                Center(
                                    child: Text(
                                  "Bipana preview",
                                  style: TextStyle(
                                      color: ChooseColor(0).appBarColor1,
                                      fontSize: size.height * 0.009 +
                                          size.width * 0.009),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed("Search_Screen");
                        },
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.050,
                                vertical: size.height * 0.010),
                            child: Column(
                              children: [
                                Image.asset(
                                    "icons/undraw_searching_re_3ra9 1.png"),
                                SizedBox(height: size.height * 0.020),
                                Center(
                                    child: Text(
                                  "Search",
                                  style: TextStyle(
                                      color: ChooseColor(0).appBarColor1,
                                      fontSize: size.height * 0.009 +
                                          size.width * 0.009),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("Generate_screen");
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.045,
                                vertical: size.height * 0.010),
                            child: Column(
                              children: [
                                Image.asset("icons/generate.png"),
                                SizedBox(height: size.height * 0.020),
                                Center(
                                    child: Text(
                                  "Generate",
                                  style: TextStyle(
                                      color: ChooseColor(0).appBarColor1,
                                      fontSize: size.height * 0.009 +
                                          size.width * 0.009),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("Saved_screen");
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.020,
                                vertical: size.height * 0.010),
                            child: Column(
                              children: [
                                Image.asset("icons/saved.png"),
                                SizedBox(height: size.height * 0.020),
                                Center(
                                    child: Text(
                                  "Saved",
                                  style: TextStyle(
                                      color: ChooseColor(0).appBarColor1,
                                      fontSize: size.height * 0.009 +
                                          size.width * 0.009),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("Book_Marked_screen");
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.030,
                                vertical: size.height * 0.010),
                            child: Column(
                              children: [
                                Image.asset("icons/BookMark.png"),
                                SizedBox(height: size.height * 0.020),
                                Center(
                                    child: Text(
                                  "Bookmarked",
                                  style: TextStyle(
                                      color: ChooseColor(0).appBarColor1,
                                      fontSize: size.height * 0.009 +
                                          size.width * 0.009),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => StatementPdf()));
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.045,
                                vertical: size.height * 0.010),
                            child: Column(
                              children: [
                                Image.asset("icons/statment.png"),
                                SizedBox(height: size.height * 0.020),
                                Center(
                                    child: Text(
                                  "Statement",
                                  style: TextStyle(
                                      color: ChooseColor(0).appBarColor1,
                                      fontSize: size.height * 0.009 +
                                          size.width * 0.009),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("Scheme_List_screen");
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.030,
                                vertical: size.height * 0.010),
                            child: Column(
                              children: [
                                Image.asset("icons/scheme.png"),
                                SizedBox(height: size.height * 0.020),
                                Center(
                                    child: Text(
                                  "Scheme",
                                  style: TextStyle(
                                      color: ChooseColor(0).appBarColor1,
                                      fontSize: size.height * 0.009 +
                                          size.width * 0.009),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("Comments_screen");
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.037,
                                vertical: size.height * 0.010),
                            child: Column(
                              children: [
                                Image.asset("icons/comments.png"),
                                SizedBox(height: size.height * 0.020),
                                Center(
                                    child: Text(
                                  "Comments",
                                  style: TextStyle(
                                      color: ChooseColor(0).appBarColor1,
                                      fontSize: size.height * 0.009 +
                                          size.width * 0.009),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
