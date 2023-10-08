import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class GridviewScreen extends StatefulWidget {
  const GridviewScreen({Key? key}) : super(key: key);

  @override
  State<GridviewScreen> createState() => _GridviewScreenState();
}

class _GridviewScreenState extends State<GridviewScreen> {
  List<List<String>> dataList = [
    ['assets/kucing.jpg', 'Cat'],
    ['assets/kudalaut.jpeg', 'Sea Horse'],
    ['assets/nemo.jpeg', 'Nemo Fish'],
    ['assets/panda.jpg', 'Panda'],
    ['assets/ubur.jpeg', 'Jellyfish'],
    ['assets/penyu.jpg', 'Turtle'],
  ];

  String? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeri"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.0,
          crossAxisCount: 2, // Jumlah row gambar
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        itemCount: dataList.length,
        shrinkWrap: true,
        // physics: const ScrollPhysics(), //Mematikan scroll
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Saat gambar diklik, simpan gambar yang dipilih
              setState(() {
                selectedImage = dataList[index][0];
              });
              // Tampilkan BottomSheet
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: profileSheet(index: index)));
            },
            child: Image.asset(
              dataList[index][0],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget profileSheet({required int index}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Lihat Foto"),
                    content: const Text("Apakah anda ingin membuka foto ini?"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Tidak"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text("Ya"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed('/showImage',
                              arguments: dataList[index][0]);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage(
                selectedImage!,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(dataList[index][1],
              style: GoogleFonts.dancingScript(fontSize: 25)),
        ],
      ),
    );
  }
}
