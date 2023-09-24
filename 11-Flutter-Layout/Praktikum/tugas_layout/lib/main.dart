import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'contacts_data.dart';
import 'package:intl/intl.dart';

final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
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
  Color _currentColor = Colors.orange;
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

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 5),
      ),
    );
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

            // DatePicker(),
            // BuildColorPicker(context, _currentColor),
            //button checkbox dan lingkaran
            buttonSubmit(
              namaControllers,
              nomorControllers,
              formKey,
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
            TextFormField(
              controller: namaControllers,
              validator: (value) {
                final trimmedValue = value!.trim();
                final words = trimmedValue.split(' ');
                if (words.length < 2) {
                  return 'Nama harus terdiri dari minimal 2 kata';
                }
                for (final word in words) {
                  if (!word.isEmpty &&
                      !word
                          .substring(0, 1)
                          .toUpperCase()
                          .contains(RegExp(r'[A-Z]'))) {
                    return 'Setiap kata harus dimulai dengan huruf kapital.';
                  }
                }
                //validasi kosong
                if (trimmedValue.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                if (trimmedValue
                    .contains(RegExp(r'[0-9!@#%^&*(),.?":{}|<>]'))) {
                  return 'Nama tidak boleh mengandung angka atau karakter khusus';
                }
                return null;
              },
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
            SizedBox(height: 15.0),
            TextFormField(
              validator: (value) {
                final nomorTelepon = value!.trim();
                if (nomorTelepon.isEmpty) {
                  return 'Nomor telepon harus diisi';
                }
                if (!nomorTelepon.startsWith('0')) {
                  return 'Nomor telepon harus dimulai dengan angka 0.';
                }
                if (!RegExp(r'^0[0-9]{7,10}$').hasMatch(nomorTelepon)) {
                  return 'Nomor telepon tidak valid. Harus dimulai dengan 0 dan terdiri dari 8 hingga 10 angka.';
                }
                return null;
              },
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
  GlobalKey<FormState> formKey,
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
                if (formKey.currentState!.validate()) {
                  String nama = namaControllers.text;
                  String phone = nomorControllers.text;

                  newContact = Contact(nama, phone);
                  contacts.add(newContact);

                  namaControllers.clear();
                  nomorControllers.clear();
                  setStateCallback();
                }
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
                        onPressed: () =>
                            AlertEdit(context, index, _scaffoldKey),
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

  // final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  //     GlobalKey<ScaffoldMessengerState>();

  // Future<String?> AlertEdit(BuildContext context, int index,
  //     GlobalKey<ScaffoldMessengerState> scaffoldKey) {
  //   final contact = contacts[index].name;
  //   final contact2 = contacts[index].phone;
  //   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //   TextEditingController nameControllerEdit =
  //       TextEditingController(text: contact);
  //   TextEditingController nomorControllerEdit =
  //       TextEditingController(text: contact2);

  //   return showDialog<String>(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       title: const Text('Edit Data Contact', textAlign: TextAlign.center),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       content: Container(
  //         width: 400,
  //         height: 170,
  //         // child: Column(
  //         //   mainAxisSize: MainAxisSize.min,
  //         //   children: [
  //         //     Text('nama'),
  //         //     TextFormField(
  //         //       validator: (value) {
  //         //         final trimmedValue = value!.trim();
  //         //         final words = trimmedValue.split(' ');
  //         //         if (words.length < 2) {
  //         //           return 'Nama harus terdiri dari minimal 2 kata';
  //         //         }
  //         //         for (final word in words) {
  //         //           if (!word.isEmpty &&
  //         //               !word
  //         //                   .substring(0, 1)
  //         //                   .toUpperCase()
  //         //                   .contains(RegExp(r'[A-Z]'))) {
  //         //             return 'Setiap kata harus dimulai dengan huruf kapital.';
  //         //           }
  //         //         }
  //         //         //validasi kosong
  //         //         if (trimmedValue.isEmpty) {
  //         //           return 'Nama tidak boleh kosong';
  //         //         }
  //         //         if (trimmedValue
  //         //             .contains(RegExp(r'[0-9!@#%^&*(),.?":{}|<>]'))) {
  //         //           return 'Nama tidak boleh mengandung angka atau karakter khusus';
  //         //         }
  //         //         return null;
  //         //       },
  //         //       controller: nameControllerEdit,
  //         //     ),
  //         //     SizedBox(height: 20),
  //         //     Text('Nomor'),
  //         //     TextFormField(
  //         //       keyboardType: TextInputType.number,
  //         //       validator: (value) {
  //         //         final nomorTelepon = value!.trim();
  //         //         if (nomorTelepon.isEmpty) {
  //         //           return 'Nomor telepon harus diisi oleh user.';
  //         //         }
  //         //         if (!nomorTelepon.startsWith('0')) {
  //         //           return 'Nomor telepon harus dimulai dengan angka 0.';
  //         //         }
  //         //         if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(nomorTelepon)) {
  //         //           return 'Nomor telepon tidak valid. Harus dimulai dengan 0 dan terdiri dari 8 hingga 15 angka.';
  //         //         }
  //         //         return null;
  //         //       },
  //         //       controller: nomorControllerEdit,
  //         //     ),
  //         //   ],
  //         // ),
  //       ),
  //       actions: [
  //         ElevatedButton(
  //           onPressed: () {
  //             final enteredName = nameControllerEdit.text;
  //             final namePattern = RegExp(
  //               r'^[A-Z][a-z]* [A-Z][a-z]*$',
  //             );

  //             if (!namePattern.hasMatch(enteredName)) {
  //             } else {
  //               setState(() {
  //                 contacts[index].name = nameControllerEdit.text;
  //               });
  //               Navigator.pop(context);
  //               print(index);
  //               print('submit edit');
  //             }
  //           },
  //           child: Text('Submit Edit'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context, 'Cancel');
  //           },
  //           child: Text('Cancel'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Future<String?> AlertEdit(
    BuildContext context,
    int index,
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
  ) {
    final contact = contacts[index].name;
    final contact2 = contacts[index].phone;

    TextEditingController nameControllerEdit =
        TextEditingController(text: contact);
    TextEditingController nomorControllerEdit =
        TextEditingController(text: contact2);

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Edit Data Contact', textAlign: TextAlign.center),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: Container(
          width: 400,
          height: 200,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('nama'),
                TextFormField(
                  validator: (value) {
                    // Validasi Nama
                    final trimmedValue = value!.trim();
                    final words = trimmedValue.split(' ');
                    if (words.length < 2) {
                      return 'Nama harus terdiri dari minimal 2 kata';
                    }
                    for (final word in words) {
                      if (!word.isEmpty &&
                          !word
                              .substring(0, 1)
                              .toUpperCase()
                              .contains(RegExp(r'[A-Z]'))) {
                        return 'Setiap kata harus dimulai dengan huruf kapital.';
                      }
                    }
                    // Validasi kosong
                    if (trimmedValue.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    if (trimmedValue
                        .contains(RegExp(r'[0-9!@#%^&*(),.?":{}|<>]'))) {
                      return 'Nama tidak boleh mengandung angka atau karakter khusus';
                    }
                    return null;
                  },
                  controller: nameControllerEdit,
                ),
                SizedBox(height: 20),
                Text('Nomor'),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    final nomorTelepon = value!.trim();
                    if (nomorTelepon.isEmpty) {
                      return 'Nomor telepon harus diisi oleh user.';
                    }
                    if (!nomorTelepon.startsWith('0')) {
                      return 'Nomor telepon harus dimulai dengan angka 0.';
                    }
                    if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(nomorTelepon)) {
                      return 'Nomor telepon tidak valid. Harus dimulai dengan 0 dan terdiri dari 8 hingga 15 angka.';
                    }
                    return null;
                  },
                  controller: nomorControllerEdit,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final enteredName = nameControllerEdit.text;
                final enteredPhone = nomorControllerEdit.text;
                final namePattern = RegExp(
                  r'^[A-Z][a-z]* [A-Z][a-z]*$',
                );
                if (!namePattern.hasMatch(enteredName)) {
                } else {
                  setState(() {
                    contacts[index].name = enteredName;
                    contacts[index].phone = enteredPhone;
                  });
                  Navigator.pop(context);
                  print(index);
                  print('Simpan');
                }
                // Navigator pop.(context)();
              }
            },
            child: const Text('Simpan'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancle');
            },
            child: const Text('Cancle'),
          ),
        ],
      ),
    );
  }
}
