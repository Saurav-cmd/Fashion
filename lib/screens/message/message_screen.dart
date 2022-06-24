import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fashion_paints/Apis/api_Routes.dart';
import 'package:fashion_paints/controllers/message_controller.dart';
import 'package:fashion_paints/screens/message/chat_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../colors/colors_file.dart';
import '../../models/apis_model/message_model.dart';
import '../../widgets/dilogue_box.dart';
import 'gallery_camera_modal_bottom_sheet_chat.dart';

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
        setState(() {
          imageFileList.add(File(selectedImages[i].path));
        });
      }
    }
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      setState(() {
        userId = jsonDecode(userData)['user_id'];
      });
    }
  }

  showSnackBar() async {
    final size = MediaQuery.of(context).size;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'No Internet connection',
        maxLines: 2,
        style: TextStyle(fontSize: size.height * 0.011 + size.width * 0.011),
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.grey.shade700,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ));
  }

  late Message message;
  Message? messageData;
  Stream<Message?> getMessages() async* {
    final size = MediaQuery.of(context).size;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString("userData");
    String? token = jsonDecode(userData!)['token'];
    try {
      yield* Stream.periodic(Duration(milliseconds: 500), (_) async {
        final apiUrl = ApiRoute().getChat();
        final response = await http.get(Uri.parse(apiUrl!), headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
        final responseData = json.decode(response.body);
        if (response.statusCode == 200) {
          print("This is response ${responseData}");
          return messageFromJson(jsonEncode(responseData));
        } else if (response.statusCode == 403) {
          AlertBox().AlertBox403(context);
        } else if (response.statusCode == 400) {
          AlertBox().AlertBox400(context);
        } else if (response.statusCode == 401) {
          AlertBox().AlertBox401(context);
        } else if (response.statusCode == 500) {
          AlertBox().servererror(context);
        } else if (response.statusCode == 503) {
          AlertBox().servererror(context);
        }
      }).asyncMap((event) async => await event);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Please check your internet connection!',
          maxLines: 2,
          style: TextStyle(fontSize: size.height * 0.011 + size.width * 0.011),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.grey.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ));
    }
  }

  void openBottomSheet(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) => ChatModalBottomSheet());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessages();
    getUserId();
  }

/*  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getMessages();
  }*/

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getMessages();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed("Dealer_button_Navigation_Bar");
          },
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
      body: Padding(
        padding: mediaQueryData.viewInsets,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
            child: StreamBuilder<Message?>(
                stream: getMessages(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? SingleChildScrollView(
                          reverse: true,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.messages!.length,
                              itemBuilder: (ctx, i) {
                                return snapshot.data!.messages![i].isRead == 0
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: size.height * 0.020,
                                            horizontal: size.width * 0.015),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                    "icons/chatImage.png"),
                                                Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          size.width * 0.80),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                size.height *
                                                                    0.015,
                                                            horizontal:
                                                                size.width *
                                                                    0.015),
                                                    child: Text(
                                                      "${snapshot.data!.messages![i].message}",
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                      0.014 +
                                                                  size.width *
                                                                      0.014,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            snapshot
                                                        .data!
                                                        .messages![i]
                                                        .messageImage!
                                                        .isNotEmpty &&
                                                    snapshot.data!.messages![i]
                                                            .isRead ==
                                                        0
                                                ? SizedBox(
                                                    height: 100,
                                                    width: 100,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: snapshot
                                                            .data!
                                                            .messages![i]
                                                            .messageImage!
                                                            .length,
                                                        itemBuilder: (ctx, j) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushReplacement(
                                                                      MaterialPageRoute(
                                                                          builder: (ctx) =>
                                                                              ChatImageViewer(
                                                                                chatImage: snapshot.data!.messages![i].messageImage![j].image,
                                                                              )));
                                                            },
                                                            child: Container(
                                                              height: 100,
                                                              width: 100,
                                                              child:
                                                                  Image.network(
                                                                "${snapshot.data!.messages![i].messageImage![j].image}",
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      )
                                    : snapshot.data!.messages![i].isRead == 1
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: size.height * 0.020,
                                                horizontal: size.width * 0.015),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            color: ChooseColor(
                                                                    0)
                                                                .appBarColor1),
                                                        child: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                vertical:
                                                                    size.height *
                                                                        0.015,
                                                                horizontal:
                                                                    size.width *
                                                                        0.015),
                                                            child: snapshot
                                                                    .data!
                                                                    .messages![
                                                                        i]
                                                                    .message!
                                                                    .isNotEmpty
                                                                ? Text(
                                                                    "${snapshot.data!.messages![i].message}",
                                                                    style: TextStyle(
                                                                        fontSize: size.height *
                                                                                0.014 +
                                                                            size.width *
                                                                                0.014,
                                                                        color: Colors
                                                                            .white),
                                                                  )
                                                                : Container(
                                                                    height: 0,
                                                                    width: 0,
                                                                  ))),
                                                  ],
                                                ),
                                                snapshot
                                                            .data!
                                                            .messages![i]
                                                            .messageImage!
                                                            .isNotEmpty &&
                                                        snapshot
                                                                .data!
                                                                .messages![i]
                                                                .isRead ==
                                                            1
                                                    ? SizedBox(
                                                        height: 100,
                                                        width: 100,
                                                        child: ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount: snapshot
                                                                .data!
                                                                .messages![i]
                                                                .messageImage!
                                                                .length,
                                                            itemBuilder:
                                                                (ctx, j) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pushReplacement(MaterialPageRoute(
                                                                            builder: (ctx) => ChatImageViewer(
                                                                                  chatImage: snapshot.data!.messages![i].messageImage![j].image,
                                                                                )));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child: Image
                                                                        .network(
                                                                            "${snapshot.data!.messages![i].messageImage![j].image}"),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                          )
                                        : Container();
                              }),
                        )
                      : LinearProgressIndicator();
                }),
          ),
          BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 5),
              child: Container(
                alignment: Alignment.bottomCenter,
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
                  onFieldSubmitted: (value) async {
                    try {
                      final result =
                          await InternetAddress.lookup("example.com");
                      if (result.isNotEmpty &&
                          result[0].rawAddress.isNotEmpty) {
                        setState(() {
                          mC.sendMessage(
                              messageController.text, imageFileList, context);
                          getMessages();
                          messageController.text = "";
                        });
                      }
                    } on SocketException catch (_) {
                      showSnackBar();
                    }
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
