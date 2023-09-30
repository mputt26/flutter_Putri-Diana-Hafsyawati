import 'package:flutter/material.dart';

class DetailImagePage extends StatelessWidget {
  final String imageUrl;

  DetailImagePage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Image'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
