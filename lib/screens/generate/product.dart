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
              if(passedFandeckName=="Fashion Paints Ambiance Plus CS")
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "cosmeticintemulsion",fanDeckName: "Fashion Paints Ambiance Plus CS",emulsionOrDistemper: "Interior Emulsion",)));
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
                                        'cosmetic',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "magnetextemulsion",fanDeckName: "Fashion Paints Ambiance Plus CS",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Magnet',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "smartdist",fanDeckName: "Fashion Paints Ambiance Plus CS",emulsionOrDistemper: "Distemper",)));
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
                                        'Smart',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "styledist",fanDeckName: "Fashion Paints Ambiance Plus CS",emulsionOrDistemper: "Distemper",)));
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
                                        'Style',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "weatherproofextemulsion",fanDeckName: "Fashion Paints Ambiance Plus CS",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Weather Proof',
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
                  ],
                ),

              if(passedFandeckName=="Spirit 1050 Fandeck")
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "cosmeticintemulsion",fanDeckName: "Spirit 1050 Fandeck",emulsionOrDistemper: "Interior Emulsion",)));
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
                                        'cosmetic',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "magnetextemulsion",fanDeckName: "Spirit 1050 Fandeck",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Magnet',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "smartdist",fanDeckName: "Spirit 1050 Fandeck",emulsionOrDistemper: "Distemper",)));
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
                                        'Smart',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "styledist",fanDeckName: "Spirit 1050 Fandeck",emulsionOrDistemper: "Distemper",)));
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
                                        'Style',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "weatherproofextemulsion",fanDeckName: "Spirit 1050 Fandeck",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Weather Proof',
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
                  ],
                ),

              if(passedFandeckName=="Color Symphony Fandeck")
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "cosmeticintemulsion",fanDeckName: "Color Symphony Fandeck",emulsionOrDistemper: "Interior Emulsion",)));
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
                                        'cosmetic',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "magnetextemulsion",fanDeckName: "Color Symphony Fandeck",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Magnet',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "smartdist",fanDeckName: "Color Symphony Fandeck",emulsionOrDistemper: "Distemper",)));
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
                                        'Smart',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "styledist",fanDeckName: "Color Symphony Fandeck",emulsionOrDistemper: "Distemper",)));
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
                                        'Style',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "weatherproofextemulsion",fanDeckName: "Color Symphony Fandeck",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Weather Proof',
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
                  ],
                ),

              if(passedFandeckName=="Color Cosmos Fandeck")
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "cosmeticintemulsion",fanDeckName: "Color Cosmos Fandeck",emulsionOrDistemper: "Interior Emulsion",)));
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
                                        'cosmetic',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "magnetextemulsion",fanDeckName: "Color Cosmos Fandeck",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Magnet',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "smartdist",fanDeckName: "Color Cosmos Fandeck",emulsionOrDistemper: "Distemper",)));
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
                                        'Smart',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "styledist",fanDeckName: "Color Cosmos Fandeck",emulsionOrDistemper: "Distemper",)));
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
                                        'Style',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "weatherproofextemulsion",fanDeckName: "Color Cosmos Fandeck",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Weather Proof',
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
                  ],
                ),

              if(passedFandeckName=="BP-2300")
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "cosmeticintemulsion",fanDeckName: "BP-2300",emulsionOrDistemper: "Interior Emulsion",)));
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
                                        'cosmetic',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "magnetextemulsion",fanDeckName: "BP-2300",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Magnet',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "smartdist",fanDeckName: "BP-2300",emulsionOrDistemper: "Distemper",)));
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
                                        'Smart',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "styledist",fanDeckName: "BP-2300",emulsionOrDistemper: "Distemper",)));
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
                                        'Style',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "weatherproofextemulsion",fanDeckName: "BP-2300",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Weather Proof',
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
                  ],
                ),

              if(passedFandeckName=="AP-CP")
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "cosmeticintemulsion",fanDeckName: "AP-CP",emulsionOrDistemper: "Interior Emulsion",)));
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
                                        'cosmetic',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "magnetextemulsion",fanDeckName: "AP-CP",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Magnet',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "smartdist",fanDeckName: "AP-CP",emulsionOrDistemper: "Distemper",)));
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
                                        'Smart',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "styledist",fanDeckName: "AP-CP",emulsionOrDistemper: "Distemper",)));
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
                                        'Style',
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
                        Navigator.of(context).push(MaterialPageRoute(builder:(ctx)=>ProductDetailScreen(productName: "weatherproofextemulsion",fanDeckName: "AP-CP",emulsionOrDistemper: "Exterior Emulsion",)));
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
                                        'Weather Proof',
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
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
