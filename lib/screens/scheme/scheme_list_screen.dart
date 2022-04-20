import 'package:fashion_paints/static_testing_list/scheme_list.dart';
import 'package:flutter/material.dart';
class SchemeList extends StatefulWidget {
  const SchemeList({Key ?key}) : super(key: key);

  @override
  _SchemeListState createState() => _SchemeListState();
}

class _SchemeListState extends State<SchemeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F9),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Colors.white,
              ),
              onPressed: () {},
            );
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0xff443F77),
        title: const Text(
          'Scheme',
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
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0,left: 20,right: 20),
          child: Column(
            children: [
              Text('Scheme list published by Fashion Paints for Dealers.',style: TextStyle(color: Colors.grey.shade700,fontSize: 13),),
              ...schemeList.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 15,top: 8),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                          children: [
                            SizedBox(
                                width: 210,
                                child: Text(
                                  '${e['title']}',
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )),
                            const Image(
                              image:AssetImage('icons/pdf.png',),height: 45,width: 35,)

                          ],
                        ),
                        SizedBox(
                          width: 255,
                          child: Text(
                            '${e['desc']}',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )).toList()

            ],
          ),
        ),
      ),

    );
  }
}
