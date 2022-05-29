// /*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../colors/colors_file.dart';

//we need to add configuration for android and ios to run this web view
class ColorPersonality extends StatefulWidget {
  const ColorPersonality({Key? key}) : super(key: key);

  @override
  State<ColorPersonality> createState() => _ColorPersonalityState();
}

class _ColorPersonalityState extends State<ColorPersonality> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ChooseColor(0).appBarColor1,
        elevation: 0,
        title: const Text('Color Personality'),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ChooseColor(0).appBarColor1, // For iOS (dark icons)
            statusBarIconBrightness: Brightness.light),
        actions: [
          IconButton(
              onPressed: () async {
                print("tapped");
                await controller
                    .loadUrl("https://fashionpaints.com.np/color-personality/");
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://fashionpaints.com.np/color-personality/',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onPageStarted: (url) {
          print('this is our url $url');
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../../colors/colors_file.dart';
//
// class ColorPersonalityScreen extends StatefulWidget {
//   const ColorPersonalityScreen({Key? key}) : super(key: key);
//
//   @override
//   _ColorPersonalityScreenState createState() => _ColorPersonalityScreenState();
// }
//
// class _ColorPersonalityScreenState extends State<ColorPersonalityScreen> {
//   final GlobalKey _formKey = GlobalKey();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController genderController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController behaviourController = TextEditingController();
//   TextEditingController birthMonthController = TextEditingController();
//   TextEditingController birthDayController = TextEditingController();
//   TextEditingController chooseController = TextEditingController();
//   TextEditingController petController = TextEditingController();
//   TextEditingController freeTimeController = TextEditingController();
//   TextEditingController holidayController = TextEditingController();
//   TextEditingController mailController = TextEditingController();
//   TextEditingController moneyController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     String genderSelectedValue = "Male";
//     List<DropdownMenuItem<String>> genderMenuItems = [
//       const DropdownMenuItem(child: Text("Male"), value: "Male"),
//       const DropdownMenuItem(child: Text("Female"), value: "Female"),
//       const DropdownMenuItem(child: Text("Other"), value: "Other"),
//     ];
//
//     String ageSelectedValue = "10-20";
//     List<DropdownMenuItem<String>> ageMenuItems = [
//       const DropdownMenuItem(
//         child: Text("10-20"),
//         value: "10-20",
//       ),
//       const DropdownMenuItem(
//         child: Text("20-30"),
//         value: "20-30",
//       ),
//       const DropdownMenuItem(
//         child: Text("30-40"),
//         value: "30-40",
//       ),
//       const DropdownMenuItem(
//         child: Text("40-50"),
//         value: "40-50",
//       ),
//       const DropdownMenuItem(
//         child: Text("50-60"),
//         value: "50-60",
//       ),
//       const DropdownMenuItem(
//         child: Text("60-70"),
//         value: "60-70",
//       ),
//     ];
//
//     String behaviourSelectedValue = "Introvert";
//     List<DropdownMenuItem<String>> behaviourMenuItems = [
//       const DropdownMenuItem(
//         child: Text("Introvert"),
//         value: "Introvert",
//       ),
//       const DropdownMenuItem(
//         child: Text("Extrovert"),
//         value: "Extrovert",
//       ),
//     ];
//
//     String birthMonthSelectedValue = "January";
//     List<DropdownMenuItem<String>> birthMonthMenuItems = [
//       const DropdownMenuItem(
//         child: Text("January"),
//         value: "January",
//       ),
//       const DropdownMenuItem(
//         child: Text("February"),
//         value: "February",
//       ),
//       const DropdownMenuItem(
//         child: Text("March"),
//         value: "March",
//       ),
//       const DropdownMenuItem(
//         child: Text("April"),
//         value: "April",
//       ),
//       const DropdownMenuItem(
//         child: Text("May"),
//         value: "May",
//       ),
//       const DropdownMenuItem(
//         child: Text("June"),
//         value: "June",
//       ),
//       const DropdownMenuItem(
//         child: Text("July"),
//         value: "July",
//       ),
//       const DropdownMenuItem(
//         child: Text("August"),
//         value: "August",
//       ),
//       const DropdownMenuItem(
//         child: Text("September"),
//         value: "September",
//       ),
//       const DropdownMenuItem(
//         child: Text("October"),
//         value: "October",
//       ),
//       const DropdownMenuItem(
//         child: Text("November"),
//         value: "November",
//       ),
//       const DropdownMenuItem(
//         child: Text("December"),
//         value: "December",
//       ),
//     ];
//
//     String birthDaySelectedValue = "Sunday";
//     List<DropdownMenuItem<String>> birthDayMenuItems = [
//       const DropdownMenuItem(
//         child: Text("Sunday"),
//         value: "Sunday",
//       ),
//       const DropdownMenuItem(
//         child: Text("Monday"),
//         value: "Monday",
//       ),
//       const DropdownMenuItem(
//         child: Text("Tuesday"),
//         value: "Tuesday",
//       ),
//       const DropdownMenuItem(
//         child: Text("Wednesday"),
//         value: "Wednesday",
//       ),
//       const DropdownMenuItem(
//         child: Text("Thursday"),
//         value: "Thursday",
//       ),
//       const DropdownMenuItem(
//         child: Text("Friday"),
//         value: "Friday",
//       ),
//       const DropdownMenuItem(
//         child: Text("Saturday"),
//         value: "Saturday",
//       ),
//     ];
//
//     String inspireSelectedValue = "River";
//     List<DropdownMenuItem<String>> inspireMenuItems = [
//       const DropdownMenuItem(child: Text("River"), value: "River"),
//       const DropdownMenuItem(child: Text("Mountain"), value: "Mountain"),
//       const DropdownMenuItem(child: Text("Sky"), value: "Sky"),
//       const DropdownMenuItem(child: Text("Trees"), value: "Trees"),
//       const DropdownMenuItem(child: Text("Fields"), value: "Fields"),
//     ];
//
//     String petSelectedValue = "Dog";
//     List<DropdownMenuItem<String>> petMenuItems = [
//       const DropdownMenuItem(child: Text("Dog"), value: "Dog"),
//       const DropdownMenuItem(child: Text("Cat"), value: "Cat"),
//       const DropdownMenuItem(child: Text("Fish"), value: "Fish"),
//       const DropdownMenuItem(child: Text("Parrot"), value: "Parrot"),
//     ];
//
//     String freeTimeSelectedValue = "Watch Movies";
//     List<DropdownMenuItem<String>> freeTimeMenuItems = [
//       const DropdownMenuItem(
//           child: Text("Watch Movies"), value: "Watch Movies"),
//       const DropdownMenuItem(
//           child: Text("Hang out with Friends"), value: "Hang out with Friends"),
//       const DropdownMenuItem(
//           child: Text("Alone in park"), value: "Alone in park"),
//       const DropdownMenuItem(child: Text("Read Books"), value: "Read Books"),
//     ];
//
//     String holidaySelectedValue = "Sauraha";
//     List<DropdownMenuItem<String>> holidayMenuItems = [
//       const DropdownMenuItem(child: Text("Sauraha"), value: "Sauraha"),
//       const DropdownMenuItem(child: Text("Pokhara"), value: "Pokhara"),
//       const DropdownMenuItem(child: Text("Lumbini"), value: "Lumbini"),
//       const DropdownMenuItem(child: Text("Nagarkot"), value: "Nagarkot"),
//     ];
//
//     String shoppingSelectedValue = "Mall";
//     List<DropdownMenuItem<String>> shoppingMenuItems = [
//       const DropdownMenuItem(child: Text("Mall"), value: "Mall"),
//       const DropdownMenuItem(
//           child: Text("Retail Market"), value: "Retail Market"),
//       const DropdownMenuItem(
//           child: Text("Random on the go"), value: "Random on the go"),
//       const DropdownMenuItem(child: Text("Online Site"), value: "Online Site"),
//     ];
//
//     String spentSelectedValue = "Gold";
//     List<DropdownMenuItem<String>> spentMenuItems = [
//       const DropdownMenuItem(child: Text("Gold"), value: "Gold"),
//       const DropdownMenuItem(child: Text("Mobile"), value: "Mobile"),
//       const DropdownMenuItem(child: Text("Travel"), value: "Travel"),
//       const DropdownMenuItem(child: Text("Appliances"), value: "Appliances"),
//     ];
//
//     return Scaffold(
//       backgroundColor: ChooseColor(0).appBarColor1,
//       appBar: AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarColor: ChooseColor(0).appBarColor1, // For iOS (dark icons)
//             statusBarIconBrightness: Brightness.light),
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 size: 15,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pushNamed("Button_Navigation_Bar");
//               },
//             );
//           },
//         ),
//         elevation: 0,
//         backgroundColor: const Color(0xff443F77),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Row(
//               children: [
//                 IconButton(
//                     icon: const Icon(
//                       Icons.home_filled,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pushNamed("Button_Navigation_Bar");
//                     }),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15.0, right: 15),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Text(
//                       'Check the best color that suits your personality',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 22, color: Colors.white),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Here you can find, which color combination for your home that explains much better about your personality.',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 12, color: Colors.white),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 'Name',
//                 style: TextStyle(fontSize: 12, color: Colors.white),
//               ),
//               const SizedBox(height: 5),
//               Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextFormField(
//                         decoration: InputDecoration(
//                           border: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                           ),
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: size.height * 0.001,
//                               horizontal: size.width * 0.030),
//                           errorBorder: OutlineInputBorder(
//                               borderSide:
//                                   const BorderSide(color: Colors.red, width: 1),
//                               borderRadius: BorderRadius.circular(5)),
//                           // labelText: 'Phone Number',
//                           fillColor: Colors.white,
//                           filled: true,
//                           hintText: 'Full Name',
//                           hintStyle: TextStyle(
//                               fontSize:
//                                   size.height * 0.012 + size.width * 0.012,
//                               color: Colors.black26),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Gender',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) =>
//                               value == null ? "Select a Gender" : null,
//                           dropdownColor: Colors.white,
//                           value: genderSelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               genderSelectedValue = newValue!;
//                             });
//                           },
//                           items: genderMenuItems),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Age Group',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) =>
//                               value == null ? "Select an age group" : null,
//                           dropdownColor: Colors.white,
//                           value: ageSelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               ageSelectedValue = newValue!;
//                             });
//                           },
//                           items: ageMenuItems),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Behaviour',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) =>
//                               value == null ? "Select your behaviour" : null,
//                           dropdownColor: Colors.white,
//                           value: behaviourSelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               behaviourSelectedValue = newValue!;
//                             });
//                           },
//                           items: behaviourMenuItems),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Month of Birth',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) =>
//                               value == null ? "Select a Gender" : null,
//                           dropdownColor: Colors.white,
//                           value: birthMonthSelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               birthMonthSelectedValue = newValue!;
//                             });
//                           },
//                           items: birthMonthMenuItems),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Day of Birth',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) =>
//                               value == null ? "Select your birth day" : null,
//                           dropdownColor: Colors.white,
//                           value: birthDaySelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               birthDaySelectedValue = newValue!;
//                             });
//                           },
//                           items: birthDayMenuItems),
//                       const SizedBox(height: 15),
//                       SizedBox(
//                         width: size.width * 0.75,
//                         child: const Text(
//                           'Choose any one among this, that inspire you most:',
//                           style: TextStyle(fontSize: 12, color: Colors.white),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) =>
//                               value == null ? "Select what inspires you" : null,
//                           dropdownColor: Colors.white,
//                           value: inspireSelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               inspireSelectedValue = newValue!;
//                             });
//                           },
//                           items: inspireMenuItems),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Pet animals you like to have:',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) => value == null
//                               ? "Select which animal you like"
//                               : null,
//                           dropdownColor: Colors.white,
//                           value: petSelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               petSelectedValue = newValue!;
//                             });
//                           },
//                           items: petMenuItems),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'What would you love to do in free time?',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) => value == null
//                               ? "Select what you do in free time"
//                               : null,
//                           dropdownColor: Colors.white,
//                           value: freeTimeSelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               freeTimeSelectedValue = newValue!;
//                             });
//                           },
//                           items: freeTimeMenuItems),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Destination you will like to visit for holiday:',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) => value == null
//                               ? "Select where would you visit for holiday"
//                               : null,
//                           dropdownColor: Colors.white,
//                           value: holidaySelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               holidaySelectedValue = newValue!;
//                             });
//                           },
//                           items: holidayMenuItems),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Where You would like to go for Shopping:',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) => value == null
//                               ? "Select where would you go for shopping"
//                               : null,
//                           dropdownColor: Colors.white,
//                           value: shoppingSelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               shoppingSelectedValue = newValue!;
//                             });
//                           },
//                           items: shoppingMenuItems),
//                       const SizedBox(height: 15),
//                       const Text(
//                         'if you got 1 lakh, where would you like to spent?',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const SizedBox(height: 5),
//                       DropdownButtonFormField<String?>(
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Colors.white, width: 1),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                           ),
//                           validator: (value) => value == null
//                               ? "Select how would you spent your money"
//                               : null,
//                           dropdownColor: Colors.white,
//                           value: spentSelectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               spentSelectedValue = newValue!;
//                             });
//                           },
//                           items: spentMenuItems),
//                     ],
//                   )),
//               const SizedBox(height: 35),
//               ConstrainedBox(
//                 constraints: BoxConstraints.tightFor(
//                     width: double.infinity, height: size.height * 0.055),
//                 child: ElevatedButton(
//                   child: Text(
//                     'Submit',
//                     maxLines: 1,
//                     style: TextStyle(
//                         fontSize: size.height * 0.014 + size.width * 0.014),
//                   ),
//                   onPressed: () {
//                     FocusManager.instance.primaryFocus?.unfocus();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: ChooseColor(0).buttonColor,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 55,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// */
