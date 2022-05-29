# Para criacao de DAGs

Como executo o Airflow em Docker, as bibliotecas não estarão disponíveis para desenvolvimento e as IDEs ficarão acusando erros nos imports na hora de programar as DAGs.

Para resolver isso basta instalar o Airflow no ambiente local de desenvolvimento, fora do container.

O script [create_venv_with_airflow.sh](create_venv_with_airflow.sh) faz exatamente isso. 

Depois é só configurar a IDE para pegar o interpreter dessa venv.

[Intellij - Configure a system interpreter](https://www.jetbrains.com/help/idea/configuring-local-python-interpreters.html)