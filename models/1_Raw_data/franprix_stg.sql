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
        DENSE_RANK() OVER (PARTITION BY product_name ORDER BY timestamp_photo DESC) AS RANK_SCRAP
    FROM `dbt-chocolate-project.dbt_chocolate_setup.franprix` 
)

SELECT *
FROM base
WHERE RANK_SCRAP = 1