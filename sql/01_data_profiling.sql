
-- =====================================================
-- PROJECT: TELECOM CUSTOMER CHURN ANALYSIS
-- FILE: 01_data_profiling.sql
-- PURPOSE: Understand and profile the dataset
-- DATABASE: TelecomChurnDB
-- TABLE: dbo.telco_churn_cleaned
-- =====================================================

USE TelecomChurnDB;
GO


-- =====================================================
-- 1. CHECK TOTAL NUMBER OF RECORDS
-- =====================================================

SELECT
    COUNT(*) AS total_records
FROM dbo.telco_churn_cleaned;


-- =====================================================
-- 2. DISPLAY FIRST 10 RECORDS
-- =====================================================

SELECT TOP 10 *
FROM dbo.telco_churn_cleaned;


-- =====================================================
-- 3. CHECK UNIQUE CUSTOMER IDs
-- =====================================================

SELECT
    COUNT(DISTINCT customerID) AS unique_customers
FROM dbo.telco_churn_cleaned;


-- =====================================================
-- 4. CHECK TABLE STRUCTURE AND DATA TYPES
-- =====================================================

EXEC sp_help 'dbo.telco_churn_cleaned';


-- =====================================================
-- 5. CHECK COLUMN NAMES
-- =====================================================

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'telco_churn_cleaned'
ORDER BY ORDINAL_POSITION;


-- =====================================================
-- 6. CHECK NUMERICAL COLUMN STATISTICS
-- =====================================================

SELECT
    MIN(tenure) AS minimum_tenure,
    MAX(tenure) AS maximum_tenure,
    AVG(CAST(tenure AS FLOAT)) AS average_tenure,

    MIN(MonthlyCharges) AS minimum_monthly_charges,
    MAX(MonthlyCharges) AS maximum_monthly_charges,
    AVG(MonthlyCharges) AS average_monthly_charges,

    MIN(TotalCharges) AS minimum_total_charges,
    MAX(TotalCharges) AS maximum_total_charges,
    AVG(TotalCharges) AS average_total_charges

FROM dbo.telco_churn_cleaned;


-- =====================================================
-- 7. CHECK CHURN DISTRIBUTION
-- =====================================================

SELECT
    Churn,
    COUNT(*) AS customer_count,
    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER()
        AS DECIMAL(5,2)
    ) AS percentage
FROM dbo.telco_churn_cleaned
GROUP BY Churn
ORDER BY Churn;


-- =====================================================
-- 8. CHECK GENDER DISTRIBUTION
-- =====================================================

SELECT
    gender,
    COUNT(*) AS customer_count
FROM dbo.telco_churn_cleaned
GROUP BY gender;


-- =====================================================
-- 9. CHECK CONTRACT TYPE DISTRIBUTION
-- =====================================================

SELECT
    Contract,
    COUNT(*) AS customer_count
FROM dbo.telco_churn_cleaned
GROUP BY Contract
ORDER BY customer_count DESC;


-- =====================================================
-- 10. CHECK INTERNET SERVICE DISTRIBUTION
-- =====================================================

SELECT
    InternetService,
    COUNT(*) AS customer_count
FROM dbo.telco_churn_cleaned
GROUP BY InternetService
ORDER BY customer_count DESC;


-- =====================================================
-- 11. CHECK PAYMENT METHOD DISTRIBUTION
-- =====================================================

SELECT
    PaymentMethod,
    COUNT(*) AS customer_count
FROM dbo.telco_churn_cleaned
GROUP BY PaymentMethod
ORDER BY customer_count DESC;


-- =====================================================
-- 12. CHECK TENURE DISTRIBUTION
-- =====================================================

SELECT
    tenure,
    COUNT(*) AS customer_count
FROM dbo.telco_churn_cleaned
GROUP BY tenure
ORDER BY tenure;


-- =====================================================
-- 13. CHECK MONTHLY CHARGES DISTRIBUTION
-- =====================================================

SELECT
    MIN(MonthlyCharges) AS minimum_charge,
    MAX(MonthlyCharges) AS maximum_charge,
    AVG(MonthlyCharges) AS average_charge,
    STDEV(MonthlyCharges) AS standard_deviation
FROM dbo.telco_churn_cleaned;


-- =====================================================
-- END OF DATA PROFILING
-- =====================================================
