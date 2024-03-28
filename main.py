import pytest
import os
from src import dfs

def main():
    pytest.main(["src", "-s"])
    os.makedirs("dataframes", exist_ok=True)
    if dfs["load_df"] is not None:
        dfs["load_df"].to_csv("dataframes/load_df.csv", index=False)
    if dfs["run_df"] is not None:
        dfs["run_df"].to_csv("dataframes/run_df.csv", index=False)

if __name__ == "__main__":
    main()
