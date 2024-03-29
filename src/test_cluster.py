import os
import pytest
import pandas as pd
from typing import Tuple, Generator
from src import Workload, OutputReader, dfs

@pytest.fixture(scope="class", autouse=True)
def cluster_setup(request) -> Generator[dict, None, None]:
    num_nodes, database = request.param
    pwd = os.getcwd()
    os.chdir(f'{pwd}/{database}/{num_nodes}-nodes/')
    os.system('./remove_cluster.sh')
    os.system('./start_cluster.sh')
    os.chdir(pwd)

    yield {"num_nodes": int(num_nodes), "database": database}

    os.chdir(f'{pwd}/{database}/{num_nodes}-nodes/')
    os.system('./remove_cluster.sh')
    os.chdir(pwd)


@pytest.mark.parametrize(
    "cluster_setup",
    [
        ("1", "mongodb"),
        ("3", "mongodb"),
        ("5", "mongodb"),
        ("7", "mongodb"),
        ("1", "redis"),
        ("3", "redis"),
        ("5", "redis"),
        ("7", "redis"),
    ],
    indirect=True,
)
class TestCluster:

    def test_ycsb_benchmark_50_50(self, cluster_setup: dict) -> None:
        self.run_test_with_workload(read_proportion=0.5, write_proportion=0.5, **cluster_setup)

    def test_ycsb_benchmark_100_read(self, cluster_setup: dict) -> None:
        self.run_test_with_workload(read_proportion=1.0, write_proportion=0.0, **cluster_setup)

    def test_ycsb_benchmark_10_read_90_write(self, cluster_setup: dict) -> None:
        self.run_test_with_workload(read_proportion=0.1, write_proportion=0.9, **cluster_setup)

    def run_test_with_workload(
            self,
            read_proportion: float,
            write_proportion: float,
            num_nodes: int,
            database: str
        ) -> None:
        global dfs
        workload = Workload(read_proportion=read_proportion, write_proportion=write_proportion)
        workload.create()
        reader = OutputReader()

        for i in range(10):
            load_command, run_command, output_file_path_load, output_file_path_run = self._build_ycsb_commands(
                output_file_name=f"output_{read_proportion}_{write_proportion}_{i}",
                workload=workload,
                database=database,
                num_nodes=num_nodes
            )
            if i == 0:
                status = os.system(load_command)
                if status != 0:
                    raise Exception("YCSB failed to run")
                load_df_i = reader.read_output(
                    file_path=output_file_path_load,
                    database=database,
                    num_nodes=num_nodes,
                    i=i,
                    read_proportion=read_proportion,
                    write_proportion=write_proportion,
                )
                dfs["load_df"] = self._concat_dfs(load_df_i)
            os.system("sleep 2")
            status = os.system(run_command)
            if status != 0:
                raise Exception("YCSB failed to run")
            run_df_i = reader.read_output(
                file_path=output_file_path_run,
                database=database,
                num_nodes=num_nodes,
                i=i,
                read_proportion=read_proportion,
                write_proportion=write_proportion,
            )
            dfs["run_df"] = self._concat_dfs(run_df_i)
        workload.delete()

    def _concat_dfs(self, df:pd.DataFrame) -> pd.DataFrame:
        global dfs

        if dfs["run_df"] is None:
            return df
        df = pd.merge(dfs["run_df"], df, how="outer")
        return df

    def _build_ycsb_commands(
            self,
            *,
            output_file_name: str,
            output_dir: str = "outputs",
            workload: Workload,
            database: str,
            num_nodes: int,

        ) -> Tuple[str, str]:
        database_args = ""
        if database == "mongodb":
            database_args = "mongodb"
        elif database == "redis":
            if num_nodes == 1:
                database_args = "redis -p 'redis.host=127.0.0.1' -p 'redis.port=7000'"
            else:
                database_args = "redis -p 'redis.host=127.0.0.1' -p 'redis.port=7000' -p 'redis.cluster=true'"

        os.makedirs(f"{output_dir}/load/{database}/{num_nodes}", exist_ok=True)
        os.makedirs(f"{output_dir}/run/{database}/{num_nodes}", exist_ok=True)
        output_file_path_load = f"{output_dir}/load/{database}/{num_nodes}/{output_file_name}.txt"
        output_file_path_run = f"{output_dir}/run/{database}/{num_nodes}/{output_file_name}.txt"

        ycsb_dir = [d for d in os.listdir(os.getcwd()) if d.startswith('ycsb')][0]
        binary_path = f"{os.getcwd()}/{ycsb_dir}/bin/ycsb"
        load_command = f"{binary_path} load {database_args} -s -P {workload.file_path} > '{output_file_path_load}'"
        run_command = f"{binary_path} run {database_args} -s -P {workload.file_path} > '{output_file_path_run}'"
        return load_command, run_command, output_file_path_load, output_file_path_run
