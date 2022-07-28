# Introduction
Apache Airflow is one of the hottest technologies in the field of Data Engineering that lets users build, orchestrate and monitor data pipelines at scale.

To test Airflow on your local machine, then the simplest way to do so is with the use of Docker images.

This reposity already has `docker-compose.yaml` so, you could use directly running the followings commands:

```bash
./dev_setup.sh
```

and, when it's done:

```bash
./run.sh
```

After that, you can access to Airflow UI open localhost:8080 in a web browser.

To sign-in in UI; use `AIRFLOW_WWW_USER_USERNAME` and `_AIRFLOW_WWW_USER_PASSWORD` defined in [docker-compose.yaml](https://github.com/amancini83/airflow-local/blob/c1b60cc021a04362e34fa2ac54610b7d99eef742/docker-compose.yaml#L32)

## Prerequisites
You need to make sure you have installed

- Docker Community Edition
- Docker Compose

## Folder Structure

- `dags` — is the place where you can put your dag or python script to run it on airflow

- `data` — is the place to store the data. Inside the folder, you can see 4 more folders
    - `raw`: is the place to store initial data sources
    - `extract`/`transform`: is the place to store extracted or transformed data if you’re going to perform sink.
    - `load`: is the place to store the final data source.

- `transform` — is the place to store a collection of transform functions that we’re going to import to etl_gag.py. 


