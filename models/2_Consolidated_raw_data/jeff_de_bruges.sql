-- Objectives:
    -- Create product categories and subcategories

SELECT 
    'Jeff de Bruges' AS company,
    'Chocolat' AS category,
    CASE 
        WHEN UPPER(product_name) LIKE '%BO_TE%' THEN 'Boites'
        WHEN UPPER(product_name) LIKE '%COFFRET%' THEN 'Boites'
        WHEN UPPER(product_name) LIKE '%SACHET%' THEN 'Boites'
        WHEN UPPER(product_name) LIKE '%BALLOTIN%' THEN 'Boites'
        WHEN UPPER(product_name) LIKE '%GANACHES%' THEN 'Boites'
        WHEN UPPER(product_name) LIKE '%POT%' THEN 'Boites'
        WHEN UPPER(product_name) LIKE '%CORNET%' THEN 'Boites'
        WHEN UPPER(product_name) LIKE '%TABLETTE%' THEN 'Tablettes'
        WHEN UPPER(product_name) LIKE '%BARRE%' THEN 'Tablettes'
        WHEN UPPER(product_name) LIKE '%ECORCE%' THEN 'Tablettes'
        WHEN UPPER(product_name) LIKE '%ETUI%' THEN 'Tablettes'
        WHEN UPPER(product_name) LIKE '%SORBET%' THEN 'Glaces'
        WHEN UPPER(product_name) LIKE '%CR_ME%GLAC_E%' THEN 'Glaces'
        WHEN UPPER(product_name) LIKE '%SUCETTE%' THEN 'Sucreries'
        WHEN UPPER(product_name) LIKE '%MARSHMALLOW%' THEN 'Sucreries'
        WHEN UPPER(product_name) LIKE '%OURS%GUIMAUVE%' THEN 'Sucreries'
        WHEN UPPER(product_name) LIKE '%CALISSON%' THEN 'Biscuits'
        WHEN UPPER(product_name) LIKE '%MENDIANT%' THEN 'Biscuits'
        WHEN UPPER(product_name) LIKE '%BISCUIT%' THEN 'Biscuits'
        WHEN UPPER(product_name) LIKE '%P_TE%TARTINER%' THEN 'Petit déjeuner'
        WHEN UPPER(product_name) LIKE '%CARR_MAISON%' THEN 'Pâtisserie'
        WHEN UPPER(product_name) LIKE '%AMANDE%' THEN 'Fruits secs'
        WHEN UPPER(product_name) LIKE '%NOISETTE%' THEN 'Fruits secs'
        WHEN UPPER(product_name) LIKE '%PISTACHE%' THEN 'Fruits secs'
        ELSE 'Autres'
    END AS subcategory,
    CASE 
        WHEN UPPER(product_name) LIKE '%BO_TE%' THEN 'Boite'
        WHEN UPPER(product_name) LIKE '%COFFRET%' THEN 'Coffret'
        WHEN UPPER(product_name) LIKE '%SACHET%' THEN 'Sachet'
        WHEN UPPER(product_name) LIKE '%BALLOTIN%' THEN 'Ballotin'
        WHEN UPPER(product_name) LIKE '%GANACHES%' THEN 'Ganache'
        WHEN UPPER(product_name) LIKE '%POT%' THEN 'Pot'
        WHEN UPPER(product_name) LIKE '%CORNET%' THEN 'Cornet'
        WHEN UPPER(product_name) LIKE '%TABLETTE%' THEN 'Tablette'
        WHEN UPPER(product_name) LIKE '%BARRE%' THEN 'Barre'
        WHEN UPPER(product_name) LIKE '%ECORCE%' THEN 'Ecorce'
        WHEN UPPER(product_name) LIKE '%ETUI%' THEN 'Etui'
        WHEN UPPER(product_name) LIKE '%SORBET%' THEN 'Sorbet'
        WHEN UPPER(product_name) LIKE '%CR_ME%GLAC_E%' THEN 'Crème glacée'
        WHEN UPPER(product_name) LIKE '%SUCETTE%' THEN 'Sucette'
        WHEN UPPER(product_name) LIKE '%MARSHMALLOW%' THEN 'Marshmallows'
        WHEN UPPER(product_name) LIKE '%OURS%GUIMAUVE%' THEN 'Ours guimauve'
        WHEN UPPER(product_name) LIKE '%CALISSON%' THEN 'Calisson'
        WHEN UPPER(product_name) LIKE '%MENDIANT%' THEN 'Mendiant'
        WHEN UPPER(product_name) LIKE '%BISCUIT%' THEN 'Biscuit'
        WHEN UPPER(product_name) LIKE '%P_TE%TARTINER%' THEN 'Pâte à tartiner'
        WHEN UPPER(product_name) LIKE '%CARR_MAISON%' THEN 'Carré maison'
        WHEN UPPER(product_name) LIKE '%AMANDE%' THEN 'Amandes'
        WHEN UPPER(product_name) LIKE '%NOISETTE%' THEN 'Noisettes'
        WHEN UPPER(product_name) LIKE '%PISTACHE%' THEN 'Pistaches'
        ELSE 'Autres'
    END AS subcategory2,
    base.*

FROM {{ref("jeff_de_bruges_stg")}} AS base

ORDER BY subcategory