
-- STEP 1: MONTHLY REVENUE EXPOSURE FROM CHURNED CUSTOMERS

SELECT

    COUNT(*) AS churned_customers,

    SUM(MonthlyCharges) AS monthly_revenue_exposure,

    AVG(MonthlyCharges) AS average_monthly_charge,

    SUM(MonthlyCharges) * 12 AS annualized_revenue_exposure

FROM dbo.telco_churn_cleaned

WHERE Churn = 1;



-- STEP 2: REVENUE EXPOSURE BY CONTRACT TYPE

SELECT

    Contract,

    COUNT(*) AS churned_customers,

    SUM(MonthlyCharges) AS monthly_revenue_exposure,

    AVG(MonthlyCharges) AS average_monthly_charge,

    SUM(MonthlyCharges) * 12 AS annualized_revenue_exposure

FROM dbo.telco_churn_cleaned

WHERE Churn = 1

GROUP BY Contract

ORDER BY monthly_revenue_exposure DESC;



-- STEP 3: REVENUE EXPOSURE BY TENURE GROUP

SELECT

    CASE
        WHEN tenure BETWEEN 0 AND 12
            THEN 'New (0-12 months)'

        WHEN tenure BETWEEN 13 AND 24
            THEN 'Early (13-24 months)'

        WHEN tenure BETWEEN 25 AND 48
            THEN 'Mid-term (25-48 months)'

        WHEN tenure BETWEEN 49 AND 72
            THEN 'Long-term (49-72 months)'
    END AS tenure_group,

    COUNT(*) AS churned_customers,

    SUM(MonthlyCharges) AS monthly_revenue_exposure,

    AVG(MonthlyCharges) AS average_monthly_charge,

    SUM(MonthlyCharges) * 12 AS annualized_revenue_exposure

FROM dbo.telco_churn_cleaned

WHERE Churn = 1

GROUP BY
    CASE
        WHEN tenure BETWEEN 0 AND 12
            THEN 'New (0-12 months)'
        WHEN tenure BETWEEN 13 AND 24
            THEN 'Early (13-24 months)'
        WHEN tenure BETWEEN 25 AND 48
            THEN 'Mid-term (25-48 months)'
        WHEN tenure BETWEEN 49 AND 72
            THEN 'Long-term (49-72 months)'
    END

ORDER BY monthly_revenue_exposure DESC;




-- STEP 4: REVENUE EXPOSURE BY INTERNET SERVICE

SELECT

    InternetService,

    COUNT(*) AS churned_customers,

    SUM(MonthlyCharges) AS monthly_revenue_exposure,

    AVG(MonthlyCharges) AS average_monthly_charge,

    SUM(MonthlyCharges) * 12 AS annualized_revenue_exposure

FROM dbo.telco_churn_cleaned

WHERE Churn = 1

GROUP BY InternetService

ORDER BY monthly_revenue_exposure DESC;



-- STEP 5: REVENUE EXPOSURE BY PAYMENT METHOD

SELECT

    PaymentMethod,

    COUNT(*) AS churned_customers,

    SUM(MonthlyCharges) AS monthly_revenue_exposure,

    AVG(MonthlyCharges) AS average_monthly_charge,

    SUM(MonthlyCharges) * 12 AS annualized_revenue_exposure

FROM dbo.telco_churn_cleaned

WHERE Churn = 1

GROUP BY PaymentMethod

ORDER BY monthly_revenue_exposure DESC;



-- STEP 6: FINAL REVENUE EXPOSURE SUMMARY

SELECT

    COUNT(*) AS total_churned_customers,

    SUM(MonthlyCharges) AS total_monthly_revenue_exposure,

    AVG(MonthlyCharges) AS average_monthly_charge,

    SUM(MonthlyCharges) * 12 AS annualized_revenue_exposure,

    AVG(TotalCharges) AS average_historical_total_charges

FROM dbo.telco_churn_cleaned

WHERE Churn = 1;
