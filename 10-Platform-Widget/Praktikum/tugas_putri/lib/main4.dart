import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  _HelloWorldState createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  int _selectedIndex = 0; // Indeks item terpilih di BottomNavigationBar

  // Daftar halaman yang sesuai dengan setiap item di BottomNavigationBar
  final List<Widget> _pages = [
    Center(child: Text('Halaman 1')),
    Center(child: Text('Halaman 2')),
    Center(child: Text('Halaman 3')),
  ];

  // Fungsi untuk mengubah halaman saat item di BottomNavigationBar dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Color(0xFF6200EE),
          middle: Text(
            'PutriApp',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
          ),
          trailing: Icon(CupertinoIcons.search,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        child: Center(
          child: Text('Tampilan cupertino'),
        ),
        
      ),
    );
  }
}
