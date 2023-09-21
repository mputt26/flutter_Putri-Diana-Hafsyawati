import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'contacts_data.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HelloWorld();
  }
}

class HelloWorld extends StatefulWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Contact newContact = Contact('', '');
  List<Contact> contacts = [];
  @override
  void initState() {
    super.initState();
    contacts = contacts;
  }

  var namaControllers = TextEditingController();
  var nomorControllers = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    namaControllers.dispose();
    nomorControllers.dispose();
    super.dispose();
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            formInput(namaControllers, nomorControllers, formKey),

            DatePicker(),
            //button checkbox dan lingkaran
            buttonSubmit(
              namaControllers,
              nomorControllers,
              () {
                setState(() {
                  contacts.add(newContact);
                });
              },
              newContact,
            ),

            SizedBox(
              height: 20.0,
            ),
            contactTittle(),
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
    );
  }

  Column DatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final selectData = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectData != null) {
                    _dueDate = selectData;
                  }
                });
              },
            )
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
      ],
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

Widget formInput(
  TextEditingController namaControllers,
  TextEditingController nomorControllers,
  GlobalKey<FormState> formKey,
) {
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

Widget buttonSubmit(
  TextEditingController namaControllers,
  TextEditingController nomorControllers,
  VoidCallback setStateCallback,
  Contact newContact,
) {
  return Container(
    margin: EdgeInsets.only(right: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                String nama = namaControllers.text;
                String phone = nomorControllers.text;

                newContact = Contact(nama, phone);
                contacts.add(newContact);

                namaControllers.clear();
                nomorControllers.clear();
                setStateCallback();
              },
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

class contactWidget extends StatefulWidget {
  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<contactWidget> {
  // List<Contact> contacts = []; // Move the contacts list here

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: 200,
      decoration: BoxDecoration(
        color: Color.fromARGB(64, 255, 200, 253),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListView.builder(
        itemCount: contacts.length, // Use the contacts list from the state
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
                        onPressed: () => AlertEdit(context, index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            contacts.removeAt(index);
                          });
                        },
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
}

// Widget buildDatePicker(BuildContext context) {
//   var _dueDate;
//   return Container(
//     margin: EdgeInsets.only(left: 20.0, right: 20.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text('Date'),
//             TextButton(
//               child: const Text('Select'),
//               onPressed: () {},
//             )
//           ],
//         ),
//         // Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
//       ],
//     ),
//   );
// }

Future<String?> AlertEdit(BuildContext context, int index) {
  final contact = contacts[index].name;
  TextEditingController nameControllerEdit =
      TextEditingController(text: contact[index].name);

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('AlertDialog Title'),
      content: Column(
        children: [
          Text('nama'),
          TextField(
            controller: nameControllerEdit,
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              //logika untuk menindih value berdsarkan index
              print(contacts);
              setState(() {
                contacts[index].name = nameControllerEdit.text;
              });
              Navigator.pop(context);
              print(index);

              print('submit edit');
            },
            child: Text('Submit Edit')),
        TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
            child: Text('Cancel'))
      ],
    ),
  );
}

      // 1. kita panggil semua data
      // print('edit $data_kontak');
      // 2. munculin box baru (show dialog/alert dialog)
      // 3. di dalam box itu (show dialog/alert dialog) membuat form untuk memperharui data
      // 4. masukkan data sebelumnya ke alert dialog tersebut(tempat kita untuk mendapatkan data baru)
      // 5. ketika button di klik, maka data akan berganti