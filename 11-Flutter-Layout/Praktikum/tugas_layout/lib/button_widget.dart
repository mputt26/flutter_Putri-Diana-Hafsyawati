import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => ButtonWidgeteState();
}

class ButtonWidgeteState extends State<ButtonWidget> {
  var radioValue = '';
  var checkValue = false;
  var dropdownValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih Jenis Kelamin :',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Laki-Laki',
              groupValue: radioValue,
              onChanged: (String? value) {
                setState(
                  () {
                    radioValue = value ?? '';
                  },
                );
              },
            ),
            title: const Text('Laki-Laki'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Perempuan',
              groupValue: radioValue,
              onChanged: (String? value) {
                setState(
                  () {
                    radioValue = value ?? '';
                  },
                );
              },
            ),
            title: const Text('Perempuan'),
          ),
          //CHECKBOX
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Peserta MSIB :',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              ListTile(
                leading: Checkbox(
                  value: checkValue,
                  onChanged: (bool? value) {
                    setState(
                      () {
                        checkValue = value ?? false;
                      },
                    );
                  },
                ),
                title: const Text('Alterra Batch 5'),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Program Yang diikuti :',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              DropdownButton(
                value: dropdownValue,
                onChanged: (int? value) {
                  setState(() {
                    dropdownValue = value ?? 0;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: 0,
                    child: Text('Pilih Program...'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
