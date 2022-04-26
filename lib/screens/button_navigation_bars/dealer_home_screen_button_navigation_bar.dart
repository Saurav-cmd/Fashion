import 'package:fashion_paints/colors/colors_file.dart';
import 'package:fashion_paints/screens/dealer_home_page.dart';
import 'package:fashion_paints/screens/message/message_screen.dart';
import 'package:fashion_paints/screens/notice/notice_screen.dart';
import 'package:fashion_paints/screens/profile_screen/profile_screen.dart';
import 'package:fashion_paints/screens/store/store_screen.dart';
import 'package:flutter/material.dart';


class DealerBottomNavigation extends StatefulWidget {
  const DealerBottomNavigation({Key? key}) : super(key: key);

  @override
  _DealerBottomNavigationState createState() => _DealerBottomNavigationState();
}

class _DealerBottomNavigationState extends State<DealerBottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex==0?const DealerHomePage():_selectedIndex==1?const NoticeHomeScreen():_selectedIndex==2?const FashionChat():  _selectedIndex==3?const StoreScreen():_selectedIndex==4?const ProfileScreen():null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:const<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',backgroundColor:Color(0xFFE10A35),),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy_outlined),label: 'Notices',backgroundColor:Color(0xFFE10A35),),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Message',backgroundColor:Color(0xFFE10A35),),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: 'Store',backgroundColor:Color(0xFFE10A35),),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'Profile',backgroundColor:Color(0xFFE10A35),),
        ],
        backgroundColor:ChooseColor(0).bottomNavigationBarColor,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        onTap:(index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
