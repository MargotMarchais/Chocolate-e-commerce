{{
  config(
    materialized='view'
  )
}}

SELECT DISTINCT
    date_photo,
    product_name, 
    product_subname,
    image_url, 
    product_url, 
    price AS product_price,
    weight_grams AS product_weight_g,
    quantity
FROM `dbt-chocolate-project.dbt_chocolate_setup.alain_ducasse` 