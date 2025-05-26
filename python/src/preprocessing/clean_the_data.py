import pandas as pd 
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
    """ """
    df = df.drop(columns=["date_registration","date_unregistration"])
    return df
    
def clean_data():
    """ """
    print("\nStarting the cleaning process..")
    
    print("\n Step 1: Loading the merged data")
    df = io.load_merged_data()
    
    print("\nStep 2: Inspecting Data.")
    inspect_data(df)
    
    print("\nStep 3: Dropping unreliable data columns")
    df = drop_dates_columns(df)
    
    inspect_data(df)
    
    

if __name__ == '__main__':
    clean_data()