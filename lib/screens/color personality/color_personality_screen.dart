import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../colors/colors_file.dart';

class ColorPersonalityScreen extends StatefulWidget {
  const ColorPersonalityScreen({Key? key}) : super(key: key);

  @override
  _ColorPersonalityScreenState createState() => _ColorPersonalityScreenState();
}

class _ColorPersonalityScreenState extends State<ColorPersonalityScreen> {
  final GlobalKey _formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController behaviourController = TextEditingController();
  TextEditingController birthMonthController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController chooseController = TextEditingController();
  TextEditingController petController = TextEditingController();
  TextEditingController freeTimeController = TextEditingController();
  TextEditingController holidayController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController moneyController = TextEditingController();
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
                Navigator.of(context).pushNamed("Button_Navigation_Bar");
              },
            );
          },
        ),
        elevation: 0,
        backgroundColor: const Color(0xff443F77),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Check the best color that suits your personality',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Here you can find, which color combination for your home that explains much better about your personality.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Name',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height: 5),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: size.height * 0.001,
                          horizontal: size.width * 0.030),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Gender',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Male',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Age Group',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: '10-20',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Behaviour',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Introvert',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Month of Birth',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Janurary',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Day of Birth',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Sunday',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: size.width * 0.75,
                    child: const Text(
                      'Choose any one among this, that inspire you most:',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'River',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Pet animals you like to have:',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Dog',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'What would you love to do in free time?',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'watch Movies',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Destination you will like to visit for holiday:',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Sauraha',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Where You would like to go for Shopping:',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Mall',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'if you got 1 lakh, where would you like to spent?',
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
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      // labelText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Gold',
                      hintStyle: TextStyle(
                          fontSize: size.height * 0.012 + size.width * 0.012,
                          color: Colors.black26),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 35),
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
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ChooseColor(0).buttonColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
