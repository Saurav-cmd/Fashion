import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../Utils/local_notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final List<String> imageList = [
    'https://static9.depositphotos.com/1167801/1083/i/600/depositphotos_10837356-stock-photo-paint-dripping.jpg',
    'https://www.californiapaints.com/wp-content/uploads/Painting-Basics.jpg',
  ];

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 600),
        margin: EdgeInsets.only(bottom: 0, right: 32, left: 32),
        content: Text('Tap back button again to exit'),
      ),
    );
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  DateTime oldTime = DateTime.now();
  DateTime newTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*loadFcm();
    listenFcm();
    requestPermission();
    initialMessage();
    onAppBackground();*/
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
        final routeFromMessage = message.data["flag"];
        print("This is notification message initital $routeFromMessage");
        print("This is notification message initital $message");
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
          title: SizedBox(
              // height: size.height*0.050,
              width: size.width * 0.30,
              child: Image.asset(
                "icons/logo 2.png",
                fit: BoxFit.fill,
              )),
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
                    borderRadius: BorderRadius.circular(10),
                    color: ChooseColor(0).buttonColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.030),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Products",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize:
                                      size.height * 0.012 + size.width * 0.012),
                            ),
                            SizedBox(height: size.height * 0.020),
                            Text(
                              "Explore our wide range of",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize:
                                      size.height * 0.012 + size.width * 0.012),
                            ),
                            Text(
                              "products",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize:
                                      size.height * 0.012 + size.width * 0.012),
                            )
                          ],
                        ),
                      ),
                      Image.asset("icons/smart 1.png")
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
                        Navigator.of(context)
                            .pushNamed("Color_Personality_screen");
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.010),
                            child: Column(
                              children: [
                                Image.asset("icons/Vector1.png"),
                                Center(
                                    child: Text(
                                  "Color Personality",
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("Bipana_Preview_screen");
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.010,
                                vertical: size.height * 0.005),
                            child: Column(
                              children: [
                                Image.asset(
                                    "icons/undraw_house_searching_re_stk8 (1) 1.png"),
                                SizedBox(height: size.height * 0.045),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("Search_Screen");
                      },
                      child: SizedBox(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.050,
                                vertical: size.height * 0.005),
                            child: Column(
                              children: [
                                Image.asset(
                                    "icons/undraw_searching_re_3ra9 1.png"),
                                SizedBox(height: size.height * 0.045),
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("Find_Painter_Second_screen");
                  },
                  child: SizedBox(
                    height: 120,
                    width: 116,
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.010,
                            vertical: size.height * 0.010),
                        child: Column(
                          children: [
                            Image.asset(
                                "icons/undraw_people_search_re_5rre 1.png"),
                            SizedBox(height: size.height * 0.020),
                            Center(
                                child: Text(
                              "Find a painter",
                              style: TextStyle(
                                  color: ChooseColor(0).appBarColor1,
                                  fontSize:
                                      size.height * 0.009 + size.width * 0.009),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
