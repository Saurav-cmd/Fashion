import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../colors/colors_file.dart';
import '../../controllers/message_controller.dart';

class ChatModalBottomSheet extends StatefulWidget {
  const ChatModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<ChatModalBottomSheet> createState() => _ChatModalBottomSheetState();
}

class _ChatModalBottomSheetState extends State<ChatModalBottomSheet> {
  MessageController mC = Get.put(MessageController());
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

  @override
  Widget build(BuildContext context) {
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
                    child: Card(child: Image.asset("icons/photo-camera.png"))),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectImagesFromGallery();
                  });
                },
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
              SizedBox(width: 25),
              // imageFileList.length >= 1
              //     ?
              ElevatedButton(
                onPressed: () {
                  mC.sendMessage("", imageFileList, context);
                },
                child: Text("Send"),
                style: ElevatedButton.styleFrom(
                    primary: ChooseColor(0).appBarColor1),
              ),
              // : Container(),
              SizedBox(width: 25),
              SizedBox(
                height: 80,
                width: 100,
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: imageFileList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemBuilder: (ctx, i) {
                      return Container(
                        height: 80,
                        width: 70,
                        child: Image.file(
                          File(imageFileList[i].path),
                          fit: BoxFit.fill,
                        ),
                      );
                    }),
              ),

              SizedBox(height: 100)
            ],
          ),
        ),
      ),
      behavior: HitTestBehavior.opaque,
    );
  }
}
