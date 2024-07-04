import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stok Barang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StokBarangPage(),
    );
  }
}

class StokBarangPage extends StatefulWidget {
  @override
  _StokBarangPageState createState() => _StokBarangPageState();
}

class _StokBarangPageState extends State<StokBarangPage> {
  late Future<List<Barang>> _barangList;

  @override
  void initState() {
    super.initState();
    _barangList = fetchBarang();
  }

  Future<List<Barang>> fetchBarang() async {
    final response = await http.get(Uri.parse('https://yourapi.com/barang'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((barang) => Barang.fromJson(barang)).toList();
    } else {
      throw Exception('Failed to load barang');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stok Barang'),
        actions: [
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {
              // Implement print functionality
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Barang>>(
        future: _barangList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data![index].nama,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text("Kode Barang: ${snapshot.data![index].kode}"),
                        Text("Jumlah Stok: ${snapshot.data![index].stok}"),
                        Text("Harga: Rp ${snapshot.data![index].harga}"),
                        SizedBox(height: 10),
                        Image.network(snapshot.data![index].gambar, height: 100, width: 100),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class Barang {
  final String kode;
  final String nama;
  final int stok;
  final int harga;
  final String gambar;

  Barang({
    required this.kode,
    required this.nama,
    required this.stok,
    required this.harga,
    required this.gambar,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      kode: json['barang_kode'],
      nama: json['barang_nama'],
      stok: json['barang_stok'],
      harga: json['barang_harga'],
      gambar: json['barang_gambar'],
    );
  }
}
