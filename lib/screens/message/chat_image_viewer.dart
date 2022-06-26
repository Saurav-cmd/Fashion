import 'package:dio/dio.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';

import '../../main.dart';

class ChatImageViewer extends StatefulWidget {
  ChatImageViewer({Key, this.chatImage, key}) : super(key: key);
  String? chatImage;
  @override
  State<ChatImageViewer> createState() => _ChatImageViewerState();
}

class _ChatImageViewerState extends State<ChatImageViewer> {
  String? passedChatImage;

  @override
  void initState() {
    super.initState();
    passedChatImage = widget.chatImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ChooseColor(0).appBarColor1,
        elevation: 0,
        title: const Text(
          'Fashion Paints Image View',
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("Message_screen");
          },
        ),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert_outlined),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text("Refresh"),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text("DownLoad"),
                  ),
                ];
              },
              onSelected: (value) async {
                if (value == 0) {
                } else if (value == 1) {
                  final tempDir = await getTemporaryDirectory();
                  final path = '${tempDir.path}/myFile.jpg';
                  await Dio().download(passedChatImage!, path);
                  await GallerySaver.saveImage(path);

                  final SnackBar snackBar = SnackBar(
                    content: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'Image downloaded to gallery',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Colors.grey.shade600,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  );
                  snackBarKey.currentState?.showSnackBar(snackBar);
                }
              }),

          //Icon(Icons.more_vert_outlined),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: PhotoView(
          imageProvider: NetworkImage(passedChatImage!),
        ),
      ),
    );
  }
}
