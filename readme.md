# Realtime Sales analysis using Clickhouse and Metabase

## Steps

1. In terminal create virtual environment and install required libraries

```py
python -m venv venv
venv\Scripts\activate
pip install clickhouse-connect
docker compose up -d
mkdir metabase_plugins
```

2. Download clickhouse.metabase-driver.jar from github [link](https://github.com/ClickHouse/metabase-clickhouse-driver/releases/download/1.51.0/clickhouse.metabase-driver.jar)
   and place it into metabase_plugins (metabase by default doesn't have option to connect to clickhouse)

3. Create dashboard in metabase using queries present in analysis.sql file.

4. Run python clickhouse-stream.py

In another terminal run command below to check in clickhouse if data is streaming of not.

```sql
docker-compose exec clickhouse-client clickhouse-client -h clickhouse
show databases;
show tables;
use sales_db;
select count(*) from sales;
```

6. (Optional) set auto-refresh if needed in Metabase.

# Dashboard:

[Tab1](https://github.com/DenC16/Realtime-Sales-Analysis-Clickhouse-Metabase/blob/master/Dashboard/Dhyanesh_Sales_Analysis_Dashboard.png)
[Tab2](https://github.com/DenC16/Realtime-Sales-Analysis-Clickhouse-Metabase/blob/master/Dashboard/Dhyanesh_Sales_Analysis_Dashboard2.png)
