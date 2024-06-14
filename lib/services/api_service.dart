import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://api.example.com'; // Ganti dengan URL base API Anda

  // Fungsi untuk melakukan request GET
  static Future<dynamic> getData(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Gagal memuat data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Gagal melakukan request.');
    }
  }

  // Fungsi untuk melakukan request POST
  static Future<dynamic> postData(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Gagal membuat permintaan: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Gagal melakukan request.');
    }
  }

  // Fungsi untuk melakukan request PUT
  static Future<dynamic> putData(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Gagal membuat permintaan: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Gagal melakukan request.');
    }
  }

  // Fungsi untuk melakukan request DELETE
  static Future<dynamic> deleteData(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Gagal membuat permintaan: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Gagal melakukan request.');
    }
  }
}
