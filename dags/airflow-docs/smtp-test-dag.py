"""
This DAG is a test of SMTP configuration.
For this to work it is required to set the proper SMTP
service configurations in docker-compose.yaml environments
"""

# The DAG object; we'll need this to instantiate a DAG
import pendulum
from airflow.decorators import dag
from airflow.operators.email import EmailOperator


@dag(
    "smtp-test",
    schedule_interval="@daily",
    start_date=pendulum.datetime(2021, 1, 1, tz="UTC"),
    catchup=False,
    tags=['docs', 'test'],
    doc_md=__doc__
)
def smtp():
    email = EmailOperator(
        task_id='send_email',
        to='',
        subject='Airflow Alert',
        html_content=""" <h3>Email Test</h3> """,
    )


dag = smtp()
