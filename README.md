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

## 🗄️ Entity Relationship Diagram (ERD)

![ERD](docs/erd.jpeg)

### Struktur Database

**Tabel Items (Barang)**
- `id` - Primary Key (Auto Increment)
- `kode_barang` - Kode unik barang (VARCHAR)
- `nama_barang` - Nama barang (VARCHAR)
- `satuan` - Satuan barang (VARCHAR) - pcs, kg, liter, dll
- `stock_awal` - Stok awal (INTEGER)
- `stock` - Stok saat ini (INTEGER)
- `updated_by` - User yang mengupdate (Foreign Key ke users)
- `deleted_by` - User yang menghapus (Foreign Key ke users)
- `created_at` - Waktu dibuat
- `updated_at` - Waktu diupdate
- `deleted_at` - Waktu dihapus (soft delete)

**Tabel Transactions (Transaksi)**
- `id` - Primary Key (Auto Increment)
- `item_id` - Foreign Key ke tabel items (INTEGER)
- `user_id` - Foreign Key ke tabel users (INTEGER)
- `jenis_transaksi` - Jenis transaksi (ENUM: 'masuk', 'keluar')
- `jumlah` - Jumlah transaksi (INTEGER)
- `tanggal_transaksi` - Tanggal transaksi (DATE)
- `keterangan` - Keterangan opsional (TEXT)
- `status` - Status transaksi (ENUM: 'aktif', 'dibatalkan', 'restored')
- `canceled_at` - Waktu pembatalan (TIMESTAMP)
- `canceled_by` - User yang membatalkan (Foreign Key ke users)
- `restored_at` - Waktu pemulihan (TIMESTAMP)
- `restored_by` - User yang memulihkan (Foreign Key ke users)
- `created_at` - Waktu dibuat
- `updated_at` - Waktu diupdate

**Tabel Users (Pengguna)**
- `id` - Primary Key (Auto Increment)
- `name` - Nama pengguna (VARCHAR)
- `email` - Email pengguna (VARCHAR)
- `password` - Password terenkripsi (VARCHAR)
- `role` - Role pengguna (ENUM: 'admin', 'manager', 'staff')
- `created_at` - Waktu dibuat
- `updated_at` - Waktu diupdate

**Relasi Database:**
- Items → Transactions (One to Many)
- Users → Items (One to Many) - updated_by, deleted_by
- Users → Transactions (One to Many) - canceled_by, restored_by
- Foreign Keys:
  - `transactions.item_id` → `items.id`
  - `transactions.canceled_by` → `users.id`
  - `transactions.restored_by` → `users.id`
  - `items.updated_by` → `users.id`
  - `items.deleted_by` → `users.id`

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
php artisan db:seed
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
- `items` - Master data barang dengan stok awal dan stok saat ini
- `transactions` - Log transaksi masuk/keluar barang

**Logika Bisnis:**
- `stock_awal` - Stok awal barang (tidak berubah)
- `stock` - Stok saat ini (update otomatis dari transaksi)
- Transaksi 'masuk' menambah `stock`
- Transaksi 'keluar' mengurangi `stock`
- Validasi stok untuk mencegah stok negatif

## 🌐 API Endpoints

**Items (Barang)**
- `GET /api/items` - Daftar barang
- `POST /api/items` - Tambah barang
- `PUT /api/items/{id}` - Update barang
- `DELETE /api/items/{id}` - Hapus barang
- `GET /api/items-next-code` - Generate kode barang berikutnya
- `GET /api/items-units` - Daftar satuan barang

**Transactions (Transaksi)**
- `GET /api/transactions` - Riwayat transaksi
- `POST /api/transactions` - Tambah transaksi
- `PATCH /api/transactions/{id}/cancel` - Batalkan transaksi
- `PATCH /api/transactions/{id}/restore` - Pulihkan transaksi

**Reports (Laporan)**
- `GET /api/reports/stock` - Laporan stok barang

**Authentication**
- `POST /api/login` - Login pengguna
- `POST /api/logout` - Logout pengguna
- `GET /api/me` - Data pengguna saat ini

## 🔄 Roadmap Pengembangan

### 🎯 Priority 1: Role-Based Access Control (RBAC)
- **Status**: Role tersedia, implementasi middleware & policy needed
- **Roles**: Admin (full access), Manager (CRUD items + reports), Staff (view items + transactions)
- **Impact**: Security & user management

### 📊 Priority 2: Dashboard Audit Log  
- **Status**: Model tersedia, UI dashboard needed
- **Features**: Activity monitoring, filtering, export reports
- **Impact**: Compliance & monitoring

### 🚀 Priority 3: Enhancements
**Security & Performance**
- API rate limiting & input sanitization
- Database indexing & soft delete recovery

**User Experience** 
- Bulk import/export Excel
- Advanced filtering & low stock alerts
- Transaction approval workflow

**Reports & Analytics**
- Stock movement charts
- User activity reports  
- Transaction trends analysis

**Technical Improvements**
- API versioning (`/api/v1/`)
- Standardized responses & error handling
- Centralized validation classes