import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username; // Contoh data profil yang ditampilkan
  final String email;

  ProfileScreen({required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: $username'),
            SizedBox(height: 10.0),
            Text('Email: $email'),
            SizedBox(height: 20.0),
            // Tambahkan tombol untuk mengedit profil atau fungsi lain sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
