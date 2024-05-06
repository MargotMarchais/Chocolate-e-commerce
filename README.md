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

<img width="449" alt="2024-05-06_11h58_36" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/8afef720-91af-49b1-bdbd-2d606fff29b1">
<img width="447" alt="2024-05-06_11h58_45" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/d09f8884-0728-45a4-a6f6-54ff96ddae48">
<img width="500" alt="2024-05-06_11h58_57" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/2bdadbc2-88af-4f72-8cd0-0616c18d71af">


Brands positioning:

<img width="450" alt="2024-05-06_11h59_14" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/a64c3114-77d7-468d-82bf-efdb50b8a90b">
<img width="450" alt="2024-05-06_11h59_27" src="https://github.com/MargotMarchais/Chocolate-e-commerce/assets/116331323/49dbc481-3ce8-4508-86c2-2d33599c6fef">


