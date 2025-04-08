/*
===============================================================================
Eksplorasi Metrik (Ukuran Kunci)
===============================================================================
Tujuan:
    - Menghitung metrik agregat (misalnya, total, rata-rata) untuk mendapatkan wawasan cepat.
    - Mengidentifikasi tren keseluruhan atau menemukan anomali dalam data.

Fungsi SQL yang Digunakan:
    - COUNT()
    - SUM()
    - AVG()
===============================================================================
*/



-- Menemukan total penjualan
SELECT  
SUM(sales_amount) AS total_Sales  
FROM gold.fact_sales;

-- Menemukan jumlah total item yang terjual
SELECT  
SUM(quantity) AS items_sold  
FROM gold.fact_sales;

-- Menemukan harga jual rata-rata
SELECT  
AVG(price) AS avg_price   
FROM gold.fact_sales;

-- Menemukan jumlah total pesanan
SELECT  
COUNT(order_number) AS total_orders  
FROM gold.fact_sales;

SELECT  
COUNT(DISTINCT order_number) AS total_orders  
FROM gold.fact_sales;

-- Menemukan jumlah total produk
SELECT  
COUNT(product_key) AS Total_product  
FROM gold.dim_product;

SELECT  
COUNT(DISTINCT product_key) AS Total_product  
FROM gold.dim_product;

SELECT  
COUNT(DISTINCT product_name) AS Total_product  
FROM gold.dim_product;


-- Menemukan jumlah total pelanggan
SELECT * FROM gold.dim_customers;

SELECT  
COUNT(customer_key) AS total_customer  
FROM gold.dim_customers;

SELECT  
COUNT(customer_id) AS total_customer  
FROM gold.dim_customers;

SELECT  
COUNT(DISTINCT customer_number) AS total_customer  
FROM gold.dim_customers;

-- Menemukan jumlah total pelanggan yang telah melakukan pemesanan
SELECT * FROM gold.fact_sales;

SELECT  
COUNT(DISTINCT customer_key) AS total_customer  
FROM gold.fact_sales;

-- Membuat laporan yang menunjukkan semua metrik utama bisnis
SELECT   
'Total Penjualan' AS measure_name,  
SUM(sales_amount) AS measure_value  
FROM gold.fact_sales   
UNION ALL  
SELECT  
'Total Item Terjual',  
SUM(quantity)  
FROM gold.fact_sales   
UNION ALL  
SELECT  
'Harga Rata-Rata',  
AVG(price)   
FROM gold.fact_sales  
UNION ALL  
SELECT  
'Total Jumlah Pesanan',  
COUNT(DISTINCT order_number)   
FROM gold.fact_sales  
UNION ALL  
SELECT  
'Total Jumlah Produk',  
COUNT(DISTINCT product_key)   
FROM gold.dim_product   
UNION ALL  
SELECT  
'Total Jumlah Pelanggan',  
COUNT(customer_key)  
FROM gold.dim_customers;
