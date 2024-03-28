"""
This module is responsible for reading the output file and converting it into a pandas DataFrame.
"""

import pandas as pd

class OutputReader:
    """
    This class is responsible for reading the output file and converting it into a pandas DataFrame.
    """

    def read_output(self, file_path: str) -> pd.DataFrame:
        """
        Reads the output file and converts it into a pandas DataFrame.

        :param file_path: The path to the output file.
        """
        df = pd.read_csv(file_path, sep=",")
        df.columns = [""]
        df = df.transpose()
        df.columns = [' '.join(col).strip() for col in df.columns.values]
        return df
