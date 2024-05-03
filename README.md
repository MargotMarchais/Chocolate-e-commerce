# Market study | Chocolate e-commerce in France


*<b>Executive summary</b>*: My goal for this project was to collect data from various chocolate 
makers and distributors in France, and eventually build a comprehensive dataset about the chocolate online market in France.

*<b>Methodology:</b>*
- Web scraping: I scraped product data from several French e-commerce websites (chocolate section), using Python scrapy and requests libraries.
- Python: I build an additional script to: 
    - do some minor transformations to the .csv files resulting from web scraping (data cleaning)
    - automatically load the resulting dataframes in BigQuery using the bigquery.client
- GCP BigQuery: I created an account and an empty project in GCP.
- dbt: I created a dbt Cloud project that is connected to my BigQuery project. In this dbt project, I created 3 sections:
    - Bronze (staging): raw data, with few modifications.
    - Silver (transformations): the raw data with some transformations (new columns, filters, etc)
    - Gold (final): final datasets that will be used for analysis.
      Thanks to dbt, I could 'export' the SQL views and tables to GCP BigQuery. I also managed to create the data lineage, QoD tests and documentation. All dbt modifications were saved thanks to dbt-Github.
- PowerBI: Finally, I could plug my Gold final datasets to Power BI to create a visual overview of the market.

*<b>Final output</b>*
- A comprehensive dataset about the French chocolates online market
- A visual Power BI dashboard

*<b>Technical learnings:</b>* I did this project to help me acquire new skills such as:
build a datawharehouse in GCP Bigquery, automatically feed this DWH with scraped data thanks to a Python script, 
learn how to use dbt (data transformations, tests and docs generation),... It also made me refresh my web scraping skills (scrapy and requests libraries).

Aperçu du dashboard:

<img width="442" alt="2024-05-03_15h09_01" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/f16d8542-372a-4a96-9e6e-57e15edbde03">
<img width="443" alt="2024-05-03_15h09_10" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/00264fba-f83b-4eda-8a72-0bc610eb28da">
<img width="587" alt="2024-05-03_15h15_12" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/41ae6b33-89c8-4a45-b772-c50ffd605619">

Informations détaillées sur les marques:

<img width="439" alt="2024-05-03_15h15_33" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/72552c56-2670-4d9d-9cbb-e7736e95ddf8">
<img width="439" alt="2024-05-03_15h15_59" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/dd3a4963-cb1e-4917-83b1-4c5dd671fb9a">



