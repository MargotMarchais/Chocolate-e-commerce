# Market study | Chocolate e-commerce French Market


*<b>Executive summary</b>*: My goal for this project was to collect data from various chocolate 
makers and distributors in France, and eventually build a comprehensive dataset about the chocolate online market in France.

*<b>Methodology:</b>*
- Web scraping: I scraped product data for several French e-commerce websites (chocolate section), using Python scrapy and requests libraries.
- Python: I build an additional script to: 
    - do some minor transformations to the .csv files resulting from web scraping (data cleaning)
    - automatically load the resulting dataframes in BigQuery using the bigquery.client
- GCP BigQuery: I created an account and an empty project in GCP.
- dbt: I created a dbt Cloud project that is connected to my BigQuery project. In this dbt project, I created 3 sections:
    - Bronze (staging): raw data, with few modifications.
    - Silver (transformations): data with some transformations (new columns, filters, etc)
    - Gold (final): final datasets that will be used for analysis.
      Thanks to dbt, I could 'export' the SQL views and tables to GCP BigQuery. I also managed to create dbt QoD tests and documentation For the intermediate and final outputs. All dbt modifications were saved thanks to dbt-Github.
- PowerBI: Finally, I could plug my Gold final datasets to Power BI in order to create a visual overview of the market.

*<b>Final output</b>*
- A comprehensive dataset about the French chocolates online market
- A visual Power BI dashboard

*<b>Technical learnings:</b>* I did this project to help me acquire new skills such as:
build a datawharehouse in GCP Bigquery, feed this DWH with scraped data automatically thanks to a Python script, 
learn how to use dbt (data transformations, tests and docs generation),... It also made me refresh my web scraping skills (scrapy and requests libraries).

