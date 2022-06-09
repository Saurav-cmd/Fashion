import 'dart:convert';
import 'dart:io';

import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/controllers/complaints_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/dilogue_box.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  //yo vhana ko feedback ko controller vhayo........................................
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  //ya samma ho hai feedback controller...........................................

  //yo vhana ko complaints controller................................................
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController complaintsController = TextEditingController();
  //ya samma matra ho hai compaints controller.....................................

  List<DropdownMenuItem<String>> reasonComplaintsItem = [
    const DropdownMenuItem(
        child: Text("Administration"), value: "Administration"),
    const DropdownMenuItem(child: Text("Account"), value: "Account"),
    const DropdownMenuItem(child: Text("Machine"), value: "Machine"),
  ];

  String reasonValue = "Administration";

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  String? fullName;
  String? emailAddress;
  String? phone;
  String? userCode;
  getUserIngo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    if (userData != null) {
      setState(() {
        fullName = jsonDecode(userData)['userName'];
        emailAddress = jsonDecode(userData)['email'];
        phone = jsonDecode(userData)['phone'];
        userCode = jsonDecode(userData)['userCode'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserIngo();
  }

  @override
  Widget build(BuildContext context) {
    double? appRating = 1;
    double? productRating = 1;
    double? serviceRating = 1;
    double? teamRating = 1;

    FeedbackAndComplaintController fBCC =
        Get.put(FeedbackAndComplaintController());

    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => fBCC.isLoading.value ? false : true,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ChooseColor(0).appBarColor1,
              statusBarIconBrightness: Brightness.light // For iOS (dark icons)
              ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed("Dealer_button_Navigation_Bar");
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white60,
            iconSize: 20,
          ),
          backgroundColor: ChooseColor(0).appBarColor1,
          title: const Text("Comments"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("Dealer_button_Navigation_Bar");
                },
                icon: const Icon(Icons.home))
          ],
        ),
        body: Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                        unselectedLabelColor: Colors.black45,
                        labelColor: ChooseColor(0).appBarColor1,
                        indicatorColor: ChooseColor(0).appBarColor1,
                        tabs: const [
                          Tab(
                            text: "Complaints",
                          ),
                          Tab(
                            text: "Feedback",
                          ),
                        ]),
                    SizedBox(
                      height: size.height * 0.050,
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                                color: ChooseColor(0).appBarColor1,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            child: Form(
                              key: _formKey1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.030,
                                    vertical: size.height * 0.020),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.001,
                                            horizontal: size.width * 0.030),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // labelText: 'Phone Number',
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Full Name',
                                        hintStyle: TextStyle(
                                            fontSize: size.height * 0.012 +
                                                size.width * 0.012,
                                            color: Colors.black26),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Your Enter Name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: fullNameController
                                        ..text = fullName.toString(),
                                    ),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "User Code",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.001,
                                            horizontal: size.width * 0.030),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // labelText: 'Phone Number',
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'User Code',
                                        hintStyle: TextStyle(
                                            fontSize: size.height * 0.012 +
                                                size.width * 0.012,
                                            color: Colors.black26),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter Your Email Address";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: emailAddressController
                                        ..text = userCode.toString(),
                                    ),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "Phone Number",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.001,
                                            horizontal: size.width * 0.030),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // labelText: 'Phone Number',
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Phone Number',
                                        hintStyle: TextStyle(
                                            fontSize: size.height * 0.012 +
                                                size.width * 0.012,
                                            color: Colors.black26),
                                      ),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10),
                                      ],
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Enter Your Phone Number";
                                        } else if (!value.startsWith("9")) {
                                          return "Please Enter an Valid Phone Number";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: phoneNumberController
                                        ..text = phone.toString(),
                                    ),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "Reason for Complaint",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    DropdownButtonFormField<String?>(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        validator: (value) => value == null
                                            ? "Select your reason for complaint"
                                            : null,
                                        dropdownColor: Colors.white,
                                        value: reasonValue,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            reasonValue = newValue!;
                                          });
                                        },
                                        items: reasonComplaintsItem),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "Complaint",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.005,
                                            horizontal: size.width * 0.030),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // labelText: 'Phone Number',
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Leave your complaint..',
                                        hintStyle: TextStyle(
                                            fontSize: size.height * 0.012 +
                                                size.width * 0.012,
                                            color: Colors.black26),
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      controller: complaintsController,
                                    ),
                                    SizedBox(height: size.height * 0.035),
                                    ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          width: double.infinity,
                                          height: size.height * 0.055),
                                      child: ElevatedButton(
                                        child: Text(
                                          'Submit',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: size.height * 0.014 +
                                                  size.width * 0.014),
                                        ),
                                        onPressed: () async {
                                          try {
                                            final result =
                                                await InternetAddress.lookup(
                                                    "example.com");
                                            if (result.isNotEmpty &&
                                                result[0]
                                                    .rawAddress
                                                    .isNotEmpty) {
                                              if (_formKey1.currentState !=
                                                      null &&
                                                  _formKey1.currentState!
                                                      .validate()) {
                                                if (reasonValue ==
                                                    "Administration") {
                                                  fBCC.postComplaintData(
                                                      fullName ??
                                                          nameController.text,
                                                      userCode ??
                                                          emailController.text,
                                                      phone ??
                                                          phoneController.text,
                                                      1,
                                                      complaintsController.text,
                                                      context);
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                } else if (reasonValue ==
                                                    "Account") {
                                                  fBCC.postComplaintData(
                                                      fullName ??
                                                          nameController.text,
                                                      userCode ??
                                                          emailController.text,
                                                      phone ??
                                                          phoneController.text,
                                                      2,
                                                      complaintsController.text,
                                                      context);
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                } else if (reasonValue ==
                                                    "Machine") {
                                                  fBCC.postComplaintData(
                                                      fullName ??
                                                          nameController.text,
                                                      userCode ??
                                                          emailController.text,
                                                      phone ??
                                                          phoneController.text,
                                                      3,
                                                      complaintsController.text,
                                                      context);
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                }
                                              }
                                            }
                                          } on SocketException catch (_) {
                                            AlertBox().noWifiConnection(
                                                2, "", "", context);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: ChooseColor(0).buttonColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.12)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        //second tab start from here.............................................................
                        SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                                color: ChooseColor(0).appBarColor1,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.030,
                                    vertical: size.height * 0.020),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.001,
                                            horizontal: size.width * 0.030),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // labelText: 'Phone Number',
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Full Name',
                                        hintStyle: TextStyle(
                                            fontSize: size.height * 0.012 +
                                                size.width * 0.012,
                                            color: Colors.black26),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Enter Your Name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: nameController
                                        ..text = fullName.toString(),
                                      readOnly: true,
                                    ),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "Email Address",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.001,
                                            horizontal: size.width * 0.030),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // labelText: 'Phone Number',
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Email Address',
                                        hintStyle: TextStyle(
                                            fontSize: size.height * 0.012 +
                                                size.width * 0.012,
                                            color: Colors.black26),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Enter Your Email Address";
                                        } else if (!value.contains("@")) {
                                          return "Please Enter a valid Email Address";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: emailController,
                                    ),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "Phone Number",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    TextFormField(
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.001,
                                              horizontal: size.width * 0.030),
                                          errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.red, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          // labelText: 'Phone Number',
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Phone Number',
                                          hintStyle: TextStyle(
                                              fontSize: size.height * 0.012 +
                                                  size.width * 0.012,
                                              color: Colors.black26),
                                        ),
                                        keyboardType: TextInputType.phone,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please Enter Your Phone Number";
                                          } else if (!value.startsWith("9")) {
                                            return "Please Enter an Valid Phone Number";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: phoneController
                                          ..text = phone.toString(),
                                        readOnly: true,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10),
                                        ]),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "How do you rate this app?",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    RatingBar.builder(
                                      minRating: 1,
                                      itemCount: 5,
                                      initialRating: 1,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        appRating = rating;
                                      },
                                    ),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "How do you rate our product?",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    RatingBar.builder(
                                      initialRating: 1,
                                      minRating: 1,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        productRating = rating;
                                      },
                                    ),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "How do you rate our service?",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    RatingBar.builder(
                                      initialRating: 1,
                                      minRating: 1,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        serviceRating = rating;
                                      },
                                    ),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "How do you rate our team?",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    RatingBar.builder(
                                      initialRating: 1,
                                      minRating: 1,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        teamRating = rating;
                                      },
                                    ),
                                    SizedBox(height: size.height * 0.020),
                                    Text(
                                      "Tell us how we can improve",
                                      style: TextStyle(
                                          fontSize: size.height * 0.009 +
                                              size.width * 0.009,
                                          color: Colors.white),
                                    ),
                                    SizedBox(height: size.height * 0.005),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.005,
                                            horizontal: size.width * 0.030),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        // labelText: 'Phone Number',
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: 'Leave your feedback..',
                                        hintStyle: TextStyle(
                                            fontSize: size.height * 0.012 +
                                                size.width * 0.012,
                                            color: Colors.black26),
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      controller: commentsController,
                                    ),
                                    SizedBox(height: size.height * 0.035),
                                    ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          width: double.infinity,
                                          height: size.height * 0.055),
                                      child: ElevatedButton(
                                        child: Text(
                                          'Submit',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: size.height * 0.014 +
                                                  size.width * 0.014),
                                        ),
                                        onPressed: () async {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          try {
                                            final result =
                                                await InternetAddress.lookup(
                                                    "example.com");
                                            if (result.isNotEmpty &&
                                                result[0]
                                                    .rawAddress
                                                    .isNotEmpty) {
                                              print("There is wifi connection");
                                              if (_formKey.currentState !=
                                                      null &&
                                                  _formKey.currentState!
                                                      .validate()) {
                                                fBCC.giveFeedBackData(
                                                    nameController.text,
                                                    emailController.text,
                                                    phoneController.text,
                                                    commentsController.text,
                                                    appRating,
                                                    productRating,
                                                    serviceRating,
                                                    teamRating,
                                                    DateTime.now().toString(),
                                                    DateTime.now().toString(),
                                                    context);
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              }
                                            }
                                          } on SocketException catch (_) {
                                            AlertBox().noWifiConnection(
                                                3, "", "", context);
                                            print('not connected');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: ChooseColor(0).buttonColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.030)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
