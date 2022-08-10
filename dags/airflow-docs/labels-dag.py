"""
This DAG is and example of how to use Labels to make it easier
to understand the Tasks flow based on conditions
"""

from random import randint

# The DAG object; we'll need this to instantiate a DAG
import pendulum
from airflow.decorators import dag, task
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import BranchPythonOperator
from airflow.utils.edgemodifier import Label


@dag(
    "example_branch_labels",
    schedule_interval="@daily",
    start_date=pendulum.datetime(2021, 1, 1, tz="UTC"),
    catchup=False,
    tags=['docs'],
    doc_md=__doc__
)
def Branching():
    @task
    def generate_random():
        rnd = randint(1, 10)
        print(f"Random number generated is {rnd}")
        return rnd

    def branch_func(number):
        print(f"Random number generated received is {number}")
        if number > 5:
            return "big_task"
        else:
            return "small_task"

    random_number = generate_random()

    branch_op = BranchPythonOperator(
        task_id="branch_task",
        op_args=[random_number],
        python_callable=branch_func
    )

    big_task = EmptyOperator(task_id="big_task")
    small_task = EmptyOperator(task_id="small_task")

    branch_op >> Label("Greater than 5") >> big_task
    branch_op >> Label("Smaller than 5") >> small_task


dag = Branching()
