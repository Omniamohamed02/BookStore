import 'package:flutter/material.dart';


class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({

     required this.selectedIndex,
     required this.onItemTapped,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFF2D9BB),
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFF17212C),
          onTap: onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
    );
  }
}