{{
  config(
    materialized='view'
  )
}}

WITH base AS (
    SELECT DISTINCT
        timestamp_photo,
        date_photo,
        brand,
        product_name, 
        image_url, 
        product_price,
        price_per_kilo,
        weight_grams AS product_weight_g,
        DENSE_RANK() OVER (PARTITION BY product_name ORDER BY date_photo DESC) AS RANK_SCRAP
    FROM `dbt-chocolate-project.dbt_chocolate_setup.franprix` 
)

SELECT 
    timestamp_photo,
    date_photo,
    brand,
    REGEXP_REPLACE(NORMALIZE(product_name, NFD), r"\pM", '') AS product_name,
    image_url, 
    product_price,
    price_per_kilo,
    product_weight_g,
    RANK_SCRAP
FROM base
WHERE RANK_SCRAP = 1