WITH establishments_open AS (
    SELECT * FROM {{ ref('stg_V02__establishments_open') }}
),

establishments_closed AS (
    SELECT * FROM {{ ref('stg_V02__establishments_closed') }}
)

SELECT
    establishment_id,
    establishment_name,
    establishment_city,
    establishment_state_code,
    establishment_zip,
    establishment_country_code,
    establishment_score,
    establishment_metro_area,
    establishment_price_symbolic,
    status,
    NULL AS closed_date
FROM establishments_open

UNION ALL

SELECT
    establishment_id,
    establishment_name,
    establishment_city,
    establishment_state_code,
    establishment_zip,
    establishment_country_code,
    NULL AS establishment_score,
    NULL AS establishment_metro_area,
    NULL AS establishment_price_symbolic,
    status,
    closed_date
FROM establishments_closed