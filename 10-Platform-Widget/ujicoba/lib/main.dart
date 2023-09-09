import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Putri Apps'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Ujicoba'),
              ),
              ListTile(
                title: Text('judul 1'),
                onTap: () {},
              ),
              ListTile(
                title: Text('judul 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('Material'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Tab 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Tab 2',
            ),
          ],
        ),
      ),
    );
  }
}
