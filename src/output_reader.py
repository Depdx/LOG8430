"""
This module is responsible for reading the output file and converting it into a pandas DataFrame.
"""
import os
import pandas as pd

class OutputReader:
    """
    This class is responsible for reading the output file and converting it into a pandas DataFrame.
    """

    def read_output(
            self,
            file_path: str,
            database: str,
            num_nodes: int,
            i:int,
            read_proportion: float,
            write_proportion: float
        ) -> pd.DataFrame:
        """
        Reads the output file and converts it into a pandas DataFrame.

        :param file_path: The path to the output file.
        :param database: The database being used.
        :param num_nodes: The number of nodes in the cluster.
        :param i: The index of the output file.
        :param read_proportion: The proportion of read operations in the workload.
        :param write_proportion: The proportion of write operations in the workload.
        """
        if database == "mongodb":
            os.system(f"sed -i '1,/[OVERALL]/d' {file_path}")
        df = pd.read_csv(file_path, sep=",", header=None)
        df["headers"] = df.iloc[:,0] + df.iloc[:,1]
        df = df.drop(columns=[0, 1])
        df["values"] = df.iloc[:, 0]
        df = df.drop(columns=[2])
        df = df.transpose()
        df.columns = df.iloc[0]
        df = df.iloc[1,:]
        df["database"] = database
        df["num_nodes"] = num_nodes
        df["i"] = i
        df["read_proportion"] = read_proportion
        df["write_proportion"] = write_proportion
        df["id"] = f"{i}-{read_proportion}-{write_proportion}-{num_nodes}-{database}"
        df = df.reset_index().transpose()
        df.columns = df.iloc[0, :]
        df = df.iloc[1:, :].reset_index(drop=True)
        return df
