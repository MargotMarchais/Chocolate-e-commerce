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
    product_weight AS product_weight_g,
    quantity,
    rating,
    product_description
FROM `dbt-chocolate-project.dbt_chocolate_setup.maison_du_chocolat` 