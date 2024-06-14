import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  List<Map<String, dynamic>> stockItems = [];

  Future<void> fetchStockItems() async {
    // Ganti URL_API dengan URL endpoint untuk mendapatkan stok barang
    String url = 'URL_API/stock_items';

    try {
      var response = await http.get(Uri.parse(url));
      var jsonData = json.decode(response.body);

      // Contoh pengolahan data stok barang
      setState(() {
        stockItems = List<Map<String, dynamic>>.from(jsonData['data']);
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
    fetchStockItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stok Barang'),
      ),
      body: ListView.builder(
        itemCount: stockItems.length,
        itemBuilder: (context, index) {
          var item = stockItems[index];
          return ListTile(
            title: Text(item['nama_barang']),
            subtitle: Text('Stok: ${item['stok']}'),
          );
        },
      ),
    );
  }
}
