#!/bin/bash

echo "Create a local virtualenv"
python3 -m venv .myenv

echo "Activating env"
source ./.myenv/bin/activate

AIRFLOW_HOME=$(pwd)/airflow
export AIRFLOW_HOME
echo "AIRFLOW_HOME=${AIRFLOW_HOME}"

# Install Airflow using the constraints file
AIRFLOW_VERSION=2.3.3
PYTHON_VERSION="$(python3 --version | cut -d " " -f 2 | cut -d "." -f 1-2)"

echo "AIRFLOW_VERSION=${AIRFLOW_VERSION}"
echo "PYTHON_VERSION=${PYTHON_VERSION}"

# For example: 3.7
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
echo "CONSTRAINT_URL=${CONSTRAINT_URL}"

echo "Installing Airflow package"
pip install --default-timeout=1000 "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
