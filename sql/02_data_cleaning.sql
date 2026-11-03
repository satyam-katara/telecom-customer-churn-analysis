
-- =====================================================
-- PROJECT: TELECOM CUSTOMER CHURN ANALYSIS
-- FILE: 02_data_cleaning.sql
-- PURPOSE: Data Cleaning and Quality Validation
-- DATABASE: TelecomChurnDB
-- TABLE: dbo.telco_churn_cleaned
-- =====================================================

USE TelecomChurnDB;
GO


-- =====================================================
-- 1. CHECK TOTAL RECORDS
-- =====================================================

SELECT
    COUNT(*) AS total_records
FROM dbo.telco_churn_cleaned;


-- =====================================================
-- 2. CHECK DUPLICATE CUSTOMER IDs
-- =====================================================

SELECT
    customerID,
    COUNT(*) AS duplicate_count
FROM dbo.telco_churn_cleaned
GROUP BY customerID
HAVING COUNT(*) > 1;


-- =====================================================
-- 3. CHECK MISSING VALUES
-- =====================================================

SELECT
    COUNT(*) AS total_records,

    SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END)
        AS missing_customer_ids,

    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END)
        AS missing_gender,

    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END)
        AS missing_tenure,

    SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END)
        AS missing_monthly_charges,

    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END)
        AS missing_total_charges,

    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END)
        AS missing_contract,

    SUM(CASE WHEN PaymentMethod IS NULL THEN 1 ELSE 0 END)
        AS missing_payment_method,

    SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END)
        AS missing_churn

FROM dbo.telco_churn_cleaned;


-- =====================================================
-- 4. CHECK BLANK STRINGS IN TEXT COLUMNS
-- =====================================================

SELECT
    SUM(CASE WHEN LTRIM(RTRIM(gender)) = '' THEN 1 ELSE 0 END)
        AS blank_gender,

    SUM(CASE WHEN LTRIM(RTRIM(Contract)) = '' THEN 1 ELSE 0 END)
        AS blank_contract,

    SUM(CASE WHEN LTRIM(RTRIM(InternetService)) = '' THEN 1 ELSE 0 END)
        AS blank_internet_service,

    SUM(CASE WHEN LTRIM(RTRIM(PaymentMethod)) = '' THEN 1 ELSE 0 END)
        AS blank_payment_method

FROM dbo.telco_churn_cleaned;


-- =====================================================
-- 5. CHECK INVALID NUMERICAL VALUES
-- =====================================================

SELECT
    SUM(CASE WHEN tenure < 0 THEN 1 ELSE 0 END)
        AS negative_tenure,

    SUM(CASE WHEN MonthlyCharges < 0 THEN 1 ELSE 0 END)
        AS negative_monthly_charges,

    SUM(CASE WHEN TotalCharges < 0 THEN 1 ELSE 0 END)
        AS negative_total_charges

FROM dbo.telco_churn_cleaned;


-- =====================================================
-- 6. CHECK ZERO TENURE CUSTOMERS
-- =====================================================

SELECT
    COUNT(*) AS zero_tenure_customers,

    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END)
        AS missing_total_charges,

    SUM(CASE WHEN TotalCharges IS NOT NULL THEN 1 ELSE 0 END)
        AS available_total_charges

FROM dbo.telco_churn_cleaned
WHERE tenure = 0;


-- =====================================================
-- 7. CHECK INVALID CHURN VALUES
-- BIT: 0 = NO, 1 = YES
-- =====================================================

SELECT
    Churn,
    COUNT(*) AS customer_count
FROM dbo.telco_churn_cleaned
GROUP BY Churn;


-- =====================================================
-- 8. CHECK INVALID TENURE RANGE
-- EXPECTED RANGE: 0 TO 72 MONTHS
-- =====================================================

SELECT
    COUNT(*) AS invalid_tenure_records
FROM dbo.telco_churn_cleaned
WHERE tenure < 0 OR tenure > 72;


-- =====================================================
-- 9. CHECK MONTHLY CHARGES OUTLIERS
-- DISPLAY EXTREME VALUES FOR INVESTIGATION
-- =====================================================

SELECT TOP 10
    customerID,
    MonthlyCharges
FROM dbo.telco_churn_cleaned
ORDER BY MonthlyCharges DESC;


-- =====================================================
-- 10. FINAL DATA QUALITY SUMMARY
-- =====================================================

SELECT
    COUNT(*) AS total_records,

    COUNT(DISTINCT customerID) AS unique_customers,

    COUNT(*) - COUNT(DISTINCT customerID)
        AS duplicate_customer_difference,

    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END)
        AS missing_total_charges,

    SUM(CASE WHEN tenure < 0 THEN 1 ELSE 0 END)
        AS invalid_tenure,

    SUM(CASE WHEN MonthlyCharges < 0 THEN 1 ELSE 0 END)
        AS invalid_monthly_charges,

    SUM(CASE WHEN TotalCharges < 0 THEN 1 ELSE 0 END)
        AS invalid_total_charges

FROM dbo.telco_churn_cleaned;


-- =====================================================
-- END OF DATA CLEANING VALIDATION
-- =====================================================
