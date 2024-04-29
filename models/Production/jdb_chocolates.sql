-- Objectives:
    -- Build a chocolate dataset for Jeff de Bruges (union the 2 datasets derived from web scraping)
    -- Create categories and subcategories of product

WITH base AS (
    SELECT *
    FROM {{ref("jdb_choco_stg")}} 

    UNION DISTINCT

    SELECT *
    FROM {{ref("jdb_choco2_stg")}}
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