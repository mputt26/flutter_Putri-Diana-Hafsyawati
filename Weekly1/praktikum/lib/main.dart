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
    return const HelloWorld();
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
          SizedBox(height: 15.0),
          FormInput(firstnameControllers, lastnameControllers, emailControllers,
              messageControllers)
        ]),
      ),
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

Widget FormInput(
  TextEditingController firstnameControllers,
  TextEditingController lastnameControllers,
  TextEditingController emailControllers,
  TextEditingController messageControllers,
) {
  return Column(
    children: [
      Row(
        children: [
          TextFormField(
            controller: firstnameControllers,
            decoration: InputDecoration(labelText: 'First Name'),
          )
        ],
      ),
    ],
  );
}
