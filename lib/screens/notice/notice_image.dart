import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:photo_view/photo_view.dart';

class NoticeImage extends StatefulWidget {
  const NoticeImage({Key,
    @required this.Image,
    key}) : super(key: key);
  final String ?Image;

  @override
  _NoticeImageState createState() => _NoticeImageState();
}





class _NoticeImageState extends State<NoticeImage> {
  String imageName ="FashionImage.jpg";
  String ?fasImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fasImage =widget.Image;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
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
        backgroundColor: ChooseColor(0).appBarColor1,

        elevation: 0,
        title: const Text('Fashion Image View',style: TextStyle(fontSize: 18),),
        actions:  [
          PopupMenuButton(

              icon: const Icon(Icons.more_vert_outlined),

              itemBuilder: (context){
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
              onSelected:(value){
                if(value == 0){

                }else if(value == 1){
                  image_downloader();


                }
              }
          ),

          //Icon(Icons.more_vert_outlined),
          const SizedBox(width: 10,)
        ],
      ),
      body: PhotoView(
        imageProvider: NetworkImage(fasImage!),
      ) ,

    );

  }
  image_downloader()async{
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(fasImage!,
          destination: AndroidDestinationType.directoryDownloads..subDirectory(imageName)
      );
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      rethrow;
    }




  }
}
