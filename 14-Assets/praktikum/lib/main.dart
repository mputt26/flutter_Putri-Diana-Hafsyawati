import 'package:flutter/material.dart';
import 'package:praktikum/widget/botton_navigation.dart';
import 'package:praktikum/widget/drawer.dart';
import 'package:praktikum/screen/galery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery Trial',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 68, 186, 177)),
        useMaterial3: true,
      ),
      home: Scaffold(
        drawer: MyDrawer(),
        bottomNavigationBar: mybottomnav(),
        appBar: AppBar(
          title: Text("My Gallery"),
          backgroundColor: Color.fromARGB(255, 0, 154, 141),
          centerTitle: true,
        ),
        body: MyGridView(),
        //bottomSheet: BottomSheet(builder: , onClosing: () {  },),
      ),
    );
  }
}
