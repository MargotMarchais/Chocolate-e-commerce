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
    date_photo
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
    date_photo
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
    date_photo
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
    date_photo
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
    date_photo
FROM {{ref("franprix")}}
WHERE product_name NOT LIKE '%chewing%gum%' -- Franprix dataset contains products not related to chocolate