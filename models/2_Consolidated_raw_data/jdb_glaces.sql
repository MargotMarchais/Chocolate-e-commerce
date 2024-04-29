-- Objectives:
    -- Build a 'glaces' (ice cream) dataset for Jeff de Bruges (union the 2 datasets derived from web scraping)
    -- Create categories and subcategories of product

WITH base AS (
    SELECT *
    FROM {{ref("jdb_glaces_stg")}} 

    UNION DISTINCT

    SELECT *
    FROM {{ref("jdb_glaces2_stg")}}
)

SELECT 
    'Glace' AS category,
    'Glace' AS subcategory,
    regexp_extract(product_url, r'com/([^/$]*)') AS subcategory2,
    base.*
FROM base
ORDER BY subcategory