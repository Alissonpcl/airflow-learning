# K8s

# Installing Airflow in a local K8s Cluster

[https://airflow.apache.org/docs/helm-chart/stable/index.html](https://airflow.apache.org/docs/helm-chart/stable/index.html)

Many of the steps below were done using [Lens](https://k8slens.dev/).

## Configure DAGs location

### Create a PV and PVC to Dags folders (for local folder)

```bash
kubectl apply -f .\dags-pv.yaml
kubectl apply -f .\dags-pvc.yaml
```

Then configure PVC name in _dags > persistence > existingClaim_ section of [values.yaml](values.yaml)

### Configure Git (for Git-Sync)

> WARNING!
>
> If a PV and PVC are configured as described above, Git-Sync process will synchronize the repository in the path mapped
> by PV.

#### Public Repo

1. Configure DAGs repository in _gitSync_ section of [values.yaml](values.yaml)

#### Private Repo

@TODO

## Installing the official Helm Chart

```bash
helm repo add apache-airflow https://airflow.apache.org
helm upgrade --install airflow apache-airflow/airflow --namespace airflow --create-namespace -f values.yaml
```

Output:

```bash
Release "airflow" does not exist. Installing it now.
NAME: airflow
LAST DEPLOYED: Wed Aug 10 15:20:01 2022
NAMESPACE: airflow
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Thank you for installing Apache Airflow 2.3.0!

Your release is named airflow.
You can now access your dashboard(s) by executing the following command(s) and visiting the corresponding port at localhost in your browser:

Airflow Webserver:     kubectl port-forward svc/airflow-webserver 8080:8080 --namespace airflow
Default Webserver (Airflow UI) Login credentials:
    username: admin
    password: admin
Default Postgres connection credentials:
    username: postgres
    password: postgres
    port: 5432

You can get Fernet Key value by running the following:

    echo Fernet Key: $(kubectl get secret --namespace airflow airflow-fernet-key -o jsonpath="{.data.fernet-key}" | base64 --decode)

###########################################################
#  WARNING: You should set a static webserver secret key  #
###########################################################

You are using a dynamically generated webserver secret key, which can lead to
unnecessary restarts of your Airflow components.

Information on how to set a static webserver secret key can be found here:
https://airflow.apache.org/docs/helm-chart/stable/production-guide.html#webserver-secret-key
```

### Next steps after the installation completes

1. Create a port forwarding to access the webserver in `http://localhost:8080`


2. Como definir o caminho da pasta para as DAGs
3. Config do banco do Airflow
4. Permissoes para acessar o RDS