echo "Create a local virtualenv"
python3 -m venv .myenv2

echo "Activating env"
.myenv2\Scripts\Activate.ps1

Set-Variable -Name AIRFLOW_HOME -Value "C:\Users\Alisson Lima\Documents\cursos\airflow-learning\new_structure"
echo "AIRFLOW_HOME=${AIRFLOW_HOME}"

# Install Airflow using the constraints file
Set-Variable -Name AIRFLOW_VERSION -Value "2.3.3"
Set-Variable -Name PYTHON_VERSION -Value "3.10"

echo "AIRFLOW_VERSION=${AIRFLOW_VERSION}"
echo "PYTHON_VERSION=${PYTHON_VERSION}"

# For example: 3.7
Set-Variable -Name CONSTRAINT_URL -Value "https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
echo "CONSTRAINT_URL=${CONSTRAINT_URL}"

echo "Installing Airflow package"
pip --default-timeout=1000 install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"