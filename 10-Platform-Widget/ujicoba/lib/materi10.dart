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
        children: <Widget>[
          ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              ListTile(
                title: Text('Learn Flutter', style: TextStyle(fontSize: 20)),
                onTap: () {},
              ),
              Divider(thickness: 2.0, endIndent: 0.0),
              ListTile(
                title: Text('Learn ReactJS', style: TextStyle(fontSize: 20)),
                onTap: () {},
              ),
              ListTile(
                title: Text('Learn VueJS', style: TextStyle(fontSize: 20)),
                onTap: () {},
              ),
              Divider(thickness: 2.0, endIndent: 0.0),
              ListTile(
                title:
                    Text('Learn Tailwind CSS', style: TextStyle(fontSize: 20)),
                onTap: () {},
              ),
              Divider(thickness: 2.0, endIndent: 0.0),
              ListTile(
                title: Text('Learn UI/UX', style: TextStyle(fontSize: 20)),
                onTap: () {},
              ),
              Divider(thickness: 2.0, endIndent: 0.0),
              ListTile(
                title: Text('Learn Figma', style: TextStyle(fontSize: 20)),
                onTap: () {},
              ),
              Divider(thickness: 2.0, endIndent: 0.0),
              ListTile(
                title: Text('Learn Digital Marketing',
                    style: TextStyle(fontSize: 20)),
                onTap: () {},
              ),
              Divider(thickness: 2.0, endIndent: 0.0),
            ],
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: CircleAddButton(
              onTap: () {
                print('Tombol Lingkaran Ditekan');
              },
            ),
          ),
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
