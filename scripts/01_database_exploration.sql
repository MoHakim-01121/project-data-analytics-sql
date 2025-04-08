/*
===============================================================================
Eksplorasi Database
===============================================================================
Tujuan:
    - Mengeksplorasi struktur database, termasuk daftar tabel dan skema yang ada.
    - Memeriksa kolom dan metadata untuk tabel tertentu.

Tabel yang Digunakan:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/


-- MENJELAJAHI SEMUA OBJEK DALAM DATABASE
SELECT * FROM INFORMATION_SCHEMA.TABLES;

-- MENJELAJAHI SEMUA KOLOM DALAM DATABASE UNTUK TABEL TERTENTU
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
