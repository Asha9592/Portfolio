# The type() function will return the data type of the data passed to it

type("Hello!")
type(True)
type(3.14)
print(type(3))

print("This "+ str(3) +" is a string") # "3"
print(float(3))
print(bool(3))

# In the code below, the variable `hours_worked` has been assigned an integer value of 10.
hours_worked = 10

print(hours_worked)

# Create variable `current_time` by assigning it a value of the current time. Replace the : with a .
current_time = 9.15

# Create two variables, price1 and price2 that have float values representing the respective price of two items
price1 = 5.92
price2 = 12.99

# Create a new variable whose value is the sum of the duration of both songs 
tot_price = price1 + price2
print(tot_price)

# Define string variables name, job, and tool
name = "Peter"
job = "works with"
tool = "Python"

# We can concatenate (combine) strings together using the addition (+) symbol 
employment = name + " " + job + " " + tool

#A few of the methods string come with! Check output to see how each works (definitions in handout)
print(employment.title())
print(employment.lower())
print(employment.upper())

print(employment)
print(employment.index("works"))
print(employment.split(" "))
print(employment.replace("IT", "Finance"))

# A few ways to combine strings and variables
# With F strings, variables go directly into a string! Even methods!
print(f"{name} works with {tool.upper()}")


# A boolean can only have one of two values. Either they are "True" or "False". 
# Variables "yes" and "no" have been assigned boolean variables of "True" and "False", respectively.

yes = True
no = False

# Boolean variables are generally used for conditional statements such as an if statement.
# The below lines of code uses boolean variables to determine whether or not the following functions will run.
if yes:
    print("True Statement!")

if no:
    print("Will not print")
  
 
# The below code is asking if 1 is smaller than 5, and if so, print "Employee added!"
num_employees = 1

if num_employees < 5:
    print("Employee added!")
  

#New variable to keep track of total number of employees
dept_size = 10


# if else statments can also be used with math or anything really (like strings)!
# if dept_size is less than 14, display the number of employees in the department. Else, display a message saying
#    the department size was exceeded

if dept_size < 14:
    print(f"New hire. {dept_size} employees in department.")
    dept_size += 1
else:
    print("Size exceeded, new offices needed!")
    

# While loops will keep running a loop of code until the intial condition is no longer true
# It is important to always have a breaking condition to stop the loop so it does not run infinitely
limit = 10

while dept_size < limit:
    print(dept_size)
    dept_size += 1
    
    
#Give dept_size a value of 0.
dept_size = 0

#WHILE Loop with condition of True will infinitely continue
while True:
    
    #IF dept_size reaches value of 8, break from WHILE loop
    if dept_size == 8:
        break # The 'break' statement in Python is used to close/end a loop

    #Print the dept_size and increment its value
    print(dept_size)
    dept_size += 1
    
# Lists are a collection of data. List numberings always start from 0.

banks = ["RBC", "CIBC", "TD", "BMO"]
print(banks[0]) # Here the first item in the list is at index 0
print(banks[3]) # The third item in the list is at index 4

#Can use a colon to indicate range of indices
print(banks[0:3]) # From the first to third item
print(banks[:1])
print(banks[2:]) 

#Negative indexing goes from Right to Left, starting from -1
print(banks[-1])

#Reassign values with square brackets as well
banks[0] = "Scotiabank"
print(banks)


# add value to end of a list - Canadian Western Bank
banks.append("CWB") # The .append() function can be used to add an item to the end of a list
print(banks)

# add value to the start of a list  - First Nations Bank of Canada
banks.insert(0, "FNBC")
print(banks)

# Return the length of the list
len(banks)

del banks[4]

print(banks)

#Remove and return last value of list
last_bank = banks.pop() # The .pop() function is used to remove and return the last item in a list
print(f"{last_bank} has been removed")
print(banks)

# lists can contain any type of data. A single list can be a mixture of different data types

mix_list = ['Peter', 314425, True, "IT"]
print(mix_list)
print(mix_list[3])
print(f"{mix_list[0]} - Employee Number:{mix_list[1]} - Dept: {mix_list[3]}")

# collection of "data" which is unordered, changeable, and not indexed. They have keys and values.
employee = { "name": "Peter", "employee_num": 314425, "department": "IT"} 
# Here, 'name', 'employee_num', and 'department' are keys, and 'Peter', '314425', and 'IT' are the corresponding values
print(employee)

# Access key values using ['key_name']
employee["name"]

# Reassign a key value
employee["department"] = "Finance"
print(employee["department"])

# Add a new key 
employee["management"] = False
print(employee)

# Can remove a key eaasily using del
del employee["management"]
print(employee)

# Other keys are unaffected when you use 'del' to remove a key
print(employee['name'])

#Dictionary methods return iterables
print(employee.items())
print(employee.keys())
print(employee.values())

# Cannot do print(employee.keys[0]) because it is not a list
# Iterables are data objects that can be 'interated' over, like in loops 
# Iterables to be used with keyword IN ('IN' example is covered in the next cell blocks and section with 'For' Loops)


# You can use dictionaries and lists in 'if' statments. 

#Will look through keys by default
if "name" in employee:
    print("Yes, name is one of the keys in this dictionary")
else:
    print("no")
    
 
# Use values() to check in values of dictionary
if "Peter" in employee.values():
    print("Yes, Peter is one of the values in this dictionary")
else:
    print("no")
    

# IN can be used with lists very easily too!
if "IT" in mix_list:
    print("You should try Python!")

#Loop through banks list
for bank in banks:
    print(bank)

#Loop through pairs in employee dictionary
for key, value in employee.items():
    print(f"{key}: {value}")
      
# Use RANGE to specify a number of iterations 
for i in range(len(banks)): # The len() function returns the length of the previously defined 'banks' list 
    print(i)

# A function is a block of organized, reusable code that is used to perform a single, related action.
def greeting(): # The bracket is empty as no values are required to be passed in this function
    print("Hi!")
  
greeting()


# In this function 'name', 'employee_num', and 'department' are required values that must be passed to the function
def description(name, employee_num, department): 
    print(f"{name} - Employee Number: {employee_num} - Dept: {department}")
    
description("Mike", 12210, "Marketing") 


class Employee():    
    """A simple attempt to represent am employee."""
    def __init__(self, employee_num, department, name):        
        self.employee_num = employee_num        
        self.department = department        
        self.name = name
        
    def description(self): # Creating a function (a.k.a method) that can be used by instances of this class
        print(f"{self.name} (employee number: {self.employee_num}) - Dept: {self.department}") 
    
 
employee = Employee("Mike", 12210, "Marketing")
employee.description()


#Ask user for a name
my_name = input("Enter your age.\n")
print(f"Entered age is {my_name}")

#Will always be treated as a string
type(my_name)


class Employee():    
    """A simple attempt to represent am employee."""
    def __init__(self, name, employee_num, department ):        
        self.name = name
        self.employee_num = employee_num        
        self.department = department        
        
        
    def description(self): # Creating a function (a.k.a method) that can be used by instances of this class
        print(f"{self.name} (employee number: {self.employee_num}) - Dept: {self.department}") 
    
    
employee1 = Employee("Mike", 12210, "Marketing")
employee2 = Employee("Peter", 31445, "IT")
employee1.description()
employee2.description()

#Create a Payment class and assign it 3 attributes: payer, payee, amount
class Payment:
    def __init__(self, payer, payee, amount):
        self.payer = payer
        self.payee = payee
        self.amount = amount

pay1 = Payment("Peter", "Seamus", 100)

print(pay1.amount)

print(pay1.payee)

# ## Pandas 
# Pandas is a fast, powerful, flexible and easy to use open source data analysis and manipulation tool,
# built on top of the Python programming language. 
# It will seamlessly bridge the gap between Python and Excel.

# Built Around 2 Main Classes:
#  - DataFrames
#  - Series

#Import pandas and assign it to a shorthand name pd 
import pandas as pd

#Read our data into a DataFrame names features_df
#read_excel does the same but for spreadsheet files
features_df = pd.read_csv('features.csv')

#Display top 5 rows
features_df.head()

#nan values are essentially empty entries

#Display bottom 5 rows
features_df.tail()

#Print dimensions of DataFrame as tuple
features_df.shape

#Print list of column values
features_df.columns

#To only rename specific columns
features_df.rename(columns={'Temperature': 'Temp', 'MarkDown1':'MD1'}, inplace=True)

#Print Pandas-specific data types of all columns
features_df.dtypes

#Extract CPI column of features_df
features_df["CPI"].head()

#Display the dimensions with 'shape'
#Display the total number of entries with 'size'
# Example with our DataFrame
print(features_df.shape)
print(features_df.size)

#Maximum value in Series
features_df["CPI"].max()

#Median value in Series
features_df["CPI"].median()

#Minimum value in Series
features_df["CPI"].min()

#Basic Statistical Summary of a column
features_df['Temp'].describe()

#Print list of unique values
features_df["Store"].unique()

#Print unique values and frequency
features_df["Date"].value_counts()

#Return a sorted DataFrame acording to specified column
features_df.sort_values(by = "Date", ascending = True)
features_df.head()

features_df.head()

# delete one column
features_df.drop(columns = "MD1").tail()

# Check for missing values and how many
features_df.isnull().sum()

# delete multiple columns
features_df.drop(columns = 'MD1', inplace = True)

features_df.head()

#Applying basic operations to columns 
#Uses matrix manipulation instead of row by row increments
features_df['Unemployment'] += 1
features_df.head()

#Say a colleague of yours asks for a new metric called "customerCost"
#Add a column that is equal to Fuel_Price * CPI 

features_df['customerCost'] = features_df['Fuel_Price'] * features_df['CPI']


#Return Fuel_Price to IsHoliday columns of 0-10th rows
#Note how LOC can reference columns by their names
features_df.loc[0:10,"Fuel_Price":"IsHoliday"]
features_df.loc[[100,105]]

#Retrieve the CPI and customerCost of rows 500 to 505
features_df.loc[500:505, ["CPI", "customerCost"]]

#We can also retrieve rows with a condition
features_df.loc[features_df['Store'] == 2]

#We can layer conditions with &
filt1 = features_df['Store'] == 2
filt2 = features_df['CPI'] > 211
features_df.loc[filt1 & filt2]

#Retrieve all rows with a isHoliday of True and customerCost larger than 550
filt1 = features_df['IsHoliday'] == True
filt2 = features_df['customerCost'] > 550
features_df.loc[filt1 & filt2]

#Retrieve a couple rows from their ROW index values
features_df.iloc[[0, 1]]

#We may also provide specific row/column values to access specific values
features_df.iloc[0, 1]

#Multiple rows and specific columns
features_df.iloc[[0, 2], [1, 3]]

#Access rows 1 to 3 for Store column to Fuel_Price
features_df.iloc[1:3, 0:3]

# We can access all the same string methods from Python 1 using .str
features_df['Status'] = features_df['Status'].str.upper()

features_df.head()

#Format float 
features_df.round(2).head()

#Export the current version of our DataFrame to a .csv file
features_df.to_csv("features_final.csv", index=False, header=True)

#to_excel also an option to export to Excel Spreadsheet
features_df.to_excel("features_final.xlsx", index=False, header=True)





