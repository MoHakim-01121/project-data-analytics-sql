/*
===============================================================================
Analisis Magnitudo
===============================================================================
Tujuan:
    - Mengkuantifikasi data dan mengelompokkan hasil berdasarkan dimensi tertentu.
    - Memahami distribusi data di berbagai kategori.

Fungsi SQL yang Digunakan:
    - Fungsi Agregat: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/


  -- Menampilkan 10 data pertama dari tabel produk, penjualan, dan pelanggan  
SELECT TOP 10 * FROM gold.dim_product;  
SELECT TOP 10 * FROM gold.fact_sales;  
SELECT TOP 10 * FROM gold.dim_customers;  

-- Menemukan total pelanggan berdasarkan negara  
SELECT  
    country,  
    COUNT(customer_key) AS total_customer  
FROM gold.dim_customers  
GROUP BY country  
ORDER BY total_customer DESC;  

-- Menemukan total pelanggan berdasarkan jenis kelamin  
SELECT  
    gender,  
    COUNT(customer_key) AS total_customer  
FROM gold.dim_customers  
GROUP BY gender  
ORDER BY total_customer DESC;  

-- Menemukan total produk berdasarkan kategori  
SELECT  
    category,  
    COUNT(product_key) AS total_products  
FROM gold.dim_product  
GROUP BY category  
ORDER BY total_products DESC;  

-- Menghitung rata-rata biaya di setiap kategori produk  
SELECT  
    category,  
    AVG(cost) AS average_cost  
FROM gold.dim_product  
GROUP BY category  
ORDER BY average_cost DESC;  

-- Menghitung total pendapatan yang dihasilkan untuk setiap kategori produk  
SELECT  
    p.category,  
    SUM(f.sales_amount) AS total_revenue  
FROM gold.fact_sales f  
LEFT JOIN gold.dim_product p  
ON f.product_key = p.product_key  
GROUP BY p.category  
ORDER BY total_revenue DESC;  

-- Menghitung total pendapatan yang dihasilkan oleh setiap pelanggan  
SELECT  
    c.customer_key,  
    c.first_name,  
    c.last_name,  
    SUM(f.sales_amount) AS total_revenue  
FROM gold.fact_sales f  
LEFT JOIN gold.dim_customers c  
ON f.customer_key = c.customer_key  
GROUP BY c.customer_key, c.first_name, c.last_name  
ORDER BY total_revenue DESC;  

-- Menganalisis distribusi jumlah barang yang terjual di berbagai negara  
SELECT  
    c.country,  
    SUM(f.quantity) AS total_sold_items  
FROM gold.fact_sales f  
LEFT JOIN gold.dim_customers c  
ON f.customer_key = c.customer_key  
GROUP BY c.country  
ORDER BY total_sold_items DESC;  
