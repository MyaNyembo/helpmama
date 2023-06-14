import 'package:flutter/material.dart';
import 'package:monapp/video_info.dart';

import 'bebe.dart';
import 'home_page.dart';


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> screens = [HomePage(), Infobebe(), VideoInfo()];

  @override
  Widget build(BuildContext context) {
    int myIndex = 0;

    return Scaffold(
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.sms_failed), label: "Moi"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Mon bébé"),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Expert"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pinkAccent,
      ),
    );
  }
}


