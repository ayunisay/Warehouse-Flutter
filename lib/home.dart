import 'package:flutter/material.dart';
import 'package:projekuas/pages/export_page.dart';
import 'package:projekuas/pages/keluar_page.dart';
import 'package:projekuas/pages/stok_page.dart';
import 'package:projekuas/pages/home_page.dart';
import 'package:projekuas/widgets/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    StokPage(),
    KeluarPage(),
    ExportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.navColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 40,
              spreadRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          unselectedItemColor: AppColors.secondColor,
          selectedItemColor: Colors.yellow.shade700,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.storage_rounded), label: 'Stok'),
            BottomNavigationBarItem(icon: Icon(Icons.trolley), label: 'Barang Keluar'),
            BottomNavigationBarItem(icon: Icon(Icons.move_to_inbox), label: 'Generate Laporan'),
          ],
        ),
      ),
    );
  }
}
