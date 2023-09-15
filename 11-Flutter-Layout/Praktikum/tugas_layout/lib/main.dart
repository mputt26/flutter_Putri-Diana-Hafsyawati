import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6200EE),
        title: Text('Contacts'),
        centerTitle: true,
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
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
      body: Stack(
        children: [
          Positioned(
            top: 30,
            right: 0,
            left: 0,
            child: Center(
              child: Icon(
                Icons.phone_android,
                size: 40,
              ),
            ),
          ),
          Positioned(
            top: 80.0,
            right: 0,
            left: 0,
            child: Center(
              child: Text(
                'Create New Contact',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ),
          Positioned(
            top: 120.0,
            right: 20.0,
            left: 20.0,
            child: Center(
              child: Text(
                'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
                style: TextStyle(fontSize: 15.0),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Positioned(
              top: 180.0,
              right: 20.0,
              left: 20.0,
              child: Center(
                child: Divider(thickness: 2.0, endIndent: 0.0),
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          )
        ],
      ),
    );
  }
}

class CircleAddButton extends StatelessWidget {
  final VoidCallback onTap;

  const CircleAddButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: Color(0xFF03DAC5),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
