import 'package:flutter/material.dart';
import 'package:don8/screens/fundraising_form.dart';

class FundraisingItem {
  final String name;
  final IconData icon;
  final Color color;

  FundraisingItem(this.name, this.icon, this.color);
}

class FundraisingCard extends StatelessWidget {
  final FundraisingItem item;

  const FundraisingCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}"),
                backgroundColor: Colors.indigo.shade400,));
          // Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
          if (item.name == "Tambah Penggalangan Dana") {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FundraisingFormPage()));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}