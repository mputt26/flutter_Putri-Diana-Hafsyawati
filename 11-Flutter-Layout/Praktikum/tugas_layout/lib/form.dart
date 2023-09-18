import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'button_widget.dart';

class Contact {
  final String name;
  final String phone;

  Contact(this.name, this.phone);
}

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
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
}


