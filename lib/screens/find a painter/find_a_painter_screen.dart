/*
import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import 'package:nepali_date_picker/nepali_date_picker.dart';

class FindPainter extends StatefulWidget {
  const FindPainter({Key? key}) : super(key: key);

  @override
  _FindPainterState createState() => _FindPainterState();
}

final TextEditingController _dobController = TextEditingController();

class _FindPainterState extends State<FindPainter> {
  Future getNepaliDate() async {
    picker.NepaliDateTime? _selectedDateTime =
        await picker.showAdaptiveDatePicker(
      context: context,
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime(2050),
      lastDate: NepaliDateTime(2090),
    );
    setState(() {
      _dobController.text =
          NepaliDateFormat("yyyy-MM-dd").format(_selectedDateTime!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ChooseColor(0).appBarColor1,
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
                _dobController.clear();
                Navigator.of(context).pushNamed("Button_Navigation_Bar");
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
                      _dobController.clear();
                      Navigator.of(context).pushNamed("Button_Navigation_Bar");
                    }),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please fill up the form',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              const SizedBox(height: 15),
              const Text(
                'Name',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.001,
                      horizontal: size.width * 0.030),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  // labelText: 'Phone Number',
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Dealer Code',
                  hintStyle: TextStyle(
                      fontSize: size.height * 0.012 + size.width * 0.012,
                      color: Colors.black26),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Email Address',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.001,
                      horizontal: size.width * 0.030),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  // labelText: 'Phone Number',
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Email Address',
                  hintStyle: TextStyle(
                      fontSize: size.height * 0.012 + size.width * 0.012,
                      color: Colors.black26),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Phone Number',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.001,
                      horizontal: size.width * 0.030),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  // labelText: 'Phone Number',
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(
                      fontSize: size.height * 0.012 + size.width * 0.012,
                      color: Colors.black26),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Address',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height: 5),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.001,
                      horizontal: size.width * 0.030),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey.shade300,
                  ),

                  // labelText: 'Phone Number',
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Address',
                  hintStyle: TextStyle(
                      fontSize: size.height * 0.012 + size.width * 0.012,
                      color: Colors.black26),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Appointment Date',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: _dobController,
                onTap: () {
                  getNepaliDate();
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.001,
                      horizontal: size.width * 0.030),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey.shade300,
                  ),
                  // labelText: 'Phone Number',
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Appointment Date',
                  hintStyle: TextStyle(
                      fontSize: size.height * 0.012 + size.width * 0.012,
                      color: Colors.black26),
                ),
              ),
              SizedBox(height: size.height * 0.055),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: double.infinity, height: size.height * 0.055),
                child: ElevatedButton(
                  child: Text(
                    'Submit',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: size.height * 0.014 + size.width * 0.014),
                  ),
                  onPressed: () {
                    _dobController.clear();
                    //painterStatus_screen
                    Navigator.of(context)
                        .pushNamed("Find_Painter_Second_screen");

                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ChooseColor(0).buttonColor,
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
*/
