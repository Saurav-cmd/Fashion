import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';

class ExteriorImages extends StatefulWidget {
  const ExteriorImages({Key? key}) : super(key: key);

  @override
  State<ExteriorImages> createState() => _ExteriorImagesState();
}

class _ExteriorImagesState extends State<ExteriorImages> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ChooseColor(0).bodyBackgroundColor,
        appBar: AppBar(
          backgroundColor: ChooseColor(0).appBarColor1,
          elevation: 0,
          title: const Text("Exterior Images"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("Dealer_button_Navigation_Bar");
                },
                icon: const Icon(Icons.home))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.030, vertical: size.height * 0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select an Exterior image to visualize",
                style: TextStyle(color: ChooseColor(0).appBarColor1),
              ),
              SizedBox(height: size.height * 0.015),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("Exterior_image_paint");
                    },
                    child: Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "images/1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
