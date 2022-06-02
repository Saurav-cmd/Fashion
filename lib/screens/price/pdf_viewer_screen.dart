import 'package:fashion_paints/Utils/contants.dart';
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PricePdf extends StatefulWidget {
  PricePdf({Key, this.pdfFile, this.title, key}) : super(key: key);
  String? pdfFile;
  String? title;
  @override
  State<PricePdf> createState() => _PricePdfState();
}

class _PricePdfState extends State<PricePdf> {
  String? passedPdfFile;
  String? passedTitle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedPdfFile = widget.pdfFile;
    passedTitle = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    String? pdfUrl = Constants.pdfBaseUrl + '$passedPdfFile';
    print("$pdfUrl");
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("$passedTitle"),
        backgroundColor: ChooseColor(0).appBarColor1,
      ),
      body: const PDF().fromUrl(
        pdfUrl,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(
            child: Text(
          "File Not Found!",
          style: TextStyle(
              color: ChooseColor(0).appBarColor1, fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
