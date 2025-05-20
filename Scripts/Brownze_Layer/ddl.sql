-- ========================================
-- Connect to DataWarehouse database
-- If you face any connection issues, run init.sql first
-- ========================================
USE DataWarehouse;
GO

-- ========================================
-- CRM Source: Creating 3 Bronze Layer Tables
-- These tables correspond to raw CRM CSV files
-- ========================================

-- Drop and create bronze.crm_customer_info
IF EXISTS (
    SELECT *
    FROM sys.tables
    WHERE
        name = 'crm_customer_info'
        AND SCHEMA_NAME (schema_id) = 'bronze'
) BEGIN
DROP TABLE bronze.crm_customer_info;

END

CREATE TABLE bronze.crm_customer_info (
    cst_id INT,
    cst_key VARCHAR(225),
    cst_firstname VARCHAR(225),
    cst_lastname VARCHAR(225),
    cst_marital_status VARCHAR(225),
    cst_gndr VARCHAR(225),
    cst_create_date DATE
);
GO

-- Drop and create bronze.crm_product_info
IF EXISTS (
    SELECT *
    FROM sys.tables
    WHERE
        name = 'crm_product_info'
        AND SCHEMA_NAME (schema_id) = 'bronze'
) BEGIN
DROP TABLE bronze.crm_product_info;

END

CREATE TABLE bronze.crm_product_info (
    prd_id INT,
    prd_key VARCHAR(225),
    prd_nm VARCHAR(225),
    prd_cost VARCHAR(225),
    prd_line VARCHAR(225),
    prd_start_dt VARCHAR(225),
    prd_end_dt DATE
);
GO

-- Drop and create bronze.crm_sales_details
IF EXISTS (
    SELECT *
    FROM sys.tables
    WHERE
        name = 'crm_sales_details'
        AND SCHEMA_NAME (schema_id) = 'bronze'
) BEGIN
DROP TABLE bronze.crm_sales_details;

END

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num INT,
    sls_prd_key VARCHAR(225),
    sls_cust_id INT,
    sls_order_dt INT, -- Consider changing to DATE if applicable
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);
GO

-- ========================================
-- ERP Source: Creating 3 Tables
-- ========================================

-- Drop and create Bronze.erp_cust_az12
IF EXISTS (
    SELECT *
    FROM sys.tables
    WHERE
        name = 'erp_cust_az12'
        AND SCHEMA_NAME (schema_id) = 'bronze'
) BEGIN
DROP TABLE bronze.erp_cust_az12;

END

CREATE TABLE bronze.erp_cust_az12 (
    cid VARCHAR(225),
    bdate DATE,
    gen VARCHAR(225)
);
GO

-- Drop and create bronze.erp_loc_a101
IF EXISTS (
    SELECT *
    FROM sys.tables
    WHERE
        name = 'erp_loc_a101'
        AND SCHEMA_NAME (schema_id) = 'bronze'
) BEGIN
DROP TABLE bronze.erp_loc_a101;

END

CREATE TABLE bronze.erp_loc_a101 (
    cid VARCHAR(225),
    cntry VARCHAR(225)
);
GO

-- Drop and create bronze.erp_px_cat_g1v2
IF EXISTS (
    SELECT *
    FROM sys.tables
    WHERE
        name = 'erp_px_cat_g1v2'
        AND SCHEMA_NAME (schema_id) = 'bronze'
) BEGIN
DROP TABLE bronze.erp_px_cat_g1v2;

END

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id VARCHAR(225),
    cat VARCHAR(225),
    subcat VARCHAR(225),
    mainteanane VARCHAR(225)
);
GO