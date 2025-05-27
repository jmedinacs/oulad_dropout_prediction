"""
OULAD Dropout Risk - Exploratory Data Analysis (EDA) Script
==========================================================
This script performs initial EDA on the cleaned OULAD dataset to prepare for modeling.
It includes:
- Continuous feature distribution analysis with histograms and IQR-based capping.
- Categorical feature distribution analysis with annotated bar charts.
- Mapping the 'final_result' column into a binary target ('withdrawn' vs. 'completed').
- Saving visualizations and processed data for further use.

Author: John Paul Medina (jarpy)
Date: May 26, 2025
"""

import src.utils.data_io as io
from src.preprocessing.clean_the_data import inspect_data
import matplotlib.pyplot as plt 
import seaborn as sns 
import pandas as pd
import numpy as np
import os

pd.set_option('display.max_columns', None)
pd.set_option('display.width', 1000)



def evaluate_continuous_columns(df, output_dir=None, show_plot=False):
    """
    Analyze continuous features by inspecting basic stats and plotting histograms.

    Parameters:
    ----------
    df : pd.DataFrame
        Input dataset containing continuous features.
    output_dir : str, optional
        Directory path to save generated histogram plots. Defaults to '../../outputs/figures'.
    show_plot : bool, default False
        If True, display plots interactively; otherwise, save and close.
    """
    
    continuous = df[['studied_credits', 'num_of_prev_attempts','total_clicks', 'num_unique_resources', 
                    'num_active_days', 'module_presentation_length']]
    
    inspect_data(continuous)
    
    for c in continuous:
        plot_histogram(continuous, c, output_dir, show_plot)
    
def plot_histogram(df, column, output_dir=None, show_plot=False):
    """
    Generate and save a histogram with KDE for a single continuous variable.

    Parameters:
    ----------
    df : pd.DataFrame
        Dataset containing the column.
    column : str
        Name of the column to plot.
    output_dir : str, optional
        Directory path to save the plot. Defaults to '../../outputs/figures'.
    show_plot : bool, default False
        If True, display the plot interactively; otherwise, save and close.
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
        
def evaluate_categorical_columns(df, output_dir=None, show_plot=False):
    """
    Analyze categorical features by generating and saving bar charts with percentages.

    Parameters:
    ----------
    df : pd.DataFrame
        Input dataset containing categorical features.
    output_dir : str, optional
        Directory path to save plots. Defaults to '../../outputs/figures'.
    show_plot : bool, default False
        If True, display plots interactively; otherwise, save and close.
    """
    cat_columns = ['gender','region','highest_education','imd_band',
                   'age_band','num_of_prev_attempts','disability',
                   'final_result','code_module','code_presentation',
                   'module_presentation_length']
    
    for col in cat_columns:
        plot_bar_chart(df, col, output_dir, show_plot)
        
def plot_bar_chart(df, column, output_dir=None, show_plot=False):
    """
    Generate and save a count plot with percentages for a categorical variable.

    Parameters:
    ----------
    df : pd.DataFrame
        Dataset containing the column.
    column : str
        Name of the column to plot.
    output_dir : str, optional
        Directory path to save the plot. Defaults to '../../outputs/figures'.
    show_plot : bool, default False
        If True, display the plot interactively; otherwise, save and close.
    """
    if output_dir is None:
        output_dir = "../../outputs/figures"
    os.makedirs(output_dir, exist_ok=True)
    
    plt.figure(figsize=(8,5))
    ax = sns.countplot(data=df, x=column,
                       order=df[column].value_counts().index, color='steelblue', legend=False)
    
    total = len(df)
    
    for p in ax.patches:
        count = p.get_height()
        percentage = 100 * count/total
        ax.annotate(f'{percentage:.1f}%',
                    (p.get_x() + p.get_width()/2., p.get_height()),
                    ha='center', va='bottom', fontsize=10)
    
    plt.title(f"Distribution of {column.title().replace('_', ' ')}")
    plt.xticks(rotation=30)
    plt.tight_layout()
    
    filepath = os.path.join(output_dir, f"{column}_distribution.png")
    plt.savefig(filepath, dpi=300)
    print(f"Saved: {filepath}")
    
    if show_plot:
        plt.show()
    else:
        plt.close()
    
def map_final_result(df):
    """
    Map the 'final_result' column into a binary target: 'withdrawn' or 'completed'.

    Parameters:
    ----------
    df : pd.DataFrame
        Input dataset containing the 'final_result' column.

    Returns:
    -------
    df : pd.DataFrame
        Dataset with new 'final_result_binary' column.
    """
    df = df.copy()
    df['final_result_binary'] = df['final_result'].apply(
            lambda x: 'withdrawn' if x.lower() == 'withdrawn' else 'completed'
        )
    return df

def cap_outliers_iqr(df, multiplier=1.5, verbose=True):
    """
    Cap outliers in continuous features using the IQR (Interquartile Range) method.

    Parameters:
    ----------
    df : pd.DataFrame
        Input dataset containing continuous features.
    multiplier : float, default 1.5
        The IQR multiplier to determine bounds (default = Tukey's 1.5 rule).
    verbose : bool, default True
        Whether to print capping thresholds for each column.

    Returns:
    -------
    df : pd.DataFrame
        Dataset with capped continuous features.
    """
    
    df = df.copy()
    
    # Define skewed columns here (or pass as argument if you prefer)
    skewed_cols = ['total_clicks', 'num_unique_resources', 'num_active_days', 'studied_credits']
    
    for column in skewed_cols:
        Q1 = df[column].quantile(0.25)
        Q3 = df[column].quantile(0.75)
        IQR = Q3 - Q1 
        lower_bound = Q1 - multiplier * IQR 
        upper_bound = Q3 + multiplier * IQR
        
        if verbose:
            print(f"\n{column} capping thresholds:")
            print(f"  Lower Bound: {lower_bound}")
            print(f"  Upper Bound: {upper_bound}")
    
        df[column] = np.where(df[column] > upper_bound, upper_bound,
                              np.where(df[column] < lower_bound, lower_bound, df[column]))
    
    return df
    

def conduct_after_merge_eda(show_plot=False):
    """
    Orchestrate the EDA process:
    - Load cleaned data.
    - Inspect basic structure.
    - Analyze and visualize continuous and categorical features.
    - Map target variable.
    - Cap outliers in skewed continuous features.
    - Save processed data.
    
    Parameters:
    ----------
    show_plot : bool, default False
        If True, display plots interactively; otherwise, save and close.
    """
    print("\nStep 1: Load the cleaned data")
    df = io.load_cleaned_data()
    
    print("\nStep 2: Initial data inspection")
    inspect_data(df)
    
    print("\nStep 3: Evaluate continuous column distribution")
    evaluate_continuous_columns(df, None, show_plot)
    
    print("\nStep 4: Evaluate categorical column distribution")
    evaluate_categorical_columns(df, None, show_plot)
    
    print("\nStep 5: Convert non-withdrawn final_result to 'completed'")
    df = map_final_result(df)
    
    print("\nStep 6: Adjust skewed continuous data by IQR capping x1.5")
    df = cap_outliers_iqr(df, 1.5, True)
    
    io.save_data(df)

if __name__ == '__main__':
    conduct_after_merge_eda()