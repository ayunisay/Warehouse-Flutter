# Warehouse Mobile App 📦

Aplikasi Manajemen Gudang (Warehouse) berbasis Flutter yang terintegrasi dengan backend Laravel. Aplikasi ini dirancang untuk memudahkan pemantauan stok dan pelaporan barang secara real-time melalui perangkat mobile.

## 🚀 Fitur Utama (Mobile)

Aplikasi ini fokus pada fungsi pemantauan dan pelaporan:
- **List Barang**: Menampilkan daftar seluruh stok barang yang tersedia di gudang lengkap dengan kategori dan lokasi.
- **Barang Keluar (Tracking)**: Memantau riwayat atau daftar barang yang telah keluar dari gudang.
- **Export Laporan**: Fitur untuk mengekspor laporan stok dan laporan barang keluar langsung dari aplikasi.

## 🛠️ Tech Stack

- **Mobile**: [Flutter](https://flutter.dev/) (Dart)
- **Backend API**: [Laravel](https://laravel.com/)
- **Database**: MySQL/PostgreSQL (via Laravel)
- **HTTP Client**: `http` package

## ⚙️ Konfigurasi Backend

Aplikasi ini terhubung dengan repositori backend Laravel berikut:
🔗 [Warehouse-Laravel- Backend](https://github.com/ayunisay/Warehouse-Laravel)

### Setup API
Pastikan Anda telah mengatur `baseUrl` di file `lib/services/api_config.dart` sesuai dengan alamat IP server atau localhost Anda:

```dart
// lib/services/api_config.dart
final String baseUrl = 'http://IP_ADDRESS_ANDA/api/mobile';
```

## 🏗️ Cara Menjalankan

1. **Clone repositori ini:**
   ```bash
   git clone https://github.com/username/projek_uas.git
   ```
2. **Install dependencies:**
   ```bash
   flutter pub get
   ```
3. **Jalankan aplikasi:**
   ```bash
   flutter run
   ```

## 📱 Struktur Folder Utama

- `lib/models/`: Definisi data model (Barang, Tracking, dll).
- `lib/pages/`: Halaman UI aplikasi (StokPage, KeluarPage, Home).
- `lib/services/`: Logika koneksi API dan fetching data.
- `lib/widgets/`: Komponen UI yang dapat digunakan kembali.

---
Dikembangkan untuk tugas Projek UAS.
