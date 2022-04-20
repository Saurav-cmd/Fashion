import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/screens/notice/notice_screen.dart';
import 'package:fashion_paints/screens/notification/notification_screen.dart';
import 'package:fashion_paints/screens/order_history/order_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor:ChooseColor(0).bodyBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:ChooseColor(0).appBarColor2, // For iOS (dark icons)
              statusBarIconBrightness: Brightness.dark
          ),
          backgroundColor: ChooseColor(0).appBarColor2,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              const Center(
                  child: Icon(
                    Icons.account_circle,
                    size: 40,
                    color: Colors.black,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Bihani Tech',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Prashant Subedi',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              Text(
                '(Bharatpur)',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xff443F77),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Latest Updated:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'n/a',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Due Amount',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Text(
                            'Cheque in hand',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: 145,
                              child: const Text(
                                'Rs -33455.00',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )),
                          const Text(
                            'n/a',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Order Limit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'Rs -65487.00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Container(
                        decoration:BoxDecoration(
                            color: ChooseColor(0).buttonColor,
                            borderRadius:const BorderRadius.all(Radius.circular(5.0))),
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: const Center(
                          child: Text(
                            'App Info',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                  TextButton(
                      onPressed: (){
                      },
                      child: Container(
                        decoration:BoxDecoration(
                            color:ChooseColor(0).buttonColor,
                            borderRadius:const BorderRadius.all(Radius.circular(5.0))),
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: const Center(
                          child: Text(
                            'Update Price',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("Button_Navigation_Bar");
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffE34646),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    height: 45,
                    child: const Center(
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
