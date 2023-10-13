import 'package:flutter/material.dart';
import 'package:praktikum/style.dart';

Widget button(BuildContext context, title,
    {IconData? icon, Function()? route, bool goToPage = false}) {
  return InkWell(
    onTap: () {
      if (route != null) {
        if (goToPage) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route()));
        } else {
          route(); // Panggil fungsi route jika tidak menggunakan navigator
        }
      } else {
        debugPrint('$title tertekan');
      }
    },
    child: Ink(
      width: 110,
      height: 35,
      decoration:
          BoxDecoration(color: pink, borderRadius: BorderRadius.circular(7)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: white),
              const SizedBox(width: 5),
            ],
            Text(
              title,
              style: lexendW.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget contactForm(label) {
  return TextField(
    decoration: InputDecoration(
      border: InputBorder.none,
      labelText: label,
      labelStyle: lexend,
      contentPadding: EdgeInsets.zero,
    ),
  );
}

Widget card() {
  return Container(
    width: 180,
    margin: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(5, 5),
          )
        ],
        color: const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(22)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            'assets/images/program_logo.png',
            width: 50,
            height: 50,
          ),
          Text(
            'Immersive Program',
            style: lexend.copyWith(fontSize: 11, fontWeight: FontWeight.bold),
          ),
          Text(
            'Program pelatihan coding bootcampintensif bagi kamu yang pemula, baik dengan latar belakang IT maupun non-IT, untuk menjadi seorang Software Engineer profesionaldalam waktu 9 minggu.',
            style: lexend.copyWith(fontSize: 9),
          ),
        ],
      ),
    ),
  );
}
