import 'dart:convert';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/auth_controller.dart';
import 'package:fashion_paints/screens/profile_screen/app_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthController aC = Get.put(AuthController());
  int? dueAmount;
  int? chequeInHand;
  int? orderLimit;
  String? name;
  String? address;
  getSharedPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      setState(() {
        dueAmount = jsonDecode(userData)['due_amount'];
        chequeInHand = jsonDecode(userData)['cheque_in_hand'];
        orderLimit = jsonDecode(userData)['order_limit'];
        name = jsonDecode(userData)['name'];
        address = jsonDecode(userData)['address'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPreferenceData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ChooseColor(0).bodyBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
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
                '$name',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              Text(
                '($address)',
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
                          SizedBox(
                              width: 145,
                              child: Text(
                                'Rs $dueAmount',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              )),
                          Text(
                            '$chequeInHand',
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
                      Text(
                        'Rs $orderLimit',
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const AppInfo()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ChooseColor(0).buttonColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0))),
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
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: ChooseColor(0).buttonColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0))),
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
                    aC.logout(context);
                    // DatabaseHelper.instance.cleanDatabase();
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
