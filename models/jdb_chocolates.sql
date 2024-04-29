-- Objectives:
    -- Build a chocolate dataset for Jeff de Bruges (union the 2 datasets derived from web scraping)
    -- Create categories and subcategories of product

WITH base AS (
    SELECT 
        product_name, 
        image_url, 
        product_url, 
        price AS product_price,
        weight_grams AS product_weight_g
    FROM `dbt-chocolate-project.dbt_chocolate_setup.jdb_choco` 

    UNION DISTINCT

    SELECT 
        product_name, 
        image_url, 
        product_url, 
        price AS product_price_euros,
        weight_grams AS product_weight_g
    FROM `dbt-chocolate-project.dbt_chocolate_setup.jdb_choco2` 
)

SELECT 
    'Chocolate' AS CATEGORY,
    CASE 
        WHEN UPPER(product_name) LIKE '%TABLETTE%' THEN 'Tablette'
        WHEN UPPER(product_name) LIKE '%CREME%GLACEE%' THEN 'Creme glacee'
        WHEN UPPER(product_name) LIKE '%SORBET%' THEN 'Sorbet'
        WHEN UPPER(product_name) LIKE '%SUCETTE%' THEN 'Sucette'
        WHEN UPPER(product_name) LIKE '%CALISSON%' THEN 'Calisson'
        WHEN UPPER(product_name) LIKE '%OURSON%' THEN 'Ourson'
        WHEN UPPER(product_name) LIKE '%MARSHMALLOW%' THEN 'Marshmallow'
        WHEN UPPER(product_name) LIKE '%MARSHMALLOW%' THEN 'Ecorce'
        WHEN UPPER(product_name) LIKE '%BALLOTIN%' THEN 'Ballotin'
        WHEN UPPER(product_name) LIKE '%BOITE%' THEN 'Boite'
        ELSE 'Autres'
    END AS SUB_CATEGORY,
    base.*
FROM base