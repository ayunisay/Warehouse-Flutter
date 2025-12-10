import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const baseUrl = "http://10.0.2.2:8000/api"; // Android emulator
  // kalau device asli pakai IP wifi kamu, contoh:
  // static const baseUrl = "http://192.168.1.10:8000/api";

  // GET laporan stok
  static Future<List<dynamic>> getStok() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final res = await http.get(
      Uri.parse("$baseUrl/export-json/stok"),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    final body = jsonDecode(res.body);
    return body["data"];
  }

  // GET barang keluar
  static Future<List<dynamic>> getBarangKeluar() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final res = await http.get(
      Uri.parse("$baseUrl/export-json/barang-keluar"),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    final body = jsonDecode(res.body);
    return body["data"];
  }

  // GET barang keluar
  static Future<List<dynamic>> getPermintaan() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final res = await http.get(
      Uri.parse("$baseUrl/export-json/permintaan"),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    final body = jsonDecode(res.body);
    return body["data"];
  }

  // GET barang keluar
  static Future<List<dynamic>> getLaporanKerusakan() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    final res = await http.get(
      Uri.parse("$baseUrl/export-json/laporan-kerusakan"),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    final body = jsonDecode(res.body);
    return body["data"];
  }
}
