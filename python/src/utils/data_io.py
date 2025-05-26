"""
data_io.py

This module provides functions for loading and saving datasets for the OULAD project.
It handles file validation, directory creation, and ensures robust file I/O.

Author: John Medina
Date: 2025-05-25
Project: oulad_dropout_prediction
"""

import os
import pandas as pd
import logging

# Set up basic logging (optional enhancement)
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def load_merged_data(filepath="../../data/processed/merged_data.csv"):
    """
    Load a dataset from a CSV file.

    Parameters:
    ----------
    filepath : str
        Path to the CSV file.

    Returns:
    -------
    pd.DataFrame
        Loaded DataFrame.
    """
    if not os.path.exists(filepath):
        logging.error(f"File not found: {filepath}")
        raise FileNotFoundError(f"File not found: {filepath}")

    logging.info(f"Loading data from: {filepath}")
    return pd.read_csv(filepath)


def load_cleaned_data(filepath="../../data/processed/cleaned_data.csv"):
    """
    Load the cleaned dataset from a CSV file.

    Parameters:
    ----------
    filepath : str
        Path to the CSV file.

    Returns:
    -------
    pd.DataFrame
        Loaded DataFrame.
    """
    if not os.path.exists(filepath):
        logging.error(f"File not found: {filepath}")
        raise FileNotFoundError(f"File not found: {filepath}")

    logging.info(f"Loading data from: {filepath}")
    return pd.read_csv(filepath)



def save_data(df, filepath="../../data/processed/cleaned_data.csv"):
    """
    Save a DataFrame to a CSV file. Creates directories if they don't exist.

    Parameters:
    ----------
    df : pd.DataFrame
        The DataFrame to save.
    filepath : str
        Path to save the CSV file.
    """
    directory = os.path.dirname(filepath)
    if directory and not os.path.exists(directory):
        os.makedirs(directory, exist_ok=True)
        logging.info(f"Created directory: {directory}")

    df.to_csv(filepath, index=False)
    logging.info(f"Data saved to: {filepath}")


if __name__ == '__main__':
    # Example usage (adjust file path as needed)
    data = load_merged_data("../../data/processed/merged_data.csv")
    print(data.head())
