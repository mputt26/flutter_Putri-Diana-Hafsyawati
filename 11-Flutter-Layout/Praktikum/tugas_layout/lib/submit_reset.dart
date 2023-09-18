import 'package:flutter/material.dart';

class SubmitReset extends StatefulWidget {
  const SubmitReset({super.key});

  @override
  State<SubmitReset> createState() => _SubmitResetState();
}

class _SubmitResetState extends State<SubmitReset> {
  //method untuk form input
  var namaControllers = TextEditingController();
  var nomorControllers = TextEditingController();

  var formKey = GlobalKey<FormState>();

  //properti untuk radio
  var radioValue = '';
  var checkValue = false;
  @override
  //menghapus controller form input ketika widget tidak digunakan
  void dispose() {
    namaControllers.dispose();
    nomorControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  namaControllers.clear();
                  nomorControllers.clear();
                  setState(
                    () {
                      radioValue = '';
                      checkValue = false;
                    },
                  );
                },
                child: const Text('Reset'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(width: 10),
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
}
