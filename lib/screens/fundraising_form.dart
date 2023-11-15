import 'package:flutter/material.dart';
import 'package:don8/widgets/left_drawer.dart';

class FundraisingFormPage extends StatefulWidget {
    const FundraisingFormPage({super.key});

    @override
    State<FundraisingFormPage> createState() => _FundraisingFormPageState();
}

class _FundraisingFormPageState extends State<FundraisingFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _goal_amount = 0;
    String _category = "Pendidikan";
    List<String> _categories = <String>[
      'Pendidikan',
      'Medis dan Kesehatan',
      'Lingkungan',
      'Bencana Alam',
      'Anak-anak',
      'Kemanusiaan',
      'Zakat',
      'Wakaf',
      'Panti Asuhan',
      'Hewan',
    ];
    String _description = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Form Tambah Pengalangan Dana',
              ),
            ),
            backgroundColor: Colors.indigo.shade400,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: Form( // Wadah input field widget
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nama Penggalangan Dana",
                            labelText: "Nama Penggalangan Dana",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _name = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Nama tidak boleh kosong!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nominal Target",
                            labelText: "Nominal Target",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _goal_amount = int.parse(value!);
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Nominal target tidak boleh kosong!";
                            }
                            if (int.tryParse(value) == null) {
                              return "Nominal target harus berupa angka!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                          elevation: 16,
                          decoration: InputDecoration(
                            labelText: 'Kategori', // Label untuk dropdown
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          value: _category, // Nilai terpilih
                          onChanged: (String? value) {
                            setState(() {
                              _category = value ?? '';
                            });
                          },
                          items: _categories.map<DropdownMenuItem<String>>((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih kategori!'; // Validasi pilihan kategori
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Deskripsi",
                            labelText: "Deskripsi",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _description = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Deskripsi tidak boleh kosong!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.indigo),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Penggalangan Dana berhasil tersimpan'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Nama: $_name'),
                                            Text('Nominal Target: $_goal_amount'),
                                            Text('Kategori: $_category'),
                                            Text('Deskripsi: $_description'),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              _formKey.currentState!.reset();
                              }
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
              ), // Membuat child widget menjadi scrollable
            ),
          ),
        );
    }   
}