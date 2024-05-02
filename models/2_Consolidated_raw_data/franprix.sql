-- Objectives:
    -- Create product categories and subcategories
    -- Explicit the name of the company
WITH base AS (
    SELECT 
        'FRANPRIX' AS company,
        UPPER(brand) AS BRAND,
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
            WHEN UPPER(product_name) LIKE '%_TUI%' THEN 'Tablettes'
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
            WHEN UPPER(product_name) LIKE '%MOULAGE%' THEN 'Moulage'
            WHEN UPPER(product_name) LIKE '%OEUF%' THEN 'Moulage'
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
            WHEN UPPER(product_name) LIKE '%_TUI%' THEN 'Etui'
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
            WHEN UPPER(product_name) LIKE '%MOULAGE%' THEN 'Moulage'
            WHEN UPPER(product_name) LIKE '%OEUF%' THEN 'Oeufs'
            ELSE 'Autres'
        END AS subcategory2,
        product_name, 
        'Inconnu' AS product_url,
        NULL as quantity,
        image_url,
        product_price,
        product_weight_g,
        date_photo
    FROM {{ref("franprix_stg")}} 
)

SELECT 
    company,
    brand,
    category,
    CASE
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%BO_TE%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%COFFRET%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%SACHET%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%BALLOTIN%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%GANACHES%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%POT%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%CORNET%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%TABLETTE%' THEN 'Tablettes'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%BARRE%' THEN 'Tablettes'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%ECORCE%' THEN 'Tablettes'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%_TUI%' THEN 'Tablettes'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%SORBET%' THEN 'Glaces'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%CR_ME%GLAC_E%' THEN 'Glaces'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%SUCETTE%' THEN 'Sucreries'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%MARSHMALLOW%' THEN 'Sucreries'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%OURS%GUIMAUVE%' THEN 'Sucreries'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%CALISSON%' THEN 'Biscuits'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%MENDIANT%' THEN 'Biscuits'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%BISCUIT%' THEN 'Biscuits'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%P_TE%TARTINER%' THEN 'Petit déjeuner'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%CARR_MAISON%' THEN 'Pâtisserie'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%AMANDE%' THEN 'Fruits secs'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%NOISETTE%' THEN 'Fruits secs'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%PISTACHE%' THEN 'Fruits secs'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%MOULAGE%' THEN 'Moulage'
        WHEN subcategory = 'Autres' AND UPPER(image_url) LIKE '%OEUF%' THEN 'Moulage'
        ELSE subcategory
    END AS subcategory,
    CASE 
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%BO_TE%' THEN 'Boite'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%COFFRET%' THEN 'Coffret'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%SACHET%' THEN 'Sachet'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%BALLOTIN%' THEN 'Ballotin'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%GANACHES%' THEN 'Ganache'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%POT%' THEN 'Pot'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%CORNET%' THEN 'Cornet'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%TABLETTE%' THEN 'Tablette'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%BARRE%' THEN 'Barre'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%ECORCE%' THEN 'Ecorce'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%_TUI%' THEN 'Etui'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%SORBET%' THEN 'Sorbet'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%CR_ME%GLAC_E%' THEN 'Crème glacée'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%SUCETTE%' THEN 'Sucette'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%MARSHMALLOW%' THEN 'Marshmallows'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%OURS%GUIMAUVE%' THEN 'Ours guimauve'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%CALISSON%' THEN 'Calisson'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%MENDIANT%' THEN 'Mendiant'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%BISCUIT%' THEN 'Biscuit'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%P_TE%TARTINER%' THEN 'Pâte à tartiner'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%CARR_MAISON%' THEN 'Carré maison'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%AMANDE%' THEN 'Amandes'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%NOISETTE%' THEN 'Noisettes'
        WHEN subcategory2 = 'Autres' AND UPPER(image_url) LIKE '%PISTACHE%' THEN 'Pistaches'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%MOULAGE%' THEN 'Moulage'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%OEUF%' THEN 'Oeufs'
        ELSE subcategory2
    END AS subcategory2,
    product_name, 
    product_url,
    image_url,
    product_price,
    product_weight_g,
    CAST(quantity AS float64) AS quantity,
    date_photo
FROM base