import 'package:don8/screens/list_item.dart';
import 'package:flutter/material.dart';
import 'package:don8/screens/menu.dart';
import 'package:don8/screens/fundraising_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Don8',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Unleash infinite kindness.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.diversity_1_outlined),
            title: const Text('Tambah Penggalangan Dana'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FundraisingFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.view_list_outlined),
            title: const Text('Daftar Penggalangan Dana'),
            onTap: () {
                // Route menu ke halaman item
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ItemPage()),
                );
            },
          ),
        ],
      ),
    );
  }
}