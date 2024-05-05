-- Objective : Create an exhaustive dataset for all chocolate products

SELECT 
    company,
    brand,
    category,
    subcategory,
    subcategory2,
    product_name,
    product_url,
    product_price,
    product_weight_g,
    quantity,
    date_photo,
    ID_scraping
FROM {{ref("jeff_de_bruges")}}

UNION DISTINCT

SELECT 
    company,
    brand,
    category,
    subcategory,
    subcategory2,
    product_name,
    product_url,
    product_price,
    product_weight_g,
    quantity,
    date_photo,
    ID_scraping
FROM {{ref("alain_ducasse")}}

UNION DISTINCT

SELECT 
    company,
    brand,
    category,
    subcategory,
    subcategory2,
    product_name,
    product_url,
    product_price,
    product_weight_g,
    quantity,
    date_photo,
    ID_scraping
FROM {{ref("lindt")}}

UNION DISTINCT

SELECT 
    company,
    brand,
    category,
    subcategory,
    subcategory2,
    product_name,
    product_url,
    product_price,
    product_weight_g,
    quantity,
    date_photo,
    ID_scraping
FROM {{ref("maison_du_chocolat")}}

UNION DISTINCT

SELECT 
    company,
    brand,
    category,
    subcategory,
    subcategory2,
    product_name,
    product_url,
    product_price,
    product_weight_g,
    quantity,
    date_photo,
    ID_scraping
FROM {{ref("franprix")}}
-- Franprix dataset contains products not related to chocolate
WHERE UPPER(brand) NOT IN ('FREEDENT', 'FINI', 'HARIBO', 'TIC TAC', 'CARAMBAR', 
    'HOLLYWOOD', 'AIRWAVES', 'LABEYRIE', 'TETES BRÛLÉES', 'RICOLA', 'VICHY', 'MALABAR', 'KREMA')
    AND UPPER(product_name) NOT LIKE '%BONBON%'
    AND UPPER(product_name) NOT LIKE '%CHEWING%'
    AND UPPER(product_name) NOT LIKE '%POP%CORN%'
    AND UPPER(product_name) NOT LIKE '%PASTILLE%'

UNION DISTINCT

SELECT 
    company,
    brand,
    category,
    subcategory,
    subcategory2,
    product_name,
    product_url,
    product_price,
    product_weight_g,
    quantity,
    date_photo,
    ID_scraping
FROM {{ref("abtey")}}

UNION DISTINCT

SELECT 
    company,
    brand,
    category,
    subcategory,
    subcategory2,
    product_name,
    product_url,
    price_no_reduction AS product_price,
    product_weight_g,
    quantity,
    date_photo,
    ID_scraping
FROM {{ref("castelain")}}
     
     