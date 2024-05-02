{{
  config(
    materialized='view'
  )
}}

WITH base AS (
    SELECT DISTINCT
        timestamp_photo,
        date_photo,
        product_name, 
        image_url, 
        product_url, 
        price AS product_price,
        weight_grams AS product_weight_g,
        DENSE_RANK() OVER (PARTITION BY product_name ORDER BY timestamp_photo DESC) AS RANK_SCRAP
    FROM `dbt-chocolate-project.dbt_chocolate_setup.lindt` 
)

SELECT *
FROM base 
WHERE RANK_SCRAP = 1