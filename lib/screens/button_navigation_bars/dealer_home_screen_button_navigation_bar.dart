import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/screens/dealer_home_page.dart';
import 'package:flutter/material.dart';


class DealerBottomNavigation extends StatefulWidget {
  const DealerBottomNavigation({Key? key}) : super(key: key);

  @override
  _DealerBottomNavigationState createState() => _DealerBottomNavigationState();
}

class _DealerBottomNavigationState extends State<DealerBottomNavigation> {
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
      body: _selectedIndex==0?const DealerHomePage():null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:const<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',backgroundColor:Color(0xFFE10A35),),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy_outlined),label: 'Notification',backgroundColor:Color(0xFFE10A35),),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Message',backgroundColor:Color(0xFFE10A35),),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'Store',backgroundColor:Color(0xFFE10A35),),
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
