import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final DateTime date;
  final Color color;
  final List<String> selectedFiles;

  Contact(this.name, this.phone, this.date, this.color, this.selectedFiles);
}

List<Contact> contacts = [
  // Contact('Anisa Yuniarti', '+6264867252'),
  // Contact('Ararya Hafidz', '+62823412635'),
  // Contact('Delia Sepiana', '+628954109758'),
];
