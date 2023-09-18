import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;

  Contact(this.name, this.phone);
}

final List<Contact> contacts = [
  Contact('Anisa Yuniarti', '+6264867252'),
  Contact('Ararya Hafidz', '+62823412635'),
  Contact('Bima Pangestu', '+6282458792'),
  Contact('Camillea Zhurg', '+6281234587'),
  Contact('David Liem', '+62897654321'),
  Contact('Delia Sepiana', '+6212337293'),
  Contact('El Barack', '+62876546598'),
  Contact('Fajrul Kamal', '+6282763863'),
  Contact('Ghazi Farhanu', '+62847364960'),
  Contact('Irwansyah Putra', '+62875420938'),
  Contact('Hidayah Daniawati', '+62821308675'),
  Contact('Juharmansah', '+62865342980'),
  Contact('Katarina Andrea L', '+6281654128'),
  Contact('Laurentina Rosa', '+6282539236827'),
  Contact('Muhammad Muchson', '+6243572539'),
  Contact('Nurmalasari', '+6283412098'),
  Contact('Oemar Putra', '+62897673636'),
  Contact('Putri Diana Hafsyawati', '+62123456781'),
  Contact('Queena Fasya', '+62896752917'),
  Contact('Rachael Nathasya', '+62823457198'),
  Contact('Safiyyah Flourenta', '+623427846287'),
  Contact('Tara Budiman', '+628392642547'),
  Contact('Umar Barokh', '+62839253872'),
  Contact('Varel Bramasta', '+628362462457'),
  Contact('Wawan Nugroho', '+62829235632'),
  Contact('Xavuera Morena', '+628354264432'),
  Contact('Yoriko', '+6286453725342'),
  Contact('Zebua ', '+62846457245'),
];

class ContactWidget extends StatefulWidget {
  
  final String name;
  final String phone;
  
  const ContactWidget({super.key, required this.name, required this.phone,});
  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  // Define any state variables and methods you need here

  @override
  Widget build(BuildContext context) {
    
  }
}
