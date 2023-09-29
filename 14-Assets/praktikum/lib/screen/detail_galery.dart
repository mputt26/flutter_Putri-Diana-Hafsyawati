import 'package:flutter/material.dart';
import 'package:praktikum/widget/botton_navigation.dart';
import 'package:praktikum/widget/drawer.dart';

class DetailGaleri extends StatefulWidget {
  const DetailGaleri({super.key});

  @override
  State<DetailGaleri> createState() => _DetailGaleriState();
}

class _DetailGaleriState extends State<DetailGaleri> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery Trial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        drawer: MyDrawer(),
        bottomNavigationBar: mybottomnav(),
        appBar: AppBar(
          title: Text("My Gallery"),
          backgroundColor: Color.fromARGB(255, 140, 194, 189),
          centerTitle: true,
        ),
        body: Text('halaman Baru'),
        //bottomSheet: BottomSheet(builder: , onClosing: () {  },),
      ),
    );
  }
}
