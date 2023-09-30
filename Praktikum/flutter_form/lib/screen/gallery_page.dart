import 'package:flutter/material.dart';
import 'detail_image.dart';

void main() {
  runApp(MaterialApp(
    home: GalleryPage(),
  ));
}

class GalleryPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://st2.depositphotos.com/5460180/8140/i/450/depositphotos_81405258-stock-photo-three-pandas.jpg',
    'https://static9.depositphotos.com/1650978/1120/i/450/depositphotos_11206938-stock-photo-panda-in-playing-time.jpg',
    'https://cdn.pixabay.com/photo/2023/05/09/00/11/animal-7979972_1280.jpg',
    'https://st4.depositphotos.com/2578749/20700/i/450/depositphotos_207006908-stock-photo-baby-giant-pandas-playful-adorable.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showBottomSheet(context, imageUrls[index]);
            },
            child: GridTile(
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String imageUrl) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 79, 169, 163),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(imageUrl),
                ElevatedButton(
                  onPressed: () {
                    _showImageDialog(context, imageUrl);
                  },
                  child: Text('Detail Gambar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 159, 206, 203),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(imageUrl),
              SizedBox(height: 10.0),
              Text(
                'Apakah yakin ingin melihat detail gambar?',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Tidak'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailImagePage(imageUrl: imageUrl),
                        ),
                      );
                    },
                    child: Text('Ya'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
