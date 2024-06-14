import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OutgoingItemsScreen extends StatefulWidget {
  @override
  _OutgoingItemsScreenState createState() => _OutgoingItemsScreenState();
}

class _OutgoingItemsScreenState extends State<OutgoingItemsScreen> {
  List<Map<String, dynamic>> outgoingItems = [];

  Future<void> fetchOutgoingItems() async {
    // Ganti URL_API dengan URL endpoint untuk mendapatkan laporan barang keluar
    String url = 'URL_API/outgoing_items';

    try {
      var response = await http.get(Uri.parse(url));
      var jsonData = json.decode(response.body);

      // Contoh pengolahan data laporan barang keluar
      setState(() {
        outgoingItems = List<Map<String, dynamic>>.from(jsonData['data']);
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
    fetchOutgoingItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Barang Keluar'),
      ),
      body: ListView.builder(
        itemCount: outgoingItems.length,
        itemBuilder: (context, index) {
          var item = outgoingItems[index];
          return ListTile(
            title: Text(item['nama_barang']),
            subtitle: Text('Jumlah: ${item['jumlah']}'),
          );
        },
      ),
    );
  }
}
