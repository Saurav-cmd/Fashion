import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/screens/generate/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenerateFirstScreen extends StatefulWidget {
  const GenerateFirstScreen({Key? key}) : super(key: key);

  @override
  _GenerateFirstScreenState createState() => _GenerateFirstScreenState();
}

class _GenerateFirstScreenState extends State<GenerateFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1, // For iOS (dark icons)
            statusBarIconBrightness: Brightness.light),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text(
          'Generate',
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
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select a Fendeck/ Shade Card of Fashion Paints'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => ProductScreen(
                              fanDeckName: "Fashion Paints Ambiance Plus CS",
                            )));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SizedBox(
                                  width: 210,
                                  child: Text(
                                    'Fashion Paints Ambiance Plus CS',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Image(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'icons/generate (1).png',
                                ),
                                height: 50,
                                width: 50,
                              )
                            ],
                          ),
                          Text(
                            'Fandeck',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProductScreen(
                            fanDeckName: "Spirit 1050 Fandeck",
                          )));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SizedBox(
                                width: 210,
                                child: Text(
                                  'Spirit 1050 Fandeck',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )),
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'icons/generate (1).png',
                              ),
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                        Text(
                          'Fandeck',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProductScreen(
                            fanDeckName: "Color Symphony Fandeck",
                          )));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SizedBox(
                                width: 210,
                                child: Text(
                                  'Color Symphony Fandeck',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )),
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'icons/generate (1).png',
                              ),
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                        Text(
                          'Fandeck',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProductScreen(
                            fanDeckName: "Color Cosmos Fandeck",
                          )));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SizedBox(
                                width: 210,
                                child: Text(
                                  'Color Cosmos Fandeck',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )),
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'icons/generate (1).png',
                              ),
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                        Text(
                          'Fandeck',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProductScreen(
                            fanDeckName: "BP-2300",
                          )));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SizedBox(
                                width: 210,
                                child: Text(
                                  'BP-2300',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )),
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'icons/generate (1).png',
                              ),
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                        Text(
                          'Fandeck',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ProductScreen(
                            fanDeckName: "AP-CP",
                          )));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            SizedBox(
                                width: 210,
                                child: Text(
                                  'AP-CP',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )),
                            Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'icons/generate (1).png',
                              ),
                              height: 50,
                              width: 50,
                            )
                          ],
                        ),
                        Text(
                          'Fandeck',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
