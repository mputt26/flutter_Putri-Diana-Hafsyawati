import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(color: Color.fromARGB(255, 0, 154, 141)),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: Text('1'),
        ),
        ListTile(
          title: Text('2'),
        )
      ],
    ));
  }
}
