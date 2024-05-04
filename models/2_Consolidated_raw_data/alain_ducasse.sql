-- Objectives:
    -- Create product categories and subcategories
    -- Explicit the name of the company
WITH base AS (
        
    SELECT 
        'ALAIN DUCASSE' AS company,
        'ALAIN DUCASSE' AS brand,
        'Chocolat' AS category,
               CASE 
            WHEN UPPER(product_name) LIKE '%BO_TE%' THEN 'Boites'
            WHEN UPPER(product_name) LIKE '%COFFRET%' THEN 'Boites'
            WHEN UPPER(product_name) LIKE '%SACHET%' THEN 'Boites'
            WHEN UPPER(product_name) LIKE '%BALLOTIN%' THEN 'Boites'
            WHEN UPPER(product_name) LIKE '%GANACHES%' THEN 'Boites'
            WHEN UPPER(product_name) LIKE '%POT%' THEN 'Boites'
            WHEN UPPER(product_name) LIKE '%CORNET%' THEN 'Boites'
            WHEN UPPER(product_name) LIKE '%BARQUETTE%' THEN 'Boites'
            WHEN UPPER(product_name) LIKE '%PANIERE%' THEN 'Boites'
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
            WHEN UPPER(product_name) LIKE '%CACAHUETE%' THEN 'Fruits secs'
            WHEN UPPER(product_name) LIKE '%MOULAGE%' THEN 'Moulage'
            WHEN UPPER(product_name) LIKE '%OEUF%' THEN 'Moulage'
            WHEN UPPER(product_name) LIKE '%PEPITE%' THEN 'Autres'
            WHEN UPPER(product_name) LIKE '%NOUGAT%' THEN 'Autres'
            WHEN UPPER(product_name) LIKE '%TRUFFES%' THEN 'Autres'
            WHEN UPPER(product_name) LIKE '%CALENDRIER%' THEN 'Collection spéciale'
            WHEN UPPER(product_name) LIKE '%NOEL%' THEN 'Collection spéciale'
            WHEN UPPER(product_name) LIKE '%VALENTIN%' THEN 'Collection spéciale'
            WHEN UPPER(product_name) LIKE '%PAQUES%' THEN 'Collection spéciale'
            WHEN UPPER(product_name) LIKE '%MUGUET%' THEN 'Collection spéciale'
            WHEN UPPER(product_name) LIKE '%KINDER%' THEN 'Snacking'
            WHEN UPPER(product_name) LIKE '%BILLE%' THEN 'Snacking'
            ELSE 'Autres'
        END AS subcategory,
        CASE 
            WHEN UPPER(product_name) LIKE '%BO_TE%' THEN 'Boite'
            WHEN UPPER(product_name) LIKE '%COFFRET%' THEN 'Coffret'
            WHEN UPPER(product_name) LIKE '%SACHET%' THEN 'Sachet'
            WHEN UPPER(product_name) LIKE '%BALLOTIN%' THEN 'Ballotin'
            WHEN UPPER(product_name) LIKE '%GANACHES%' THEN 'Ganache'
            WHEN UPPER(product_name) LIKE '%POT%' THEN 'Pot'
            WHEN UPPER(product_name) LIKE '%BARQUETTE%' THEN 'Barquette'
            WHEN UPPER(product_name) LIKE '%PANIERE%' THEN 'Panière'
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
            WHEN UPPER(product_name) LIKE '%CACAHUETE%' THEN 'Cacahuetes'
            WHEN UPPER(product_name) LIKE '%MOULAGE%' THEN 'Moulage'
            WHEN UPPER(product_name) LIKE '%OEUF%' THEN 'Oeuf'
            WHEN UPPER(product_name) LIKE '%PEPITE%' THEN 'Pépites'
            WHEN UPPER(product_name) LIKE '%NOUGAT%' THEN 'Nougat'
            WHEN UPPER(product_name) LIKE '%TRUFFES%' THEN 'Truffes'
            WHEN UPPER(product_name) LIKE '%CALENDRIER%' THEN 'Calendrier avent'
            WHEN UPPER(product_name) LIKE '%NOEL%' THEN 'Noël'
            WHEN UPPER(product_name) LIKE '%VALENTIN%' THEN 'Saint-Valentin'
            WHEN UPPER(product_name) LIKE '%PAQUES%' THEN 'Pâques'
            WHEN UPPER(product_name) LIKE '%MUGUET%' THEN 'Muguet'
            WHEN UPPER(product_name) LIKE '%KINDER%' THEN 'Autres'
            WHEN UPPER(product_name) LIKE '%BILLE%' THEN 'Billes'
            ELSE 'Autres'
        END AS subcategory2,
        base.*
    FROM {{ref("alain_ducasse_stg")}} AS base
    )


SELECT 
    company,
    brand,
    category,
    CASE 
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%BO_TE%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%COFFRET%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%SACHET%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%BALLOTIN%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%GANACHES%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%POT%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%CORNET%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%BARQUETTE%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%PANIERE%' THEN 'Boites'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%TABLETTE%' THEN 'Tablettes'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%BARRE%' THEN 'Tablettes'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%ECORCE%' THEN 'Tablettes'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%_TUI%' THEN 'Tablettes'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%SORBET%' THEN 'Glaces'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%CR_ME%GLAC_E%' THEN 'Glaces'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%SUCETTE%' THEN 'Sucreries'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%MARSHMALLOW%' THEN 'Sucreries'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%OURS%GUIMAUVE%' THEN 'Sucreries'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%BILLE%' THEN 'Sucreries'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%CALISSON%' THEN 'Biscuits'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%MENDIANT%' THEN 'Biscuits'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%BISCUIT%' THEN 'Biscuits'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%P_TE%TARTINER%' THEN 'Petit déjeuner'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%CARR_MAISON%' THEN 'Pâtisserie'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%AMANDE%' THEN 'Fruits secs'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%NOISETTE%' THEN 'Fruits secs'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%PISTACHE%' THEN 'Fruits secs'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%MOULAGE%' THEN 'Moulage'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%OEUF%' THEN 'Moulage'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%PEPITE%' THEN 'Autres'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%NOUGAT%' THEN 'Autres'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%TRUFFES%' THEN 'Autres'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%CALENDRIER%' THEN 'Collection spéciale'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%NOEL%' THEN 'Collection spéciale'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%VALENTIN%' THEN 'Collection spéciale'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%PAQUES%' THEN 'Collection spéciale'
        WHEN subcategory = 'Autres' AND UPPER(product_url) LIKE '%MUGUET%' THEN 'Collection spéciale'
        ELSE subcategory
    END AS subcategory,
    CASE 
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%BO_TE%' THEN 'Boite'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%COFFRET%' THEN 'Coffret'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%SACHET%' THEN 'Sachet'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%BALLOTIN%' THEN 'Ballotin'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%GANACHES%' THEN 'Ganache'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%POT%' THEN 'Pot'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%CORNET%' THEN 'Cornet'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%TABLETTE%' THEN 'Tablette'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%BARRE%' THEN 'Barre'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%ECORCE%' THEN 'Ecorce'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%_TUI%' THEN 'Etui'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%SORBET%' THEN 'Sorbet'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%CR_ME%GLAC_E%' THEN 'Crème glacée'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%SUCETTE%' THEN 'Sucette'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%MARSHMALLOW%' THEN 'Marshmallows'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%OURS%GUIMAUVE%' THEN 'Ours guimauve'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%CALISSON%' THEN 'Calisson'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%MENDIANT%' THEN 'Mendiant'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%BISCUIT%' THEN 'Biscuit'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%P_TE%TARTINER%' THEN 'Pâte à tartiner'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%CARR_MAISON%' THEN 'Carré maison'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%AMANDE%' THEN 'Amandes'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%NOISETTE%' THEN 'Noisettes'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%PISTACHE%' THEN 'Pistaches'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%MOULAGE%' THEN 'Moulage'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%OEUF%' THEN 'Oeufs'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%PEPITE%' THEN 'Pépites'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%NOUGAT%' THEN 'Nougat'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%TRUFFES%' THEN 'Truffes'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%CALENDRIER%' THEN 'Calendrier avent'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%NOEL%' THEN 'Noël'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%VALENTIN%' THEN 'Saint-Valentin'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%PAQUES%' THEN 'Pâques'
        WHEN subcategory2 = 'Autres' AND UPPER(product_url) LIKE '%MUGUET%' THEN 'Muguet'
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
ORDER BY subcategory