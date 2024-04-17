"""
This module is responsible for creating and deleting the workload file.
"""

import os


class Workload:
    """
    This class is responsible for creating and deleting the workload file.

    :param read_proportion: The proportion of read operations.
    :param write_proportion: The proportion of write operations.
    """

    def __init__(
        self,
        read_proportion: float,
        write_proportion: float,
        workload_file_path: str = "workloads/workload",
    ):
        assert (read_proportion + write_proportion - 1) < 1e-6
        self.file_content = (
            "recordcount=5000\n"
            "operationcount=10000\n"
            "workload=site.ycsb.workloads.CoreWorkload\n"
            "readallfields=true\n"
            f"readproportion={read_proportion}\n"
            f"updateproportion={write_proportion}\n"
            "scanproportion=0\n"
            "insertproportion=0\n"
            "requestdistribution=zipfian\n"
        )
        self.file_path = workload_file_path + f"_{read_proportion}_{write_proportion}"

    def create(self) -> str:
        """
        Creates the workload file.
        """
        os.makedirs(os.path.dirname(self.file_path), exist_ok=True)
        with open(self.file_path, "w") as f:
            f.write(self.file_content)
        return self.file_path

    def delete(self):
        """
        Deletes the workload file.
        """
        os.system(f"rm -rf {self.file_path}")
