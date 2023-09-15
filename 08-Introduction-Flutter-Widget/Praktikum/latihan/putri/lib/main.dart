import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0; // Indeks terkini untuk BottomNavigationBar

  // Daftar halaman yang akan ditampilkan sesuai dengan indeks BottomNavigationBar
  final List<Widget> _pages = [
    Center(
      child: Text('This is Home'),
    ),
    Center(
      child: Text('This is Setting'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MaterialApps'),
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
                child: Text('Home'),
              ),
              ListTile(
                title: Text('Setting'),
                onTap: () {},
              ),
              ListTile(
                title: Text('judul 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(
              leading: CircleAvatar(child: Text('P')),
              title: Text('Putri Diana Hafsyawati'),
              subtitle: Text('08943659087'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('P')),
              title: Text('Delia Sepiana'),
              subtitle: Text('08964535224'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('P')),
              title: Text('Anisa'),
              subtitle: Text('08964539684'),
            ),
            ListTile(
              leading: CircleAvatar(
                  child: Text('P'),
                  backgroundColor: Color.fromARGB(255, 0, 114, 63)),
              title: Text('Kak Muchson'),
              subtitle: Text('0896453321'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('P')),
              title: Text('Putri Diana Hafsyawati'),
              subtitle: Text('08943659087'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('P')),
              title: Text('Delia Sepiana'),
              subtitle: Text('08964535224'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('P')),
              title: Text('Anisa'),
              subtitle: Text('08964539684'),
            ),
            ListTile(
              leading: CircleAvatar(
                  child: Text('P'),
                  backgroundColor: Color.fromARGB(255, 0, 114, 63)),
              title: Text('Kak Muchson'),
              subtitle: Text('0896453321'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('P')),
              title: Text('Putri Diana Hafsyawati'),
              subtitle: Text('08943659087'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('P')),
              title: Text('Delia Sepiana'),
              subtitle: Text('08964535224'),
            ),
            ListTile(
              leading: CircleAvatar(child: Text('P')),
              title: Text('Anisa'),
              subtitle: Text('08964539684'),
            ),
            ListTile(
              leading: CircleAvatar(
                  child: Text('P'),
                  backgroundColor: Color.fromARGB(255, 0, 114, 63)),
              title: Text('Kak Muchson'),
              subtitle: Text('0896453321'),
            ),],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
