import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HelloWorld();
  }
}

class HelloWorld extends StatefulWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  var firstnameControllers = TextEditingController();
  var lastnameControllers = TextEditingController();
  var emailControllers = TextEditingController();
  var messageControllers = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    firstnameControllers.dispose();
    lastnameControllers.dispose();
    emailControllers.dispose();
    messageControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Putri Apps'),
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.only(left: 5.0),
              child: Image.asset(
                'assets/images/logoP.png',
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            child: Image.asset('assets/gif/welcome.gif'),
          ),
          SizedBox(height: 15.0),
          Welcoming(),
          SizedBox(height: 25.0),
          Form(
            key: formKey,
            child: FormInput(firstnameControllers, lastnameControllers,
                emailControllers, messageControllers, () {
              if (formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Text('Pesan Telah Terkirim!'),
                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Oke'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting'),
          ]),
    );
  }
}

Welcoming() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Text('Contact Us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
            )),
      ),
      SizedBox(height: 15.0),
      Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
            child: Text(
              'Welcome To Putri Apps . Need to get in touch with us? Either fill out the form with your inquiry or find the department email you`d like to contact below',
              textAlign: TextAlign.center,
            ),
          )),
    ],
  );
}

// typedef SubmitCallback = void Function(
//     BuildContext context, TextEditingController firstnameControllers);
Widget FormInput(
  TextEditingController firstnameControllers,
  TextEditingController lastnameControllers,
  TextEditingController emailControllers,
  TextEditingController messageControllers,
  VoidCallback onSubmitCallback,
  // SubmitCallback onSubmitCallback
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 11),
            child: SizedBox(
              width: 180,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First Name*', textAlign: TextAlign.left),
                    TextFormField(
                        controller: firstnameControllers,
                        validator: (value) {
                          final trimmedValue = value!.trim();
                          if (trimmedValue.isEmpty) {
                            return 'Wajib diisi';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(gapPadding: 10),
                            hintText: 'insert your name'),
                        onChanged: (firstname) {
                          print('$firstname');
                        }),
                  ]),
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Name*',
                      textAlign: TextAlign.left,
                    ),
                    TextFormField(
                        controller: lastnameControllers,
                        validator: (value) {
                          final trimmedValue = value!.trim();
                          if (trimmedValue.isEmpty) {
                            return 'Wajib diisi';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(gapPadding: 10),
                            hintText: 'insert your name'),
                        onChanged: (lastname) {
                          print('$lastname');
                        }),
                  ],
                )),
          )
        ],
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 11, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Email*'),
          TextFormField(
              controller: emailControllers,
              validator: (value) {
                final trimmedValue = value!.trim();
                if (trimmedValue.isEmpty) {
                  return 'Wajib diisi';
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(gapPadding: 10),
                  hintText: 'youremail@email.com'),
              onChanged: (email) {
                print('$email');
              })
        ]),
      ),
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 11, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('What can we help you With?'),
          TextFormField(
            controller: messageControllers,
            validator: (value) {
              final trimmedValue = value!.trim();
              if (trimmedValue.isEmpty) {
                return 'Wajib diisi';
              }
            },
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(border: OutlineInputBorder()),
          )
        ]),
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            child: Text('Submit'),
            onPressed: onSubmitCallback,
          )
        ],
      )
    ],
  );
}

void onSubmitCallback(
    BuildContext context, TextEditingController firstnameControllers) {
  firstnameControllers.clear();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          constraints: BoxConstraints(minWidth: 10.0, maxHeight: 20.0),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Information!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10),
              Text('Pesan Telah Terkirim!'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Oke'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
