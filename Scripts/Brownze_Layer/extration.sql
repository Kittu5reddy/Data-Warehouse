-- ===================================================================
-- Data Extraction: Batch Load from CSVs into Bronze Layer
-- Description:
--     - Using BULK INSERT to load CSV files into corresponding bronze tables.
--     - Each load truncates the table first to ensure batch extraction with clean insert.
--     - Skipping headers using FIRSTROW = 2.
-- ===================================================================

-- ========================================
-- Load CRM Customer Info
-- ========================================
TRUNCATE TABLE bronze.crm_customer_info;

BULK
INSERT
    bronze.crm_customer_info
FROM 'C:\Users\kaush\Desktop\Data Wareshouse\Data\source_crm\cust_info.csv'
WITH (
        FIRSTROW = 2, -- Skip header row
        FIELDTERMINATOR = ',' -- CSV delimiter
    );
GO
-- ========================================
-- Load CRM Product Info
-- ========================================
TRUNCATE TABLE bronze.crm_product_info;

BULK
INSERT
    bronze.crm_product_info
FROM 'C:\Users\kaush\Desktop\Data Wareshouse\Data\source_crm\prd_info.csv'
WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ','
    );
GO
-- ========================================
-- Load CRM Sales Details
-- ========================================
TRUNCATE TABLE bronze.crm_sales_details;

BULK
INSERT
    bronze.crm_sales_details
FROM 'C:\Users\kaush\Desktop\Data Wareshouse\Data\source_crm\sales_details.csv'
WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ','
    );
GO
-- ========================================
-- Load ERP Customer Data (erp_cust_az12)
-- ========================================
TRUNCATE TABLE bronze.erp_cust_az12;

BULK
INSERT
    bronze.erp_cust_az12
FROM 'C:\Users\kaush\Desktop\Data Wareshouse\Data\source_erp\CUST_AZ12.csv'
WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ','
    );
GO
-- ========================================
-- Load ERP Location Data (erp_loc_a101)
-- ========================================
TRUNCATE TABLE bronze.erp_loc_a101;

BULK
INSERT
    bronze.erp_loc_a101
FROM 'C:\Users\kaush\Desktop\Data Wareshouse\Data\source_erp\LOC_A101.csv'
WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ','
    );
GO
-- ========================================
-- Load ERP Product Category Data (erp_px_cat_g1v2)
-- ========================================
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

BULK
INSERT
    bronze.erp_px_cat_g1v2
FROM 'C:\Users\kaush\Desktop\Data Wareshouse\Data\source_erp\PX_CAT_G1V2.csv'
WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ','
    );
GO