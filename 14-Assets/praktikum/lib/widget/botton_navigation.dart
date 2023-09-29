import 'package:flutter/material.dart';

class mybottomnav extends StatelessWidget {
  const mybottomnav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'explore',
        ),
      ],
    );
  }
}