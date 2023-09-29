import 'package:flutter/material.dart';
import 'detail_galery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid View Example'),
        ),
        body: MyGridView(),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        CardExample(
          imageUrl:
              'https://asset-a.grid.id//crop/0x0:0x0/700x465/photo/2022/07/15/panda-3875289_640jpg-20220715103626.jpg',
        ),
        CardExample(
          imageUrl:
              'https://i.pinimg.com/564x/6f/78/f3/6f78f3688fbef5350315187b45550e91.jpg',
        ),
      ],
    );
  }
}

class CardExample extends StatelessWidget {
  final String imageUrl;

  const CardExample({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(30.0), // Tambahkan padding
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.network(imageUrl)),
                    SizedBox(height: 12.0), // Berikan jarak di bawah gambar
                    //Text('Gambar 1',
                    //style: TextStyle(
                    //  fontSize: 14.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6.0), // Berikan jarak
                    Text('Apakah Anda ingin melihat lebih detail ?'),
                    SizedBox(height: 10.0), // Berikan jarak
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          child: const Text('Ya'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailGaleri(),
                              ),
                            );
                          },
                        ),
                        ElevatedButton(
                          child: const Text('Tidak'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );

          debugPrint('Card tapped.');
        },
        child: SizedBox(
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
