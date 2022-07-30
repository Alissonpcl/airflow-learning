# Steps to start the Service

1. Follow the steps in docker/README.MD
2. Write/Edit Dags in dags folder

# Writing DAGs using Intellij

As Airflow is executed in a container we don't need to install it locally. However, IDEs will require it to be

installed locally to find the packages used during the DAGs development for code intellisense.

To solve it just install the libraries locally using one of the scripts below:

- Linux/MacOs -> [create_venv_with_airflow.sh](create_venv_with_airflow.sh)
- Windows -> [create_venv_with_airflow-windows.ps1](create_venv_with_airflow-windows.ps1)

Then configure IDE with the proper Interpreter.

[Intellij - Configure a system interpreter](https://www.jetbrains.com/help/idea/configuring-local-python-interpreters.html)

It is also required to install the dependencies in [requirements.txt](requirements.txt) file. It is required because
some packages, like the Airflow PostgreSQL provider, that comes with the Airflow Docker version need to be available in
local env to.

# About Airflow

[Click here](https://magnificent-mascara-e4a.notion.site/Airflow-5c80f9d963864bcab6ddf96ed8b91bea) to open my personal
documentation about Airflow. 