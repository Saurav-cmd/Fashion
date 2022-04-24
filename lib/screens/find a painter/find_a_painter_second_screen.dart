import 'package:fashion_paints/static_testing_list/painter_screen.dart';
import 'package:fashion_paints/static_testing_list/paints_status_off.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../colors/colors_file.dart';

class PainterStatus extends StatefulWidget {
  const PainterStatus({Key? key}) : super(key: key);

  @override
  _PainterStatusState createState() => _PainterStatusState();
}

class _PainterStatusState extends State<PainterStatus> {
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
                Navigator.of(context).pushNamed("Find_Painter_screen");
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0xff443F77),
        title: const Text(
          'Find A Painter',
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
                      Navigator.of(context).pushNamed("Button_Navigation_Bar");
                    }),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: Column(
          children: [
            ...painterOn
                .map(
                  (e) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 14.0, bottom: 14, left: 12),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'assets/images/painter.png'))),
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 10, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        child: Text(
                                          '${e['name']}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Status',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.green,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${e['contact']}',
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.black87),
                                ),
                                Text(
                                  '${e['address']}',
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.black87),
                                ),
                              ],
                            ),
                          )),

                      //child: Text(sectioName[index]))
                    ],
                  ),
                ),
              ),
            )
                .toList(),
            ...painterOff
                .map(
                  (e) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 14.0, bottom: 14, left: 12),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'assets/images/painter.png'))),
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 10, top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 140,
                                        child: Text(
                                          '${e['name']}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Status',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Icon(
                                            Icons.radio_button_checked,
                                            color: Colors.red,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${e['contact']}',
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.black87),
                                ),
                                Text(
                                  '${e['address']}',
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.black87),
                                ),
                              ],
                            ),
                          )),

                      //child: Text(sectioName[index]))
                    ],
                  ),
                ),
              ),
            ).toList()
          ],
        ),
      ),
    );
  }
}
