# Introduction
Apache Airflow is one of the hottest technologies in the field of Data Engineering that lets users build, orchestrate and monitor data pipelines at scale.

To test Airflow on your local machine, then the simplest way to do so is with the use of Docker images.

This reposity already has `docker-compose.yaml` so, you could use directly running de followings commands:

```bash
./dev_setup.sh
```

and, when it's done:

```bash
./run.sh
```

After that, you can access to Airflow UI open localhost:8080 in a web browser.

Anyway, I will let you a step by step guide for running Airflow with Docker on your machine with a dummy ETL DAG.

## Prerequisites
You need to make sure you have installed

- Docker Community Edition
- Docker Compose

## Step 1: Fetch docker-compose.yaml
The first thing we’ll need is the docker-compose.yaml file. Create a new directory on your home directory (let’s call it airflow-local):

```bash
$ mkdir airflow-local
$ cd airflow-local
```
And fetch the docker-compose.yaml file (note that we will be using Airflow v2.3.0)

```bash
$ curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.3.0/docker-compose.yaml'
```

Inspect the compose file and the services defined in it namely airflow-scheduler, airflow-webserver, airflow-worker, airflow-init, flower, postgres and redis.

## Step 2: Create directories
Now while you are in the airflow-local directory, we will need to create three additional directories:

dags
logs
plugins

```bash
$ mkdir ./dags ./logs ./plugins
```

## Step 3: Setting the Airflow user
Now we would have to export an environment variable to ensure that the folder on your host machine and the folders within the containers share the same permissions. We will simply add these variables into a file called .env.

```bash
$ echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env
```

## Step 4: Initialise the Airflow Database
Now we are ready initialise the Airflow Database by first starting the airflow-init container:

```bash
$ docker-compose up airflow-init
```

This service will essentially run airflow db init and create the admin user for the Airflow Database. By default, the account created has the login airflow and the password airflow.

## Step 5: Start Airflow services
The final thing we need to do to get Airflow up and running.

```bash
$ docker-compose up
```
Note that the above command may take a while since multiple services need to be started. Once done, you can verify that these images are up and running using the following command in a new command-line tab:

```bash
$ docker ps
```

## Step 6: Access Airflow UI
In order to access Airflow User Interface simply head to your preferred browser and open localhost:8080.
Type in your credentials (as already noted, by default these will be both set to airflow and hit ‘Sign in’. You should now gain access to the Airflow Dashboard where you can see some of the example DAGs patched with Airflow.


## Step 7: Folder Structure

- `dags` — is the place where you can put your dag or python script to run it on airflow

- `data` — is the place to store the data. Inside the folder, you can see 4 more folders
    - `raw`: is the place to store initial data sources
    - `extract`/`transform`: is the place to store extracted or transformed data if you’re going to perform sink.
    - `load`: is the place to store the final data source.

- `transform` — is the place to store a collection of transform functions that we’re going to import to etl_gag.py. 


