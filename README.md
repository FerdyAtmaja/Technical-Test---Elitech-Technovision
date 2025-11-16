# Sistem Manajemen Inventori

Aplikasi web untuk mengelola inventori barang dengan fitur transaksi masuk dan keluar barang.

## 🏗️ Arsitektur Sistem

- **Backend**: Laravel 12 (PHP 8.2+)
- **Frontend**: Vue.js 3 + Vite
- **Database**: mysql
- **Styling**: Tailwind CSS
- **State Management**: Pinia

## 📋 Fitur Utama

- ✅ Manajemen data barang (CRUD)
- ✅ Transaksi barang masuk
- ✅ Transaksi barang keluar dengan validasi stok
- ✅ Riwayat transaksi
- ✅ Dashboard
- ✅ Responsive design

## 🗄️ Entity Relationship Diagram (ERD)

![ERD](docs/erd.jpeg)

### Struktur Database

**Tabel Items (Barang)**
- `id` - Primary Key (Auto Increment)
- `kode_barang` - Kode unik barang (VARCHAR)
- `nama_barang` - Nama barang (VARCHAR)
- `satuan` - Satuan barang (VARCHAR) - pcs, kg, liter, dll
- `current_stock` - Stok saat ini (INTEGER)
- `created_at` - Waktu dibuat
- `updated_at` - Waktu diupdate

**Tabel Transactions (Transaksi)**
- `id` - Primary Key (Auto Increment)
- `item_id` - Foreign Key ke tabel items (INTEGER)
- `jenis_transaksi` - Jenis transaksi (ENUM: 'masuk', 'keluar')
- `jumlah` - Jumlah transaksi (INTEGER)
- `tanggal_transaksi` - Tanggal transaksi (DATE)
- `keterangan` - Keterangan opsional (TEXT)
- `created_at` - Waktu dibuat
- `updated_at` - Waktu diupdate

**Relasi Database:**
- Items → Transactions (One to Many)
- Setiap barang dapat memiliki banyak transaksi
- Foreign Key: `transactions.item_id` → `items.id`

## 🚀 Instalasi & Setup

### Prasyarat
- PHP 8.2+
- Composer
- Node.js 20.19.0+ atau 22.12.0+
- NPM

### Backend Setup
```bash
cd backend
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan serve
```

### Frontend Setup
```bash
cd frontend
npm install
npm run dev
```

## 🔐 Demo Accounts

**Admin**: admin@inventory.com / admin123  
**Manager**: manager@inventory.com / manager123  
**Staff**: staff@inventory.com / staff123

## 📁 Struktur Proyek

```
├── backend/           # Laravel API
│   ├── app/
│   ├── database/
│   └── routes/
├── frontend/          # Vue.js SPA
│   ├── src/
│   │   ├── components/
│   │   ├── views/
│   │   └── stores/
│   └── public/
├── docs/             # Dokumentasi & ERD
└── database.sql      # Database schema
```

## 🔧 Development

### Backend
```bash
cd backend
php artisan serve    # Server di http://localhost:8000
```

### Frontend
```bash
cd frontend
npm run dev         # Development server di http://localhost:5173
```

## 📊 Database Schema

Database menggunakan SQLite dengan tabel utama:
- `items` - Master data barang dengan stok
- `transactions` - Log transaksi masuk/keluar barang

**Logika Bisnis:**
- Transaksi 'masuk' menambah stok barang
- Transaksi 'keluar' mengurangi stok barang
- Validasi stok untuk mencegah stok negatif
- Update otomatis `current_stock` setiap transaksi

## 🌐 API Endpoints

- `GET /api/items` - Daftar barang
- `POST /api/items` - Tambah barang
- `PUT /api/items/{id}` - Update barang
- `DELETE /api/items/{id}` - Hapus barang
- `GET /api/transactions` - Riwayat transaksi
- `POST /api/transactions` - Tambah transaksi