{{ config(materialized="table", alias = 'dim_customer') }}

WITH customer AS (
    SELECT

        customer_id,            --HR owned data
        first_name,             --HR owned data
        last_name,              --HR owned data
        ltv,                    -- MARKETING owned data
        propensity_to_leave,    -- MARKETING owned data
        customer_segment,       -- MARKETING owned data
        engagement_score        -- MARKETING owned data


    FROM {{ ref("dim_customer") }} AS hr
    INNER JOIN
        {{ ref("stg_customer_marketingsystem") }} AS marketing
        ON hr.customer_id = marketing.customer_id
)

SELECT * FROM customer