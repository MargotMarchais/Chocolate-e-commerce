{{
  config(
    materialized='view'
  )
}}

WITH base AS (
    SELECT DISTINCT
        CONCAT(product_name, '-', CAST(date_photo AS STRING)) AS ID_scraping,
        timestamp_photo,
        date_photo,
        product_name, 
        product_subname,
        image_url, 
        product_url, 
        price AS product_price,
        weight_grams AS product_weight_g,
        quantity,
        DENSE_RANK() OVER (PARTITION BY product_name ORDER BY date_photo DESC) AS RANK_SCRAP
    FROM `dbt-chocolate-project.dbt_chocolate_setup.alain_ducasse` 
)

SELECT 
    ID_scraping,
    timestamp_photo,
    date_photo,
    REGEXP_REPLACE(NORMALIZE(product_name, NFD), r"\pM", '') AS product_name,
    product_subname,
    image_url, 
    product_url, 
    product_price,
    product_weight_g,
    quantity,
    RANK_SCRAP
FROM base
WHERE RANK_SCRAP = 1