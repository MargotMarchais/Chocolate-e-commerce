-- Objective : Create basic summary statistics for each brand available in the Chocolates dataset

-- Compute the price/kg
WITH base AS (
    SELECT 
        t.*,
        CASE 
            WHEN product_price IS NOT NULL AND product_weight_g IS NOT NULL
                THEN  ROUND(product_price / product_weight_g * 1000,2)
            ELSE NULL
        END AS price_per_kilo
    FROM {{ref('Chocolates')}} AS t
),

-- Get the dominant subcategory for each brand (i.e. the subcategory that offers the most diverse products, by brand)
dom_subcateg AS (
    SELECT 
        brand, 
        subcategory AS dom_subcategory,
        nb_products_subcateg AS dom_subcateg_nb_products
    FROM (
        SELECT 
            brand, 
            subcategory, 
            nb_products_subcateg,
            DENSE_RANK() OVER (PARTITION BY brand ORDER BY nb_products_subcateg DESC, subcategory DESC) AS ranking_subcateg
        FROM (
            SELECT 
                brand, 
                subcategory,
                COUNT(DISTINCT product_name) AS nb_products_subcateg
            FROM {{ref('Chocolates')}}
            GROUP BY 1,2
        )
    )
    WHERE ranking_subcateg = 1
),


-- Get the most and least expensive product for each brand
product_pricing AS (
    SELECT DISTINCT
        brand, 
        -- product_name,
        -- product_price,
        brand_min_price AS brand_min_price_product,
        brand_max_price AS brand_max_price_product,
        MAX(CASE WHEN product_price = brand_min_price THEN product_name ELSE NULL END) OVER (PARTITION BY brand) AS product_min_price,
        MAX(CASE WHEN product_price = brand_max_price THEN product_name ELSE NULL END) OVER (PARTITION BY brand) AS product_max_price,
    FROM (
        SELECT 
            brand, 
            product_name,
            product_price,
            MAX(product_price) OVER (PARTITION BY brand) AS brand_max_price,
            MIN(product_price)  OVER (PARTITION BY brand) AS brand_min_price
        FROM `dbt-chocolate-project.dbt_mmarchaismaurice.Chocolates` 
    )
    WHERE product_price = brand_min_price
        OR product_price = brand_max_price
),

-- Aggregate statistics per brand
agg AS (
    SELECT 
        base.brand,
        COUNT(DISTINCT base.company) AS nb_distrib_channels,
        COUNT(DISTINCT base.product_name) AS nb_products,
        COUNT(DISTINCT base.subcategory) AS nb_subcateg,
        COUNT(DISTINCT base.subcategory2) AS nb_subcateg2,
        ROUND(AVG(base.price_per_kilo),2) AS avg_price_per_kg,
        MIN(base.price_per_kilo) AS min_price_per_kg,
        MAX(base.price_per_kilo) AS max_price_per_kg

    FROM base
    GROUP BY 1
)


-- All together
SELECT 
    agg.*
    , dom_subcateg.dom_subcategory
    , dom_subcateg.dom_subcateg_nb_products
    , brand_min_price_product
    , brand_max_price_product
    , product_min_price
    , product_max_price

FROM agg 

LEFT JOIN dom_subcateg
    ON agg.brand = dom_subcateg.brand

LEFT JOIN product_pricing
    ON agg.brand = product_pricing.brand

ORDER BY brand 