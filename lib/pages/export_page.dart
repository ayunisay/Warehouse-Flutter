import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../services/api_service.dart'; // tambahkan ini!

Future<void> exportCSV(List<dynamic> data) async {
  List<List<dynamic>> rows = [
    ["ID", "Nama Barang", "Kategori", "Jumlah", "Rak", "Supplier"],
  ];

  for (var item in data) {
    rows.add([
      item["id"],
      item["nama_barang"],
      item["kategori"],
      item["jumlah"],
      item["rak"],
      item["supplier"],
    ]);
  }

  // Convert
  final csv = const ListToCsvConverter().convert(rows);

  // FIX: Simpan di folder app (aman Android 10–14)
  final dir = await getApplicationDocumentsDirectory();
  final path = "${dir.path}/stok_export.csv";

  final file = File(path);
  await file.writeAsString(csv);

  print("FILE DISIMPAN DI:");
  print(path);
}

class ExportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green[700]!, Colors.green[500]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.move_to_inbox, color: Colors.white, size: 35),
                    SizedBox(width: 10),
                    Text(
                      'Generate Laporan',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ], // ← TAMBAHKAN INI (penutup children Row)
            ), // ← TAMBAHKAN INI (penutup Column header)
          ), // ← TAMBAHKAN INI (penutup Container header)

          SizedBox(height: 30), // Tambah jarak antara header dan button

          // Button 1 - Laporan Stok
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 100,
              child: ElevatedButton(
                onPressed: () async {
                  final data = await ApiService.getStok();
                  await exportCSV(data);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.inventory, size: 30, color: Colors.white),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Laporan Stok',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Export data stok barang',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 20, color: Colors.white70),
                  ],
                ),
              ),
            ),
          ),

          // Button 2 - Laporan Barang Keluar
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: SizedBox(
              height: 100,
              child: ElevatedButton(
                onPressed: () async {
                  final data = await ApiService.getBarangKeluar();
                  await exportCSV(data);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.input_rounded, size: 35, color: Colors.white),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Laporan Barang Keluar',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Export data barang keluar',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 20, color: Colors.white70),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: SizedBox(
              height: 100,
              child: ElevatedButton(
                onPressed: () async {
                  final data = await ApiService.getPermintaan();
                  await exportCSV(data);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart_checkout, size: 35, color: Colors.white),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Laporan Permintaan Barang',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Export laporan permintaan barang',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 20, color: Colors.white70),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: SizedBox(
              height: 100,
              child: ElevatedButton(
                onPressed: () async {
                  final data = await ApiService.getLaporanKerusakan();
                  await exportCSV(data);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.report_problem, size: 35, color: Colors.white),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Laporan Kerusakan',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Export data laporan kerusakan barang',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 20, color: Colors.white70),
                  ],
                ),
              ),
            ),
          ),
        ], // ← Penutup children Column utama
      ), // ← Penutup body Scaffold
    );
  }
}