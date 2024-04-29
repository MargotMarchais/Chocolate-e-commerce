-- Objective : Create an exhaustive dataset for all Jeff de Bruges products

SELECT *
FROM {{ref("jdb_chocolates")}}

UNION DISTINCT

SELECT *
FROM {{ref("jdb_dragees")}}

UNION DISTINCT

SELECT *
FROM {{ref("jdb_glaces")}}

