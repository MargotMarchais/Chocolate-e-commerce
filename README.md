# Market study | Chocolate e-commerce in France


*<b>Executive summary</b>*: My goal for this project was to collect data from various chocolate 
makers and distributors in France, and eventually build a comprehensive dataset about the chocolate online market in France.

*<b>Methodology:</b>*
- *Web scraping*: I scraped product data from several French e-commerce websites (chocolate section), using Python scrapy and requests libraries.
- *Python*: I build an additional script to: 
    - do some minor transformations to the .csv files resulting from web scraping (data cleaning)
    - automatically load the resulting dataframes in BigQuery using the bigquery.client
- *GCP BigQuery*: I created an account and an empty project in GCP.
- *dbt*: I created a dbt Cloud project that is connected to my BigQuery project. In this dbt project, I created 3 sections:
    - Bronze (staging): raw data, with few modifications.
    - Silver (transformations): the raw data with some transformations (new columns, filters, etc)
    - Gold (final): final datasets that will be used for analysis.
      Thanks to dbt, I could 'export' the SQL views and tables to GCP BigQuery. I also managed to create the data lineage, QoD tests and documentation. All dbt modifications were saved thanks to dbt-Github.
- *PowerBI*: Finally, I could plug my Gold final datasets to Power BI to create a visual overview of the market.

*<b>Final output</b>*
- A comprehensive dataset about the French chocolates online market
- A visual Power BI dashboard

*<b>Go further</b>*
To learn more about the project, you may read my non technical article here: https://margot-marchais-maurice.webflow.io/chocolate-french-market

*<b>Technical learnings:</b>* I did this project to help me acquire new skills such as:
build a datawharehouse in GCP Bigquery, automatically feed this DWH with scraped data thanks to a Python script, 
learn how to use dbt (data transformations, tests and docs generation),... It also made me refresh my web scraping skills (scrapy and requests libraries).

<b>Aperçu du dashboard:</b>

<img width="497" alt="2024-05-05_10h54_14" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/ea87e452-c736-48fe-b7b0-f3fba1fd0fc1">
<img width="499" alt="2024-05-05_10h54_24" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/3a1bedfe-af30-45b1-851d-4f0091a091ec">
<img width="500" alt="2024-05-05_10h54_33" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/24ff7a18-6e89-4574-9823-3a21f39b6a13">



Brands positioning:

<img width="497" alt="2024-05-05_10h55_09" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/31d536d1-209f-4cc5-92c1-6322c97f2127">
<img width="497" alt="2024-05-05_10h55_51" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/346e160d-5ab9-4b83-bf28-5fe0e50e2b36">



