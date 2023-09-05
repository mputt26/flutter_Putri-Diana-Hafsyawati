import 'package:flutter/cupertino.dart';
import 'package:putri/main.dart';

void main() {
  runApp(const HelloWorld());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('PutriApp'),
        ),
        child: Center(
          child: Text('Tampilan cupertino'),
        ),
      ),
    );
  }
}
