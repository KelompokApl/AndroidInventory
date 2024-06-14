import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IncomingItemsScreen extends StatefulWidget {
  @override
  _IncomingItemsScreenState createState() => _IncomingItemsScreenState();
}

class _IncomingItemsScreenState extends State<IncomingItemsScreen> {
  List<Map<String, dynamic>> incomingItems = [];

  Future<void> fetchIncomingItems() async {
    // Ganti URL_API dengan URL endpoint untuk mendapatkan laporan barang masuk
    String url = 'URL_API/incoming_items';

    try {
      var response = await http.get(Uri.parse(url));
      var jsonData = json.decode(response.body);

      // Contoh pengolahan data laporan barang masuk
      setState(() {
        incomingItems = List<Map<String, dynamic>>.from(jsonData['data']);
      });
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat data. Silakan coba lagi nanti.')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchIncomingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Barang Masuk'),
      ),
      body: ListView.builder(
        itemCount: incomingItems.length,
        itemBuilder: (context, index) {
          var item = incomingItems[index];
          return ListTile(
            title: Text(item['nama_barang']),
            subtitle: Text('Jumlah: ${item['jumlah']}'),
          );
        },
      ),
    );
  }
}
