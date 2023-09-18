import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Contact {
  final String name;
  final String phone;

  Contact(this.name, this.phone);
}

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatefulWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  var namaControllers = TextEditingController();
  var nomorControllers = TextEditingController();

  var formKey = GlobalKey<FormState>();

  Contact contact = Contact('', '');
  @override
  void dispose() {
    namaControllers.dispose();
    nomorControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact'),
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //icon hp
              iconPhone(),
              SizedBox(
                height: 15.0,
              ),
              //judul
              tittleContact(),
              SizedBox(
                height: 10.0,
              ),
              //text
              longText(),
              Divider(thickness: 2.0, indent: 20.0, endIndent: 20.0),

              //form
              formInput(namaControllers),

              //button checkbox dan lingkaran
              buttonSubmit(),

              //button submit dan save
              buttonSubmit(),

              SizedBox(
                height: 20.0,
              ),

              contactWidget(),
            ],
          ),
        ),

        //Navigation Bar
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
            ),
          ],
        ),
      ),
    );
  }
}

Widget iconPhone() {
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    child: Icon(
      Icons.phone_android,
      size: 40,
      color: Colors.black,
    ),
  );
}

Widget tittleContact() {
  return Container(
    child: Text('Create New Contact'),
  );
}

Widget longText() {
  return Container(
    margin: EdgeInsets.only(left: 20.0, right: 20.0),
    child: Text(
        'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. '),
  );
}

Widget formInput(TextEditingController namaControllers, formKey,
    TextEditingController nomorControllers) {
  return Container(
    child: Container(
      margin: EdgeInsets.only(right: 20.0, left: 20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextField(
              controller: namaControllers,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Insert Your Name',
                fillColor: Color.fromARGB(100, 103, 80, 164),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
            ),
            // ThemeData(
            //   colorSchemeSeed: Colors.amber,
            //   useMaterial3: true,
            // ),

            SizedBox(height: 15.0),
            TextField(
              controller: nomorControllers,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nomor',
                hintText: '+62...',
                fillColor: Color.fromARGB(100, 103, 80, 164),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buttonSubmit() {
  return Container(
    margin: EdgeInsets.only(right: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     namaControllers.clear();
            //     nomorControllers.clear();
            //     setState(
            //       () {
            //         radioValue = '';
            //         checkValue = false;
            //       },
            //     );
            //   },
            //   child: const Text('Reset'),
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30.0),
            //     ),
            //     backgroundColor: Colors.red,
            //   ),
            // ),
            // SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Color.fromARGB(255, 103, 80, 164),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget contactTittle() {
  return Container(
    child: Text(
      'List Contacts',
      style: TextStyle(fontSize: 30.0),
    ),
  );
}

Widget contactWidget() {
  return Container(
    decoration: BoxDecoration(
      color: Color.fromARGB(64, 255, 200, 253),
      borderRadius: BorderRadius.circular(20.0),
    ),
    margin: EdgeInsets.all(20.0),
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        final contact = contacts[index];
        final avatarText = contact.name[0];
        return ListTile(
          leading: CircleAvatar(
            child: Text(avatarText),
            backgroundColor: Color.fromARGB(184, 102, 80, 164),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(contacts[index].name),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          subtitle: Text(contacts[index].phone),
          onTap: () {},
        );
      },
    ),
  );
}
