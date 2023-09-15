import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TampilNama(),
    );
  }
}

class TampilNama extends StatelessWidget {
  const TampilNama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('daftar murid'),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: 22,
            itemBuilder: (BuildContext context, index) {
              return Text('nama $index');
            },
          ),
        ),
        SizedBox(
          height: 250,
          child: GridView.builder(
            itemCount: 22,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Text('nama $index');
            },
          ),
        ),
      ],
    ));
  }
}