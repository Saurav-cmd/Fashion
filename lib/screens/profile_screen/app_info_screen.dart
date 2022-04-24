import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../colors/colors_file.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
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
                Navigator.pop(context);
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0xff443F77),
        title: const Text(
          'App info',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: Column(
            children: [
              Center(
                  child: Text(
                    'Fashion Colour Studio',
                    style: TextStyle(
                        color: ChooseColor(0).appBarColor1,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 5,
              ),
              const Text(
                '1.0.7',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'A product of Fashion Paints Pvt.Ltd',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              const SizedBox(
                height: 45,
              ),
              SizedBox(
                  width: size.width * 0.50,
                  child: Image.asset(
                    "icons/logo 2.png",
                    fit: BoxFit.fill,
                  )),
              const SizedBox(
                height: 45,
              ),
              Text(
                'Fashion Paints Pvt.Ltd',
                style:
                TextStyle(color: ChooseColor(0).appBarColor1, fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Balkumari, Lalitpur',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const Text(
                '+977-1-5816075',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "icons/facebook.png",
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    width: 45,
                  ),
                  SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "icons/web.png",
                        fit: BoxFit.fill,
                      )),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Developed by',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Bihani Tech',
                    style: TextStyle(fontSize: 12, color: Color(0xffE5BC3E)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
