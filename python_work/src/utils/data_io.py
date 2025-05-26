"""
data_io.py

This module provides functions for loading the merged dataset and saving 
the dataset.

Author: John Medina
Date: 2025-25-5
Project: oulad_dropout_rate_prediction
"""

import pandas as pd 
import os 

def load_merged_data(filepath="../../data/processed/merged_data.csv"):
    """
    Load the cleaned stroke dataset from a CSV file.

    Parameters:
    - filepath (str): Full or relative path to the CSV file.

    Returns:
    - DataFrame: Loaded dataset.
    """
    
    if not os.path.exists(filepath):
        raise FileNotFoundError(f"File not found at: {filepath}")
    df = pd.read_csv(filepath)
    
    df.info()
    return df 

if __name__ == '__main__':
    load_merged_data()