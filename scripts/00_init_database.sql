/*
=============================================================
Membuat Database dan Skema
=============================================================
Tujuan Skrip:
    Skrip ini membuat database baru dengan nama 'DataWarehouseAnalytics' setelah memastikan apakah sudah ada sebelumnya.
    Jika database sudah ada, maka akan dihapus dan dibuat ulang. Selain itu, skrip ini juga membuat skema bernama 'gold'.
	
PERINGATAN:
    Menjalankan skrip ini akan menghapus seluruh database 'DataWarehouseAnalytics' jika sudah ada.
    Semua data dalam database akan terhapus secara permanen. Pastikan untuk memiliki cadangan (backup) sebelum menjalankan skrip ini.
*/

USE master;
GO

-- Menghapus dan membuat ulang database 'DataWarehouseAnalytics' jika sudah ada
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseAnalytics')
BEGIN
    ALTER DATABASE DataWarehouseAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouseAnalytics;
END;
GO

-- Membuat database 'DataWarehouseAnalytics'
CREATE DATABASE DataWarehouseAnalytics;
GO

USE DataWarehouseAnalytics;
GO

-- Membuat Skema

CREATE SCHEMA gold;
GO

-- Membuat tabel dim_customers di skema gold
CREATE TABLE gold.dim_customers(
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date,
	create_date date
);
GO

-- Membuat tabel dim_products di skema gold
CREATE TABLE gold.dim_products(
	product_key int ,
	product_id int ,
	product_number nvarchar(50) ,
	product_name nvarchar(50) ,
	category_id nvarchar(50) ,
	category nvarchar(50) ,
	subcategory nvarchar(50) ,
	maintenance nvarchar(50) ,
	cost int,
	product_line nvarchar(50),
	start_date date 
);
GO

-- Membuat tabel fact_sales di skema gold
CREATE TABLE gold.fact_sales(
	order_number nvarchar(50),
	product_key int,
	customer_key int,
	order_date date,
	shipping_date date,
	due_date date,
	sales_amount int,
	quantity tinyint,
	price int 
);
GO

-- Menghapus semua data dalam tabel dim_customers sebelum memasukkan data baru
TRUNCATE TABLE gold.dim_customers;
GO

-- Memasukkan data ke dalam tabel dim_customers dari file CSV
BULK INSERT gold.dim_customers
FROM 'C:\sql\sql-data-analytics-project\datasets\csv-files\gold.dim_customers.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

-- Menghapus semua data dalam tabel dim_products sebelum memasukkan data baru
TRUNCATE TABLE gold.dim_products;
GO

-- Memasukkan data ke dalam tabel dim_products dari file CSV
BULK INSERT gold.dim_products
FROM 'C:\sql\sql-data-analytics-project\datasets\csv-files\gold.dim_products.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

-- Menghapus semua data dalam tabel fact_sales sebelum memasukkan data baru
TRUNCATE TABLE gold.fact_sales;
GO

-- Memasukkan data ke dalam tabel fact_sales dari file CSV
BULK INSERT gold.fact_sales
FROM 'C:\sql\sql-data-analytics-project\datasets\csv-files\gold.fact_sales.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO
