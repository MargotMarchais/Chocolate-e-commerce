{{
  config(
    materialized='view'
  )
}}

SELECT 
    product_name, 
    image_url, 
    product_url, 
    price AS product_price,
    weight_grams AS product_weight_g
FROM `dbt-chocolate-project.dbt_chocolate_setup.jdb_choco2` 