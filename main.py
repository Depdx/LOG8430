import pytest
import os
from src import dfs

def main():
    pytest.main(["src", "-s"])
    os.makedirs("results", exist_ok=True)
    if dfs["load_df"] is not None:
        dfs["load_df"].to_csv("results/load_df.csv")
    if dfs["run_df"] is not None:
        dfs["run_df"].to_csv("results/run_df.csv")

if __name__ == "__main__":
    main()
