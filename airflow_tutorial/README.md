# Instalando Airflow Docker

Instruções em https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html.

Basicamente:

```shell
# Baixa o arquivo yaml com as instrucoes para subir o servico 
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.3.1/docker-compose.yaml'

# Cria as pastas que serao mapeadas para dentro dos containers
mkdir -p ./dags ./logs ./plugins

# Cria o arquivo que seta a varaivel de UID para o Airflow (Necessario apenas em Linux).
echo -e "AIRFLOW_UID=$(id -u)" > .env

# Primeira vez, para criar o banco e o usuario admin
docker-compose up airflow-init

# Demais vezes, para apenas iniciar o servico
docker-compose up
```

## Acessando a interface Web

Depois de realizar os passos de configuração em Docker par acessar a interface Web para utilizar os dados abaixo:

- http://localhost:8080 
- Username: airflow 
- Password: airflow


# Comandos úteis

Listar DAGs

```bash
airflow dags list
```