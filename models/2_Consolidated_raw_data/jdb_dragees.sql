-- Objectives:
    -- Build a 'dragees' (sugared almonds) dataset for Jeff de Bruges (union the 2 datasets derived from web scraping)
    -- Create categories and subcategories of product

SELECT 
    'Dragees' AS category,
    'Dragees' AS subcategory,
    regexp_extract(product_url, r'com/([^/$]*)') AS subcategory2,
    base.*
FROM {{ref("jdb_dragees_stg")}} AS base
ORDER BY subcategory