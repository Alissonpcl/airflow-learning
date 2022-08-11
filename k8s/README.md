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

Configure DAGs repository in _gitSync_ section of [values.yaml](values.yaml)

#### Private Repo

@TODO

## Installing the official Helm Chart

```bash
helm repo add apache-airflow https://airflow.apache.org
helm upgrade --install airflow apache-airflow/airflow --namespace airflow --create-namespace -f values.yaml
```

### Next steps after the installation completes

1. Create a port forwarding to access the webserver in `http://localhost:8080`
   2. It can be easily done with Lens
   3. Or with the command below (it will lock the terminal) 
 
```bash
kubectl port-forward --namespace airflow svc/airflow-webserver 8080:8080
```

## Using an external PostgreSQL Database

Follow the steps below to use an external PostgreSQL database instead of the one that is already deployed by the chart.

### Install the PostgreSQL Chart

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install postgres-dev bitnami/postgresql
```

To access the database outside the Cluster and monitor its usage by Airflow do the steps below:

- Create a port-forward using Lens;
- Connect using your preferred client.
  - The username is 'postgres'.
  - The password can be retrieved from a Secret used Lens (it is Base64 encoded).

### Adjust values.yaml

1. postgresql > enabled = false
2. data > metadataConnection
   1. Set the database connection string, username and password
   2. If the database is running inside the cluster the host can be an SVC name (eg.: postgres-dev-postgresql.default.svc.cluster.local)
