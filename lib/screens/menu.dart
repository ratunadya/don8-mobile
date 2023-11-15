import 'package:flutter/material.dart';
import 'package:don8/widgets/fundraising_card.dart';
import 'package:don8/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<FundraisingItem> items = [
    FundraisingItem("Lihat Penggalangan Dana", Icons.checklist, Colors.blue.shade200),
    FundraisingItem("Tambah Penggalangan Dana", Icons.diversity_1_outlined, Colors.lightGreen.shade200),
    FundraisingItem("Logout", Icons.logout, Colors.red.shade300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Don8',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo.shade400,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat di-scroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Penggalangan Dana PBP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((FundraisingItem item) {
                  // Iterasi untuk setiap item
                  return FundraisingCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
