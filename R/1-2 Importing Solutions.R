"
    Importing datasets:
        - They are various functions that we can use to bring in
        data into our programs.
        - R provides functions to visualize data:
            View(data) -> displays the data

    1. read Built-in function:
        - read.csv()
        - Used to import txt and csv files
        - Can use URL's: read_csv('https://www.dropbox.com/s/tvvtf9dwjufo7os/housing_train.csv?dl=1')
        - Can use file.choose() for local files
"
read.csv(file.choose())

# Exercise: uSing the url provided, import the dataset into variable name H
URL <- "https://www.dropbox.com/s/tvvtf9dwjufo7os/housing_train.csv?dl=1"
H1 <- read.csv(URL)

"
    2. readr library:
        - This library provides us with more handy functions
        - First we import the library: library('readr')
        - read_csv(path) -> reads data based on the given path
        - path can be a url or a local path
"

# Exercise 1: Import the readr library
library('readr')

# Exercise 2: Import the dataset with the previous URL into H2
H2 <- read_csv(URL)

# Exercise 3: Does file.choose work for read_csv()? Try it!
read_csv(file.choose())

"
    3. readxl:
        - reads data from excel files
"
library('readxl')
read_excel('sample.xlsx')


"
    Importing and indexing
    Source: https://www.kaggle.com/bhuntgeb/analysis-of-the-toothgrowth-dataset
"
# Using dataset within the datasets package
datasets::ToothGrowth

" 
    Using the ? function we can read about the desciption of the given 
    dataset.
"
?ToothGrowth

"
    Indexing:
        - ToothGrowth[1:10,] -> rows 1 to 10
        - ToothGrowth[1:10, 2] -> rows 1 to 10 with the second column
        - ToothGrowth[1, 1] -> First row, First column
"

# Exercise 1: Get the rows 10-15, all columns
ToothGrowth[10:15,]

# Exercise 1: Get the row 5, all columns
ToothGrowth[5,]

"
    Column names:
        - We can get the name of columns with using the names function
            > names(ToothGrowth)
            [1] 'len'  'supp' 'dose' , We have three columns with the 
                                       given names.
                                       
        - We can access these columns with the $ operator
            -- ToothGrowth$len -> give us the len column
            -- ToothGrowth$supp -> give us the supp column
            -- ToothGrowth$dose -> give us the dose column
"
