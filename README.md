# Coding Assignment

### 1) Split a time interval into equal portions
**The answer is in this query** : https://github.com/skamal13/coding_assignment/blob/main/code/split_time_interval.sql

### 2) Implement a test SCD2 table in BigQuery
**The answer** : 
first assumption has staging table which holds the records from the source and these records need to be pushed to the target dimension table in the data warehouse. SQL will expire the old data and insert the new record.

Tabel stg_product
| product_id    | product_name  | quantity  |
| ------------- |:-------------:| ---------:|
| 1             | product a     |   10      |
| 2             | product b     |   20      |
| 3             | product c     |   30      |
| 4             | product d     |   40      |

Tabel dim_product
| product_id    | product_name  | quantity  | start_date |  end_date  |
| ------------- |:-------------:| ---------:| ---------: |  ---------:|
| 1             | product a     |   10      | 2022-01-29 | 9999-12-30 |
| 2             | product b     |   20      | 2022-01-29 | 9999-12-30 |
| 3             | product c     |   30      | 2022-01-29 | 9999-12-30 |

this below is dimention table (dim_product) after merge with staging table (stg_product)

Tabel dim_product
| product_id    | product_name  | quantity  | start_date |  end_date  |
| ------------- |:-------------:| ---------:| ---------: |  ---------:|
| 1             | product a     |   10      | 2022-01-29 | 9999-12-30 |
| 2             | product b     |   20      | 2022-01-29 | 9999-12-30 |
| 3             | product c     |   30      | 2022-01-29 | 2022-01-30 |
| 3             | product c     |   30      | 2022-01-30 | 9999-12-30 |
| 4             | product d     |   40      | 2022-01-30 | 9999-12-30 |

**The answer is in this query** : https://github.com/skamal13/coding_assignment/blob/main/code/dim_product.sql


### 3) Build a table C from joining table A and table B with some key, but the table A is in project X and table B is in project Y(having different regions too) in google cloud
**The answer is in this query** : https://github.com/skamal13/coding_assignment/blob/main/code/tabel_c.sql


### 4) Split a file which has n number of schema def. And store them in a dict of lists(no 3rd party imports)
**The answer is in this code** : https://github.com/skamal13/coding_assignment/blob/main/code/csv_to_dict.py


### 5) Create a array based table in bigquery and once the table is created, add a new column after every load, and load a file(csv or json) which have blank values in some records ,handle this load 
**The answer is in this code** : https://github.com/skamal13/coding_assignment/blob/main/code/array_based_table.py


### 6) Write a sample code which sends in a pub sub message whenever a new file comes to google cloud storage bucket(message attributes(filename/filepath and the timestamp)
**The answer is in this code** : 
 https://github.com/skamal13/coding_assignment/blob/main/code/create_topic_pubsub.py
 
 https://github.com/skamal13/coding_assignment/blob/main/code/subscribing_pubsub.py
 
 
### 7) Convert [5f241ba580278b1d0459992b,5f252edd80278b1d0459992c] to timestamp using bigquery
**The answer is in this query** : https://github.com/skamal13/coding_assignment/blob/main/code/objectid_timestamp.sql


### 8) Read a config file having flags, and create metric def based on flag values
**The answer is in this code** : https://github.com/skamal13/coding_assignment/blob/main/code/read_config_metric.py
