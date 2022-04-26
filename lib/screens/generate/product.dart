import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/screens/generate/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key,
  this.fanDeckName,
  key}) : super(key: key);
  String? fanDeckName;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String? passedFandeckName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passedFandeckName = widget.fanDeckName;
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ChooseColor(0).bodyBackgroundColor,
      appBar:AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:ChooseColor(0).appBarColor1,
            statusBarIconBrightness: Brightness.light// For iOS (dark icons)
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacementNamed("Generate_screen");
          },
          icon:const Icon(Icons.arrow_back_ios),color: Colors.white60,iconSize: 20,
        ),
        backgroundColor: ChooseColor(0).appBarColor1,
        title: const Text("Product"),
        actions: [
          IconButton(onPressed:(){
            Navigator.of(context).pushNamed("Dealer_button_Navigation_Bar");
          }, icon:const Icon(Icons.home))
        ],
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: size.width*0.030,vertical: size.height*0.020),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if(passedFandeckName=="RELIANCE ULTRA PROTEC SC")
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "doubleDefenceEE",fanDeckName: "RELIANCE ULTRA PROTEC SC",emulsionOrDistemper: "Exterior Emulsion",)));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: const [
                            SizedBox(
                                width: 210,
                                child: Text(
                                  'Double Defence',
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
                          'Exterior Emulsion',
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              if(passedFandeckName=="SPIRIT 1050")
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "doubleDefenceEE",fanDeckName: "SPIRIT 1050",emulsionOrDistemper: "Exterior Emulsion",)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                    width: 210,
                                    child: Text(
                                      'Double Defence',
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
                              'Exterior Emulsion',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height*0.015),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "newUltraProtecEE",fanDeckName: "SPIRIT 1050",emulsionOrDistemper: "Exterior Emulsion",)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                    width: 210,
                                    child: Text(
                                      'New Ultra Protect',
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
                              'Exterior Emulsion',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.015),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "protecEE",fanDeckName: "SPIRIT 1050",emulsionOrDistemper: "Exterior Emulsion",)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                    width: 210,
                                    child: Text(
                                      'Protect',
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
                              'Exterior Emulsion',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.015),

                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "newShangrilaEE",fanDeckName: "SPIRIT 1050",emulsionOrDistemper: "Exterior Emulsion",)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                    width: 210,
                                    child: Text(
                                      'New Shangrila',
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
                              'Exterior Emulsion',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.015),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "elegaIE",fanDeckName: "SPIRIT 1050",emulsionOrDistemper: "Interior Emulsion",)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                    width: 210,
                                    child: Text(
                                      'Elega',
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
                              'Interior Emulsion',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.015),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "newBarpimoIE",fanDeckName: "SPIRIT 1050",emulsionOrDistemper: "Interior Emulsion",)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                    width: 210,
                                    child: Text(
                                      'New Barpimo',
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
                              'Interior Emulsion',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.015),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "newShangrilaIE",fanDeckName: "SPIRIT 1050",emulsionOrDistemper: "Interior Emulsion",)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                    width: 210,
                                    child: Text(
                                      'New Shangrila',
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
                              'Interior Emulsion',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.015),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "relianceDist",fanDeckName: "SPIRIT 1050",emulsionOrDistemper: "Distemper",)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                    width: 210,
                                    child: Text(
                                      'Reliance',
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
                              'Distemper',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.015),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "shangrilaDist",fanDeckName: "SPIRIT 1050",emulsionOrDistemper: "Distemper",)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: const [
                                SizedBox(
                                    width: 210,
                                    child: Text(
                                      'Shangrila',
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
                              'Distemper',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.015),
                ],
              ),

              if(passedFandeckName=="SHADE CARD")
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "newUltraProtecEE",fanDeckName: "SHADE CARD",emulsionOrDistemper: "Exterior Emulsion",)));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(
                                      width: 210,
                                      child: Text(
                                        'New Ultra Protect',
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
                                'Exterior Emulsion',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.015),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "protecEE",fanDeckName: "SHADE CARD",emulsionOrDistemper: "Exterior Emulsion",)));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(
                                      width: 210,
                                      child: Text(
                                        'Protect',
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
                                'Exterior Emulsion',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.015),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "newShangrilaEE",fanDeckName: "SHADE CARD",emulsionOrDistemper: "Exterior Emulsion",)));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(
                                      width: 210,
                                      child: Text(
                                        'New Shangrila',
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
                                'Exterior Emulsion',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.015),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "elegaIE",fanDeckName: "SHADE CARD",emulsionOrDistemper: "Interior Emulsion",)));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(
                                      width: 210,
                                      child: Text(
                                        'Elega',
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
                                'Interior Emulsion',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.015),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "newBarpimoIE",fanDeckName: "SHADE CARD",emulsionOrDistemper: "Interior Emulsion",)));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(
                                      width: 210,
                                      child: Text(
                                        'New Barpimo',
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
                                'Interior Emulsion',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.015),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "newShangrilaIE",fanDeckName: "SHADE CARD",emulsionOrDistemper: "Interior Emulsion",)));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(
                                      width: 210,
                                      child: Text(
                                        'New Shangrila',
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
                                'Interior Emulsion',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.015),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "relianceDist",fanDeckName: "SHADE CARD",emulsionOrDistemper: "Distemper",)));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(
                                      width: 210,
                                      child: Text(
                                        'Reliance',
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
                                'Distemper',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.015),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "shangrilaDist",fanDeckName: "SHADE CARD",emulsionOrDistemper: "Distemper",)));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: const [
                                  SizedBox(
                                      width: 210,
                                      child: Text(
                                        'Shangrila',
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
                                'Distemper',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.015),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
