import 'dart:convert';
import 'dart:io';

import 'package:fashion_paints/controllers/message_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../colors/colors_file.dart';

class FashionChat extends StatefulWidget {
  const FashionChat({Key? key}) : super(key: key);

  @override
  _FashionChatState createState() => _FashionChatState();
}

class _FashionChatState extends State<FashionChat> {
  TextEditingController messageController = TextEditingController();
  MessageController mC = Get.put(MessageController());
  int? userId;
  final ImagePicker imagePicker = ImagePicker();
  List<File> imageFileList = [];
  String? images;

  void selectImagesFromGallery() async {
    List<XFile>? selectedImages = await imagePicker.pickMultiImage(
        maxHeight: 800, maxWidth: 800, imageQuality: 100);
    //yo server ma pathauna ko lagi gallery bata pick garaya ra imageFileList ma halaya ko ho................
    if (selectedImages != null) {
      for (int i = 0; i < selectedImages.length; i++) {
        imageFileList.add(File(selectedImages[i].path));
      }
    }
    setState(() {});
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      userId = jsonDecode(userData)['user_id'];
    }
  }

  fetchApiData() async {
    await mC.getMessageData(context).whenComplete(() {
      mC.messageData!.message;
    });
  }

  void openBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                              child: Image.asset("icons/photo-camera.png"))),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Card(
                            child: Image.asset(
                          "icons/gallery1.png",
                          fit: BoxFit.fill,
                        )),
                      ),
                    ),
                    SizedBox(height: 100)
                  ],
                ),
              ),
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
    fetchApiData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1,
            // For iOS (dark icons)
            statusBarIconBrightness: Brightness.light),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text(
          'Fashion Colour Studio',
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
      body: Column(children: [
        Obx(() {
          if (mC.isLoading.value) {
            return Column(
              children: [
                Padding(
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
                              "Loading chat please wait....",
                              overflow: TextOverflow.clip,
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      )
                    ],
                  ))),
                ),
              ],
            );
          } else {
            return Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: mC.messageData!.message!.length,
                  itemBuilder: (ctx, i) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 15),
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'icons/chatImage.png',
                                    ),
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              if (mC.messageData!.message![i].to == 0)
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.60),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0,
                                          left: 8,
                                          right: 8,
                                          bottom: 5),
                                      child: Text(
                                        '${mC.messageData!.message![i].admin}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (mC.messageData!.message![i].from == userId)
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.topRight,
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.60),

                              //width: 240,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Color(0xff0694C0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${mC.messageData!.message![i].message}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                  }),
            );
          }
        }),
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 5),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 45,
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        openBottomSheet(context);
                      },
                      child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff8F3F97),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  suffixIcon: const Icon(
                    Icons.emoji_emotions,
                    color: Colors.grey,
                    size: 28,
                  ),
                  contentPadding: const EdgeInsets.only(top: 5, left: 55),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  hintText: 'Type a message',
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Colors.black45)),
              textCapitalization: TextCapitalization.sentences,
              controller: messageController,
              onFieldSubmitted: (value) {
                mC.sendMessage(messageController.text, imageFileList, context);
                fetchApiData();
              },
            ),
          ),
        ),
      ]),
    );
  }
}
