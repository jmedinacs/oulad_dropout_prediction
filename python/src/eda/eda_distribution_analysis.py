'''
Created on May 26, 2025

@author: jarpy
'''

import src.utils.data_io as io
from src.preprocessing.clean_the_data import inspect_data
import matplotlib.pyplot as plt 
import seaborn as sns 
import pandas as pd
import os

pd.set_option('display.max_columns', None)
pd.set_option('display.width', 1000)



def evaluate_continuous_columns(df, output_dir=None, show_plot = False):
    """
    Evaluate continuous columns by inspecting and plotting distributions.

    Parameters:
    ----------
    df : pd.DataFrame
        Input dataset.
    output_dir : str, optional
        Directory to save plots.
    show_plot : bool, default False
        Whether to display plots interactively.
    """
    
    continuous = df[['studied_credits', 'num_of_prev_attempts','total_clicks', 'num_unique_resources', 
                    'num_active_days', 'module_presentation_length']]
    
    inspect_data(continuous)
    
    for c in continuous:
        plot_histogram(continuous, c, output_dir, show_plot)
    
def plot_histogram(df, column, output_dir, show_plot=False):
    """
    Plot histogram of a continuous variable.

    Parameters:
    ----------
    df : pd.DataFrame
        Input dataset.
    column : str
        Column name to plot.
    output_dir : str, optional
        Directory to save plots.
    show_plot : bool, default False
        Whether to display plots interactively.
    """
    if output_dir is None:
        output_dir="../../outputs/figures"
        
    os.makedirs(output_dir, exist_ok=True)
    
    plt.figure(figsize=(8,5))
    sns.histplot(data=df, x=column, kde=True, bins=30, color="steelblue", edgecolor='white')
    plt.title(f"Distribution of {column.title()}")
    plt.xlabel("Frequency")
    plt.tight_layout()
    
    filepath = os.path.join(output_dir, f"{column}_distribution.png")
    plt.savefig(filepath, dpi=300)
    print(f"Saved: {filepath}")
    if show_plot:
        plt.show()
    else:
        plt.close()
    

def conduct_after_merge_eda():
    """
    """
    print("\nStep 1: Load the cleaned data")
    df = io.load_cleaned_data()
    print("\nStep 2: Initial data inspection")
    evaluate_continuous_columns(df)
    #inspect_data(df)
    print("\nStep 3: Evaluate continuous column distribution")
    evaluate_continuous_columns(df, None, True)


if __name__ == '__main__':
    conduct_after_merge_eda()