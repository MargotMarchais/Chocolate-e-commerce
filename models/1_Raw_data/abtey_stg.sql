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
        id AS id_product,
        brand,
        product_name, 
        meta_description,
        meta_title,	
        category,
        category_name,
        image_url, 
        on_sale,
        low_stock_alert,
        quantity,
        product_url, 
        has_discount,
        price_no_reduction,
        available_for_order,
        date_update,
        link_rewrite,
        format,
        saveur,
        teneur_cocoa,
        weight_grams AS product_weight_g,
        DENSE_RANK() OVER (PARTITION BY product_name ORDER BY date_photo DESC) AS RANK_SCRAP
    FROM `dbt-chocolate-project.dbt_chocolate_setup.abtey` 
)

SELECT 
    ID_scraping,
    timestamp_photo,
    date_photo,
    id_product,
    brand,
    REGEXP_REPLACE(NORMALIZE(product_name, NFD), r"\pM", '') AS product_name, 
    meta_description,
    meta_title,	
    category,
    category_name,
    image_url, 
    on_sale,
    low_stock_alert,
    quantity,
    product_url, 
    has_discount,
    price_no_reduction,
    available_for_order,
    date_update,
    link_rewrite,
    format,
    saveur,
    teneur_cocoa,
    product_weight_g,
    RANK_SCRAP
FROM base
WHERE RANK_SCRAP = 1