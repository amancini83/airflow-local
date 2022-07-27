import json
import logging

import pandas as pd
from airflow.decorators import dag, task
from airflow.operators.python import get_current_context
from airflow.utils.dates import days_ago

DATA_PATH = "./airflow/data/raw"
LOAD_PATH = "./airflow/data/load"

default_args = {
    "owner": "Andrés Mancini",
    "start_date": days_ago(1),
}


@dag(default_args=default_args, schedule_interval=None)
def ETL():
    @task()
    def extract():
        context = get_current_context()
        params = context["params"]
        logging.info(f"extract params: {params}")
        data = pd.DataFrame()
        logging.info(f"extract shape: {data.shape}")
        df = data.to_json()
        return json.loads(df)

    @task()
    def transform(df: list):
        context = get_current_context()
        params = context["params"]
        logging.info(f"transforms params: {params}")
        logging.info(f"transform shape: {pd.json_normalize(df)}")
        return {"file_1000": df}

    @task()
    def load(df) -> None:
        context = get_current_context()
        params = context["params"]
        logging.info(f"transforms params: {params}")
        return True

    extracted_data = extract()
    transformed_data = transform(extracted_data)
    done = load(transformed_data)

    (extracted_data >> transformed_data >> done)


etl = ETL()
