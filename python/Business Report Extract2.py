# In this notebook we will:
# 1. Import required modules and dataset
# 2. Define multiple Classification models
# 3. Fit the data to our models
# 4. Use our trained models to predict a class label 
# 5. Evaluate our models and chose the best performing model 

#Import Pandas to your workspace
import numpy as np
import pandas as pd

#Read the "features.csv" file and store it into a variable
df = pd.read_csv("data/features.csv")

df.head()


# # Index
# The index of a DataFrame is used as the "address" for specific data points. As we saw in Python 2, by providing these indexes to .loc, we can access different ranges of data. Both the X and Y axes have an index. For rows, we can use the default integer index, or we can assign a column to act as the index. For columns, the column names are the index.

#Read the "features.csv" file and store it into a variable
features = pd.read_csv("data/features.csv", index_col = 'Date')

#Display the first few rows of the DataFrame
features.head()

# <img src="images/groupbyviz.jfif"/>
#Apply groupby to the Year and Month columns, calculating the mean of the CIP
year_CPI = features.groupby("Year")["CPI"].sum().reset_index()
year_CPI.head()

#Groupby returns a DataFrame, so we have access to all the same methods we saw earlier
year_CPI.sort_values(by = "Year", ascending = False, inplace = True)
year_CPI.head()

# Exercise : Define a new variable that measures the average Temp by Store
temp_store = features.groupby("Store")["Temp"].mean()
temp_store.head(50)

#Exercise: Try out the next few cells on your own to test your understanding of concepts from Python 1 and 2
#1. Read the "stores.csv" file and store it into a variable called stores
stores = pd.read_csv("data/stores.csv")


#2. Display the first few rows of the stores DataFrame
stores.head()

#3. Redefine the Type column to lower case
stores["Type"] = stores["Type"].str.lower()

#4. Display the first few rows to verify changes
stores.head()

#5. Rename the 'Size' column to 'Area'
stores.rename(columns={'Size': 'Area'}, inplace=True)

stores.head()


# <h1>merge()</h1>
# 
# <ul>
#     <li>Merge two DataFrames along common columns</li>
#     <li>Must be provided the DataFrame to merge with, as well as the names of the common columns</li>
#     <li>Will merge and map rows where the values in both DataFrames are equal</li>
# </ul>

# <img src="images/mergetypes.png"/>

# <img src="images/mergeinner.png"/>

features.head()
stores.head()

#Merge the stores DataFrame into the features DataFrame on the Stores column
df_merged = features.merge(stores, on = "Store")

#Display a few rows to verify changes
df_merged.head()


#Define a function to convert float values to our custom categorical ranges

def temp_categorical(temp):
    if temp < 50:
        return 'Mild'
    elif temp >= 50 and temp < 80:
        return 'Warm'
    else:
        return 'Hot'
    
#With the apply() function we can apply our custom function to each value of the Series

df_merged['Temp'] = df_merged['Temp'].apply(temp_categorical)
df_merged['Temp'].tail()
df_merged.head()
#lambda function 
df_merged['Type'] = df_merged['Type'].apply(lambda x: x.split()[0])

df_merged.head()

#Create a Pivot Table to display the fuel prices by store and temperature
fp_pivot = df_merged.pivot_table(values='Fuel_Price', index="Store", 
                          columns = 'Temp', aggfunc='mean')

fp_pivot.head()

df_merged.groupby(['Store', 'Temp'])['Fuel_Price'].mean()

# Exercise: Create a Pivot table that displays the mean CPI by store type and year
cpi_pivot = df_merged.pivot_table(values='CPI', index="Type", 
                          columns = 'Year', aggfunc='mean')
cpi_pivot.head()

#Export the final version of our DataFrame to a .csv file named "final_data.csv" 
df_merged.to_csv('final_data.csv', index=False)

#Remove warnings from our outputs
import warnings
warnings.filterwarnings("ignore")


# # Matplotlib
# "Matplotlib is a comprehensive library for creating static, animated, and interactive visualizations in Python."
# Matplotlib is one of the most popular libraries used to create data vizualizations in Python. It uses an object-oriented API (classes) which we've already worked with when using Pandas
# Two main concepts to understand
# - A figure is the whole figure and can contain any number of axes (usually at least 1)
# - Axes are the "plot" that will contain your title, legend, etc.

import matplotlib.pyplot as plt
import numpy as np

#Define a variable 'x' that is a list of integers

x = [1,2,3,4,5,6]
data = np.array(x)

# https://matplotlib.org/tutorials/introductory/usage.html#sphx-glr-tutorials-introductory-usage-py
# Create a figure and an axes.

fig, ax = plt.subplots()

# Plot some data on the axes.

ax.plot(data, data, label = 'linear')

# Plot more data on the axes...

ax.plot(data, data**2, label='quadratic')

# ... and some more.

ax.plot(data, data**3, label='cubic')

# Add an x-label to the axes.

ax.set_xlabel('x label')

# Add a y-label to the axes.

ax.set_ylabel('y label')

# Add a title to the axes.

ax.set_title('2021-01-11')

# Add a legend.

ax.legend()

#Save our plot as an image

plt.savefig('line_plot.png')


# # Pandas Plotting
# Pandas offers a easy way to access Matplotlib to plot the data inside of a DataFrame.
# We will go over a few ways to plot some stock data.

#Import Pandas 
import pandas as pd

#A few configurations
pd.plotting.register_matplotlib_converters()
get_ipython().run_line_magic('matplotlib', 'inline')

print("Setup Complete")

# Import stock data

stock_df = pd.read_csv('data/stocks.csv', index_col ='date', parse_dates = True)

#Take a look at the data

stock_df.head()

#Plotting data as easy as calling the plot() function

stock_df. plot(kind = 'line')

#Plotting data as easy as calling the plot() function

stock_df.plot(kind='line', figsize=(10,7), title = 'Stock Data 2017-2018')

#Define a MPL figure and axes to give us more control of our visual

fig, axs = plt.subplots(2,2, figsize = (20,10))
fig.suptitle ('Vertically stacked subplots', fontsize =20)

#Must specify the axes we want to plot onto, and can specify addicitonal styling parameters with 'colormap'

stock_df.plot(kind = 'line', subplots=True, colormap='jet', ax=axs)

#Use a FOR loop to add on the X and Y labels

for ax in axs.flat:
    ax.set(xlabel = 'Date', ylabel = 'Price')

from pandas.plotting import scatter_matrix

scatter_matrix(stock_df, alpha=0.2, figsize=(6,6), diagonal= 'kde')
plt.show()


#https://www.kaggle.com/shivamb/netflix-shows
#Import new dataset from the data/netflix_titles.csv file into variable net_df

net_df = pd.read_csv('data/netflix_titles.csv')
net_df.head()
net_df.shape

#Calculate the number of movies per country

freq = net_df ['country'].value_counts()
print(freq)

#Plot this data as a bar chart
plt.figure(figsize=(30,10))

freq.plot(kind='bar', title= 'Number of Title per Country')

#Create a pivot so we can visualize the data

net_pivot = net_df.pivot_table(values= 'show_id' , index= 'country' , columns = 'type' , aggfunc= 'count')

#Create new column for sorting

net_pivot['Sum'] = net_pivot['Movie'] + net_pivot ['TV Show']

#Sort by new column in decsending order

net_pivot = net_pivot.sort_values ('Sum', ascending = False)

#Drop unnecessary column

net_pivot.drop(columns='Sum', inplace=True)
net_pivot.head()

#Create a basic bar chart of the pivot table

net_pivot.plot(kind = 'bar', figsize=(30,10))

#We can stack the bar chart and change the orientation to horizontal

net_pivot.plot(kind = 'barh', figsize=(30,10), stacked=True)

#Pie charts and configurations

net_pivot.plot(kind = 'pie', figsize=(25,10), subplots=True, autopct = '%.2f')
plt.show()


# # Seaborn
# Seaborn is a Python data visualization library based on matplotlib. 
# It provides a high-level interface for drawing attractive and informative statistical graphics.

import seaborn as sns

#Load tip data and 
tips = sns.load_dataset("tips")
tips.head()

#Assign a style

sns.set(style="darkgrid")

# Set the width and height of the figure

plt.figure(figsize=(16,6))
sns.relplot(x= 'total_bill', y='tip' , data=tips)

# We can add a third dimension with color and style
sns.relplot(x= 'total_bill', y='tip', hue= 'smoker', data=tips)

#Add a fourth dimension using different variables for hue and style
sns.relplot(x= 'total_bill', y='tip', hue= 'smoker', style= 'time', data=tips)

#Replot using size variable for hue

sns.relplot(x= 'total_bill', y='tip', hue= 'size', data=tips)

#The size parameter allows us to change the size of data points using variables
sns.relplot(x="total_bill", y="tip", size="size", data=tips)

#The sizes parameter determines the scale of the data points
sns.relplot(x="total_bill", y="tip", size="size", sizes=(15, 200), data=tips)

#The col parameter creates subplots along the provided variable
sns.relplot(x="total_bill", y="tip", hue="smoker", col="sex", data=tips)

#Try plotting the Day of the week to see if it has an effect on the tip amount
sns.relplot(x="total_bill", y="tip", hue="day", col="time", data=tips)

#Create a pivot table of the tips data

hm = tips.pivot_table(index='day',columns='size',values='tip')
hm.head()

#An effective way to plot our pivoted data is with a heatmap

sns.heatmap(hm)
plt.savefig('heatmap.png')



