# Coding Assignment

### 1) Split a time interval into equal portions
**The answer**
**This is the query** : https://github.com/skamal13/coding_assignment/blob/main/code/split_time_interval.sql

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

this is dimention table (dim_product) after merge with staging table (stg_product)
Tabel dim_product
| product_id    | product_name  | quantity  | start_date |  end_date  |
| ------------- |:-------------:| ---------:| ---------: |  ---------:|
| 1             | product a     |   10      | 2022-01-29 | 9999-12-30 |
| 2             | product b     |   20      | 2022-01-29 | 9999-12-30 |
| 3             | product c     |   30      | 2022-01-29 | 2022-01-30 |
| 3             | product c     |   30      | 2022-01-30 | 9999-12-30 |
| 4             | product d     |   40      | 2022-01-30 | 9999-12-30 |

**This is the query** : https://github.com/skamal13/coding_assignment/blob/main/code/dim_product.sql

### 2) build a table C from joining table A and table B with some key, but the table A is in project X and table B is in project Y(having different regions too) in google cloud
**The answer**
**This is the query** : https://github.com/skamal13/coding_assignment/blob/main/code/tabel_c.sql
