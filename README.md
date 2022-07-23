# Steps to start the Service

1. Follow the steps in docker/README.MD
2. Write/Edit Dags in dags folder

# Writing DAGs using Intellij

As Airflow is executed in a container we don't need to install it locally. However, it Intellij requires it to be
installed locally to find the packes used during the DAGs development for code intellisense.

To solve it just install the libraries locallyt using one of the scripts below:

- Linux/MacOs -> [create_venv_with_airflow.sh](new_structure/create_venv_with_airflow.sh)
- Windows -> [create_venv_with_airflow-windows.ps1](create_venv_with_airflow-windows.ps1)

Then configure IDE with the proper Interpreter.

[Intellij - Configure a system interpreter](https://www.jetbrains.com/help/idea/configuring-local-python-interpreters.html)