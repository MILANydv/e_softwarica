import 'package:e_softwarica/screens/add_student.dart';
import 'package:e_softwarica/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({required Key key}) : super(key: key);

  @override
  _ButtomNavigationState createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Home(),
    AddStudent(),
    Text('Page 3'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 81, 56, 194),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_sharp),
            label: 'Add Student',
            backgroundColor: Color.fromARGB(255, 47, 39, 200),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'About Us',
            backgroundColor: Color.fromARGB(255, 68, 43, 229),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 15, 9, 65),
        onTap: _onItemTapped,
      ),
    );
  }
}
