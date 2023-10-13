import 'package:flutter/material.dart';

Color defaultBG = Color.fromARGB(255, 179, 165, 178);
Color white = Colors.white;
Color black = Colors.black;
Color pink = Color.fromARGB(255, 207, 171, 198);

InputDecoration loginTheme = InputDecoration(
  filled: true,
  fillColor: Colors.lightBlue.shade50,
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(width: 2, color: Colors.black38),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(width: 2, color: Colors.black38),
  ),
);

TextStyle roboto = TextStyle(
  fontSize: 14,
  color: black,
  fontFamily: 'Roboto',
);

TextStyle lexend = TextStyle(
  fontSize: 14,
  color: black,
  fontFamily: 'Lexend',
);

TextStyle lexendW = TextStyle(
  fontSize: 14,
  color: white,
  fontFamily: 'Lexend',
);

TextStyle unbounded = TextStyle(
  fontSize: 14,
  color: black,
  fontFamily: 'Unbound',
);