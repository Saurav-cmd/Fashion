import 'package:fashion_paints/screens/bipana_preview/bipana_preview.dart';
import 'package:fashion_paints/screens/bipana_preview/camera_screen.dart';
import 'package:fashion_paints/screens/bipana_preview/exterior_image_paint.dart';
import 'package:fashion_paints/screens/bipana_preview/exterior_images.dart';
import 'package:fashion_paints/screens/bipana_preview/gallery_screen.dart';
import 'package:fashion_paints/screens/bipana_preview/saved_screen.dart';
import 'package:fashion_paints/screens/book_marked/book_marked_screen.dart';
import 'package:fashion_paints/screens/button_navigation_bars/home_screen_button_navigation_bar.dart';
import 'package:fashion_paints/screens/color%20personality/color_personality_screen.dart';
import 'package:fashion_paints/screens/comments_screen.dart';
import 'package:fashion_paints/screens/find%20a%20painter/find_a_painter_second_screen.dart';
import 'package:fashion_paints/screens/generate/generate_screen.dart';
import 'package:fashion_paints/screens/home_screen.dart';
import 'package:fashion_paints/screens/notification/dealer_notification_screen.dart';
import 'package:fashion_paints/screens/notification/notification_screen.dart';
import 'package:fashion_paints/screens/order_history/order_history_screen.dart';
import 'package:fashion_paints/screens/price/price_list_screen.dart';
import 'package:fashion_paints/screens/saved/saved_screen.dart';
import 'package:fashion_paints/screens/scheme/scheme_list_screen.dart';
import 'package:fashion_paints/screens/search/color_name_screen.dart';
import 'package:fashion_paints/screens/search/search_screen.dart';
import 'package:fashion_paints/screens/splash_screen.dart';
import 'package:fashion_paints/screens/store/get_cart_data_screen.dart';
import 'package:fashion_paints/screens/store/store_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'screens/button_navigation_bars/dealer_home_screen_button_navigation_bar.dart';

final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();
Future<void> backgroundNotificationHandler(RemoteMessage message) async {}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundNotificationHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackBarKey,
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        "Home_page_screen": (ctx) => const HomePage(),
        "Button_Navigation_Bar": (ctx) => const BottomNavigation(),
        "Dealer_button_Navigation_Bar": (ctx) => const DealerBottomNavigation(),
        "Search_Screen": (ctx) => const SearchScreen(),
        "Bipana_Preview_screen": (ctx) => const BipanaPreviewScreen(),
        "Price_List_screen": (ctx) => PriceList(),
        "Scheme_List_screen": (ctx) => const SchemeList(),
        "Notification_List_screen": (ctx) => const NotificationScreen(),
        "Dealer_Notification_List_screen": (ctx) =>
            const DealerNotificationScreen(),
        "Order_history_screen": (ctx) => const OrderHistory(),
        "Comments_screen": (ctx) => const CommentsScreen(),
        "Saved_screen": (ctx) => SavedScreen(),
        "Gallery_screen": (ctx) => const GalleryScreen(),
        "Camera_screen": (ctx) => const CameraScreen(),
        "Color_screen": (ctx) => const ColorScreen(),
        "Color_Personality_screen": (ctx) => const ColorPersonality(),
        // "Find_Painter_screen": (ctx) => const FindPainter(),
        "Find_Painter_Second_screen": (ctx) => const PainterStatus(),
        "Generate_screen": (ctx) => const GenerateFirstScreen(),
        "Book_Marked_screen": (ctx) => const BookMarkedScreen(),
        "Cart_screen": (ctx) => const CartItem(),
        "store_screen": (ctx) => const StoreScreen(),
        "Exterior_screen": (ctx) => const ExteriorImages(),
        "Exterior_image_paint": (ctx) => ExteriorImagePaint(),
        "Bipana_Preview_Saved_Screen": (ctx) => const BipanPreviewSavedScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
