import 'package:don8/screens/list_item.dart';
import 'package:don8/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:don8/screens/fundraising_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

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
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
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
          } else if (item.name == "Lihat Penggalangan Dana") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ItemPage()));
          } else if (item.name == "Logout") {
                  final response = await request.logout(
                      "http://localhost:8000/auth/logout/");
                  String message = response["message"];
                  if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message"),
                    ));
                  }
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