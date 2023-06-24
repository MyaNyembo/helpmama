import 'package:flutter/material.dart';
import 'package:monapp/DemoApp.dart';

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

  static List<Widget> screens = [
    const HomePage(),
    DemoApp()
  ];

  @override
  Widget build(BuildContext context) {
    int myIndex = 0;

    return Scaffold(
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Calendrier"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pinkAccent,
      ),
    );
  }
}
