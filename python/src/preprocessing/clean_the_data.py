"""
clean_data.py

This script performs data cleaning on the merged OULAD dataset. It includes:
- Dropping unreliable date columns.
- Removing duplicate rows.
- Imputing missing 'imd_band' values as 'unknown'.
- Saving the cleaned dataset for further analysis.

Author: John Medina
Date: 2025-05-26
Project: OULAD Dropout Prediction

Usage:
Run this script as a standalone module to execute the full cleaning workflow:
$ python src/preprocessing/clean_the_data.py
"""

import src.utils.data_io as io 


def inspect_data(df):
    """
    Display dataset info, summary statistics, and missing values.

    Parameters:
    - df (DataFrame): Input dataset.

    Returns:
    - None
    """
    print(df.info())
    print(df.describe())
    print(df.isnull().sum())
    
def drop_dates_columns(df):
    """
    Drop unreliable date columns from the dataset.

    Parameters:
    ----------
    df : pd.DataFrame
        Input dataset.

    Returns:
    -------
    pd.DataFrame
        Dataset without 'date_registration' and 'date_unregistration' columns.
    """
    df = df.drop(columns=["date_registration","date_unregistration"])
    return df
    
def imd_band_null_change(df):
    """
    Replace missing values in 'imd_band' column with 'unknown'.

    Parameters:
    ----------
    df : pd.DataFrame
        Input dataset.

    Returns:
    -------
    pd.DataFrame
        Dataset with 'imd_band' imputed.
    """
    df['imd_band'] = df['imd_band'].fillna('unknown')
    return df

def remove_duplicates(df):
    """
    Identify and remove duplicate rows from the dataset.

    Parameters:
    ----------
    df : pd.DataFrame
        Input dataset.

    Returns:
    -------
    pd.DataFrame
        Dataset with duplicates removed.
    """
    before_rows = df.shape[0]
    df = df.drop_duplicates()
    after_rows = df.shape[0]
    print(f"Removed {before_rows - after_rows} duplicate rows.")
    return df
    
def clean_data():
    """
    Clean the merged OULAD dataset by:
    - Dropping unreliable date columns.
    - Removing duplicate rows.
    - Imputing missing 'imd_band' values as 'unknown'.
    - Saving the cleaned dataset.

    Returns:
    -------
    None
    """
    print("\nStarting the cleaning process..")
    
    print("\n Step 1: Loading the merged data")
    df = io.load_merged_data()
    
    print("\nStep 2: Inspecting Data.")
    inspect_data(df)
    
    print("\nStep 3: Dropping unreliable data columns")
    df = drop_dates_columns(df)
    print("\nInspect the data to verify drop")
    inspect_data(df)
    
    print("\nStep 4: Remove duplicates")
    df = remove_duplicates(df)
    
    print("\nStep 5: Impute NULL imd_band to 'unknown'")
    df = imd_band_null_change(df)
    
    print("\nStep 6: Final data inspection")
    inspect_data(df)
    
    print("\nStep 7: Save the cleaned dataset")
    io.save_data(df)

if __name__ == '__main__':
    clean_data()