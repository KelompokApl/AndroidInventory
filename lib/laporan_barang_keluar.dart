import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laporan Barang Keluar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: LaporanBarangKeluarScreen(),
    );
  }
}

class LaporanBarangKeluarScreen extends StatelessWidget {
  // Hardcoded example data, replace with actual data fetching in a real app
  final List<Map<String, String>> laporanBarangKeluar = [
    {
      'bk_kode': 'BK001',
      'barang_kode': 'B001',
      'bk_tanggal': '2023-07-01',
      'bk_tujuan': 'Jakarta',
      'bk_jumlah': '10',
      'bk_pic': 'John Doe',
      'created_at': '2023-06-25',
      'updated_at': '2023-06-30'
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text('Laporan Barang Keluar'),
        backgroundColor: Color(0xFF2196F3),
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
                itemCount: laporanBarangKeluar.length,
                itemBuilder: (context, index) {
                  final barangKeluar = laporanBarangKeluar[index];
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
                            'Kode Barang Keluar: ${barangKeluar['bk_kode']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text('Barang Kode: ${barangKeluar['barang_kode']}'),
                          Text('Tanggal: ${barangKeluar['bk_tanggal']}'),
                          Text('Tujuan: ${barangKeluar['bk_tujuan']}'),
                          Text('Jumlah: ${barangKeluar['bk_jumlah']}'),
                          Text('PIC: ${barangKeluar['bk_pic']}'),
                          Text('Dibuat Pada: ${barangKeluar['created_at']}'),
                          Text('Diupdate Pada: ${barangKeluar['updated_at']}'),
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
