{{
  config(
    materialized='view'
  )
}}

SELECT DISTINCT
    date_photo,
    product_name, 
    image_url, 
    product_url, 
    price AS product_price,
    weight_grams AS product_weight_g
FROM `dbt-chocolate-project.dbt_chocolate_setup.jeff_de_bruges` 