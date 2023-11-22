import 'package:flutter/material.dart';
import 'package:don8/models/item.dart'; // Import your Item model

class ItemDetailsPage extends StatelessWidget {
  final Item item; // Receive the item as a parameter

  const ItemDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name), // Set the item's name as the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${item.fields.name}",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Goal Amount: ${item.fields.goalAmount}"),
            SizedBox(height: 10),
            Text("Category: ${item.fields.category}"),
            SizedBox(height: 10),
            Text("Description: ${item.fields.description}"),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
