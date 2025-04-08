/*
===============================================================================
Eksplorasi Dimensi
===============================================================================
Tujuan:
    - Mengeksplorasi struktur tabel dimensi.

Fungsi SQL yang Digunakan:
    - DISTINCT
    - ORDER BY
===============================================================================
*/


-- 2. EKSPLORASI DIMENSI
--====================================--

-- Menampilkan semua data dari tabel dim_customers
SELECT * FROM gold.dim_customers;

-- Mengeksplorasi daftar negara yang unik dari tabel dim_customers
SELECT DISTINCT 
    country
FROM gold.dim_customers;
-- Hasil: 
--         n/a, Germany, United States, Australia, 
--         United Kingdom, Canada, France

-- Mengeksplorasi semua kategori produk utama dari tabel dim_product
SELECT DISTINCT 
    category, 
    subcategory,
    product_name
FROM gold.dim_product
ORDER BY 1,2,3;
-- Hasil kategori: Accessories, Bikes, Clothing, Component
--====================================--
