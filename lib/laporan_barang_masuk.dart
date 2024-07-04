import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laporan Barang Masuk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: LaporanBarangMasukScreen(),
    );
  }
}

class LaporanBarangMasukScreen extends StatelessWidget {
  // Simulated data
  final List<Map<String, String>> laporanBarangMasuk = [
    {
      'bm_kode': 'BM001',
      'barang_kode': 'B001',
      'customer_id': 'C001',
      'bm_tanggal': '2023-07-01',
      'bm_jumlah': '10',
      'bm_pic': 'John Doe',
      'created_at': '2023-06-25',
      'updated_at': '2023-06-30',
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Laporan Barang Masuk'),
        backgroundColor: Color(0xFF007BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFE0E0E0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(color: Color(0xFF333333)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4CAF50),
                  ),
                  onPressed: () {
                    // Implement print functionality if needed
                  },
                  child: Text('Cetak'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: laporanBarangMasuk.length,
                itemBuilder: (context, index) {
                  final barangMasuk = laporanBarangMasuk[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.only(top: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kode Barang Masuk: ${barangMasuk['bm_kode']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('Barang Kode: ${barangMasuk['barang_kode']}'),
                          Text('Customer ID: ${barangMasuk['customer_id']}'),
                          Text('Tanggal: ${barangMasuk['bm_tanggal']}'),
                          Text('Jumlah: ${barangMasuk['bm_jumlah']}'),
                          Text('PIC: ${barangMasuk['bm_pic']}'),
                          Text('Dibuat Pada: ${barangMasuk['created_at']}'),
                          Text('Diupdate Pada: ${barangMasuk['updated_at']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
