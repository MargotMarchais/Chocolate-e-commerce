{{
  config(
    materialized='incremental'
  )
}}

WITH base AS (
    SELECT DISTINCT
        CONCAT(product_url, CAST(date_photo AS STRING)) AS ID_scraping,
        timestamp_photo,
        date_photo,
        product_name, 
        image_url, 
        product_url, 
        price AS product_price,
        weight_grams AS product_weight_g,
        DENSE_RANK() OVER (PARTITION BY product_name ORDER BY date_photo DESC) AS RANK_SCRAP
    FROM `dbt-chocolate-project.dbt_chocolate_setup.lindt` 
)

SELECT 
    ID_scraping,
    timestamp_photo,
    date_photo,
    REGEXP_REPLACE(NORMALIZE(product_name, NFD), r"\pM", '') AS product_name,
    image_url, 
    product_url, 
    product_price,
    product_weight_g,
    RANK_SCRAP
FROM base
WHERE RANK_SCRAP = 1