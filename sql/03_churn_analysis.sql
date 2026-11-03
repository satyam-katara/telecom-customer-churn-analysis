
-- STEP 1: OVERALL CUSTOMER CHURN ANALYSIS

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 1 THEN 1
        ELSE 0
    END) AS churned_customers,

    SUM(CASE
        WHEN Churn = 0 THEN 1
        ELSE 0
    END) AS retained_customers,

    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS churn_rate

FROM dbo.telco_churn_cleaned;



-- STEP 2: CHURN ANALYSIS BY CONTRACT TYPE

SELECT
    Contract,

    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 1 THEN 1
        ELSE 0
    END) AS churned_customers,

    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS churn_rate

FROM dbo.telco_churn_cleaned

GROUP BY Contract

ORDER BY churn_rate DESC;



-- STEP 3: CONTRIBUTION TO TOTAL CHURN BY CONTRACT

SELECT
    Contract,

    SUM(CASE
        WHEN Churn = 1 THEN 1
        ELSE 0
    END) AS churned_customers,

    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 /
        SUM(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END))
        OVER()
        AS DECIMAL(5,2)
    ) AS contribution_to_total_churn

FROM dbo.telco_churn_cleaned

GROUP BY Contract

ORDER BY contribution_to_total_churn DESC;



-- STEP 4: CHURN ANALYSIS BY TENURE GROUP

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

    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN Churn = 1 THEN 1
        ELSE 0
    END) AS churned_customers,

    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS churn_rate

FROM dbo.telco_churn_cleaned

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

ORDER BY
    CASE
        WHEN MIN(tenure) BETWEEN 0 AND 12 THEN 1
        WHEN MIN(tenure) BETWEEN 13 AND 24 THEN 2
        WHEN MIN(tenure) BETWEEN 25 AND 48 THEN 3
        WHEN MIN(tenure) BETWEEN 49 AND 72 THEN 4
    END;

-- STEP 5: CHURN ANALYSIS BY PAYMENT METHOD

SELECT
    PaymentMethod,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 1 THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS churn_rate

FROM dbo.telco_churn_cleaned

GROUP BY PaymentMethod

ORDER BY churn_rate DESC;


-- STEP 6: CHURN ANALYSIS BY INTERNET SERVICE

SELECT
    InternetService,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 1 THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS churn_rate

FROM dbo.telco_churn_cleaned

GROUP BY InternetService

ORDER BY churn_rate DESC;


-- STEP 7: CHURN ANALYSIS BY INDIVIDUAL SERVICES

SELECT
    s.service_name,
    s.service_status,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN t.Churn = 1 THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    CAST(
        SUM(CASE WHEN t.Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS churn_rate

FROM dbo.telco_churn_cleaned AS t

CROSS APPLY
(
    VALUES
        ('OnlineSecurity', t.OnlineSecurity),
        ('TechSupport', t.TechSupport),
        ('OnlineBackup', t.OnlineBackup),
        ('DeviceProtection', t.DeviceProtection),
        ('StreamingTV', t.StreamingTV),
        ('StreamingMovies', t.StreamingMovies)
) AS s(service_name, service_status)

GROUP BY
    s.service_name,
    s.service_status

ORDER BY
    s.service_name,
    churn_rate DESC;

-- STEP 8: CHURN ANALYSIS BY PAPERLESS BILLING

SELECT
    PaperlessBilling,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 1 THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS churn_rate

FROM dbo.telco_churn_cleaned

GROUP BY PaperlessBilling

ORDER BY churn_rate DESC;



-- STEP 9: CHURN ANALYSIS BY SENIOR CITIZEN STATUS

SELECT
    SeniorCitizen,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 1 THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS churn_rate

FROM dbo.telco_churn_cleaned

GROUP BY SeniorCitizen

ORDER BY churn_rate DESC;



-- STEP 10: CHURN ANALYSIS BY CONTRACT AND TENURE

SELECT
    Contract,

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

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 1 THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    CAST(
        SUM(CASE WHEN Churn = 1 THEN 1.0 ELSE 0 END)
        * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS churn_rate

FROM dbo.telco_churn_cleaned

GROUP BY
    Contract,

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

ORDER BY churn_rate DESC;
