import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/screens/home_screen.dart';
import 'package:fashion_paints/screens/login_screen.dart';
import 'package:flutter/material.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex==0?const HomePage():_selectedIndex==2?const LoginScreen():null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:const<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',backgroundColor:Color(0xFFE10A35),),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notification',backgroundColor:Color(0xFFE10A35),),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'Profile',backgroundColor:Color(0xFFE10A35),),
        ],
        backgroundColor:ChooseColor(0).bottomNavigationBarColor,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        onTap: onTapped,
      ),
    );
  }
}
