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
    'Chocolate' AS category,
    CASE 
        WHEN UPPER(product_name) LIKE '%TABLETTE%' THEN 'Tablette'
        WHEN UPPER(product_name) LIKE '%CR_ME%GLAC_E%' THEN 'Crème glacée'
        WHEN UPPER(product_name) LIKE '%SORBET%' THEN 'Sorbet'
        WHEN UPPER(product_name) LIKE '%SUCETTE%' THEN 'Sucette'
        WHEN UPPER(product_name) LIKE '%CALISSON%' THEN 'Calisson'
        WHEN UPPER(product_name) LIKE '%OURS%GUIMAUVE%' THEN 'Ours guimauve'
        WHEN UPPER(product_name) LIKE '%MARSHMALLOW%' THEN 'Marshmallow'
        WHEN UPPER(product_name) LIKE '%_CORCE%' THEN 'Ecorce'
        WHEN UPPER(product_name) LIKE '%BISCUIT%' THEN 'Biscuit'
        WHEN UPPER(product_name) LIKE '%GUSTAVE%' THEN 'Biscuit'
        WHEN UPPER(product_name) LIKE '%TARTINER%' THEN 'Pâte à tartiner'
        WHEN UPPER(product_name) LIKE '%BALLOTIN%' THEN 'Ballotin'
        WHEN UPPER(product_name) LIKE '%BOITE%' THEN 'Boite'
        WHEN UPPER(product_name) LIKE '%AMANDE%' THEN 'Amandes'
        ELSE 'Autres'
    END AS subcategory,
    regexp_extract(product_url, r'com/([^/$]*)') AS subcategory2,
    base.*
FROM base
ORDER BY subcategory