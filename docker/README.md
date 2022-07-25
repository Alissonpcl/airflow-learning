## Starting the container

> The current yaml file in this repo is customized. At the beginning of the file you can find comments about the changes that were made.

```shell
# Download the yaml file 
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.3.1/docker-compose.yaml'

# Create the local directories
mkdir -p ../dags ../logs ../plugins

# Create the file to set the environment variable UID used be the Airflow (Linux only).
echo -e "AIRFLOW_UID=$(id -u)" > .env

# For the first time we need the prepare the environment using the command below
docker-compose up airflow-init

# Starts airflow service
docker-compose up
```

## Accessing the web interface

After starting the service:

- http://localhost:8080
- Username: airflow
- Password: airflow

## Custom images

If you want to extend Airflow, for example adding new Python Packages, you can customize the image using a Dockerfile.

https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html#using-custom-images