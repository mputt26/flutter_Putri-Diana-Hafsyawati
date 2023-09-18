import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;

  Contact(this.name, this.phone);
}

final List<Contact> contacts = [
  Contact('Putri Diana Hafsyawati', '08943659087'),
  Contact('Delia Sepiana', '08964535224'),
  Contact('Anisa', '08964539684'),
];

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
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
          final contact = contacts[index]; 
          final avatarText = contact.name[0];
            return ListTile(
              leading: CircleAvatar( 
              child: Text(avatarText),
                backgroundColor: Color.fromARGB(255, 0, 114, 63),
              ),// Ganti dengan ikon yang sesuai
              title: Text(contacts[index].name),
              subtitle: Text(contacts[index].phone),
              onTap: () {
        // Tambahkan aksi ketika item kontak diklik di sini
      },
    );
  },
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