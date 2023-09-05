import 'package:flutter/material.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Putri App'),
        ),
        body: Center(
          child: Text(
            'Material',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize:
                  24.0, // Ubah angka ini sesuai dengan ukuran font yang Anda inginkan
            ),
          ),
        ),
      ),
    );
  }
}
