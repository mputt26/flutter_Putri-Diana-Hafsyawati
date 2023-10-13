import 'package:flutter/material.dart';
import 'package:praktikum/style.dart';
import 'package:praktikum/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIdx = 0;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logoP.png',
          width: 75,
          height: 75,
        ),
      ),
      body: bodyPage(),
      endDrawer: drawer(),
      bottomNavigationBar: botNav(),
    );
  }

  // Side Menu handling ----------------------------------------------------------------

  Widget drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 10,
                  children: [
                    button(context, 'About US'),
                    button(context, 'Contact US'),
                    button(context, 'Login'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Body handling ----------------------------------------------------------------

  Widget bodyPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const NetworkImage(
                      'https://www.designoffices.de/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F9mt55bm0937w%2F1VhXxVR2AP6jpbAaXKdr4I%2F6ba92dd0b690f2b59fc2caae3991504f%2FKey-Visual_Flexible-Office_Frankfurt_Wiesenh__ttenplatz.jpg&w=3840&q=75'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.darken)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Coding Bootcamp Penghasil\nProgrammer dengan Kualitas\nTinggi di Indonesia',
                  style: lexendW.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Alterra Academy adalah coding bootcam\nIndoensia untuk semua orang, baik dengan\nbackground IT & non-IT untuk menjadi\nProgrammer dengan kualitas terbaik di\nIndustri saat ini.',
                  style: lexendW.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700),
                    onPressed: () {},
                    child: Text('Pelajari Lebih Lanjut',
                        style: lexendW.copyWith(
                          fontWeight: FontWeight.bold,
                        )))
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Us',
                  style: lexend.copyWith(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                contactForm('Name'),
                contactForm('Email'),
                contactForm('Message'),
                const SizedBox(height: 5),
                button(context, 'Send',
                    icon: Icons.send_rounded, route: formConfirmation)
              ],
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Text('About Us',
                  style: lexend.copyWith(
                      fontSize: 22, fontWeight: FontWeight.bold)),
              Text('Alterra Academy Programs',
                  style: lexend.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return card();
                    }),
              )
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  formConfirmation() {
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 90,
                  ),
                  const Spacer(),
                  Text('Terima kasih, Tim kami akan merespon secepatnya.',
                      style: lexend.copyWith(fontSize: 16)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK', style: lexend),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget botNav() {
    return NavigationBar(
      indicatorColor: Colors.transparent,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIdx = index;
        });
      },
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      selectedIndex: currentPageIdx,
      destinations: <Widget>[
        NavigationDestination(
            selectedIcon: Icon(
              Icons.home_outlined,
              color: pink,
            ),
            icon: const Icon(Icons.home_outlined),
            label: 'Home'),
        NavigationDestination(
            selectedIcon: Icon(
              Icons.home_outlined,
              color: pink,
            ),
            icon: const Icon(Icons.home_outlined),
            label: 'Home'),
      ],
    );
  }
}