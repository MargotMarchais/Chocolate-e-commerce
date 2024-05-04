{{
  config(
    materialized='view'
  )
}}

WITH base AS (
    SELECT DISTINCT
        timestamp_photo,
        date_photo,
        id_product,
        product_name, 
        image_url, 
        product_url, 
        product_price_text,
        has_discount,
        discount_percentage,
        discount_amount_text,
        regular_price,
        regular_price_text,
        product_price,
        weight_grams AS product_weight_g,
        DENSE_RANK() OVER (PARTITION BY product_name ORDER BY date_photo DESC) AS RANK_SCRAP
    FROM `dbt-chocolate-project.dbt_chocolate_setup.abtey` 
)

SELECT 
    timestamp_photo,
    date_photo,
    id_product,
    REGEXP_REPLACE(NORMALIZE(product_name, NFD), r"\pM", '') AS product_name,
    image_url, 
    product_url, 
    product_price,
    product_weight_g,
    product_price_text,
    has_discount,
    discount_percentage,
    discount_amount_text,
    regular_price,
    regular_price_text,
    RANK_SCRAP
FROM base
WHERE RANK_SCRAP = 1