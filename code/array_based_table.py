from google.cloud import bigquery
import pandas as pd
import glob

client = bigquery.Client()
path = "folder"
files = glob.glob(path + "/*.csv")

for filename in files:
    df = pd.read_csv(filename)
    column_name=filename.replace(" ", "_").strip().split('.')
    arrfields=[]
    for column in df.columns:
        arrfields.append(bigquery.SchemaField(column, "STRING", mode="NULLABLE"))

    schema = [
        bigquery.SchemaField(
            column_name[0],
            "RECORD",
            mode="REPEATED",
            fields=arrfields,
        )
    ]

    job_config = bigquery.LoadJobConfig()
    job_config.write_disposition=bigquery.WriteDisposition.WRITE_APPEND
    job_config.schema_update_options=[bigquery.SchemaUpdateOption.ALLOW_FIELD_ADDITION,
            bigquery.SchemaUpdateOption.ALLOW_FIELD_RELAXATION]
    job_config.schema = schema

    load_job = client.load_table_from_dataframe(
        df, '`projectx`.`dataset`.`array_based_table`', job_config = job_config
    )
