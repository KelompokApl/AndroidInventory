import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String username = 'user123'; // Should be fetched from session or authentication
  String fullname = '';
  String email = '';
  String profilePictureUrl = 'assets/profil2.png'; // Placeholder image

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    // Replace with your API URL
    final response = await http.get(Uri.parse('https://yourapi.com/user_profile?username=$username'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        fullname = data['user_nmlengkap'];
        email = data['user_email'];
        // profilePictureUrl = data['user_foto']; // Uncomment if profile picture URL is fetched from the server
      });
    } else {
      // Handle error
      throw Exception('Failed to load user profile');
    }
  }

  Future<void> updateUserProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Replace with your API URL
      final response = await http.post(
        Uri.parse('https://inventoryytugas.000webhostapp.com/profil.php'),
        body: {
          'username': username,
          'fullname': fullname,
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        // Handle success
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated successfully')));
      } else {
        // Handle error
        throw Exception('Failed to update profile');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Handle logout
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(profilePictureUrl),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: fullname,
                decoration: InputDecoration(labelText: 'Nama Lengkap'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) {
                  fullname = value!;
                },
              ),
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateUserProfile,
                child: Text('Simpan Perubahan'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/dashboard');
                },
                child: Text('Kembali'),
                style: ElevatedButton.styleFrom(primary: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
