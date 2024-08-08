"
  What is R?
    - Open source software, can freely be downloaded from: 
      https://www.r-project.org/
    - Software environment for statistical computing and graphics
    - Interpreted language (like Python): compiled at runtime, 
      Object Oriented: everything is an object
    - It is specifically designed for making Data Analysis easier
  
  Who uses R?
    - Academia: 
      -- R is largely used in universities for education and research
      -- Many books on statics makes use of R as the programming language
    
    - Data Preprocessing:
      -- Preprocessing data is an important part of any Data 
         Science project (80%) 
      -- Data Cleaning, Categorical Encoding, and Data Imputing => subsets 
      -- R has an extensive library of tools for this purpose
"

"
  R studio
  - IDE: Integrated Development Environment
  - Components:
    -- Code Editor
    -- File Browser: 
        --- Installing Packges
        --- Getting help
        --- Export/shows the visuals: graphs/charts 
    -- Console tab: 
        --- outputs the code editor's execution result
        --- Run code
    -- Environment: 
        --- Import external datasets
        --- Keeps track of variables/objects within the session
        --- Can clear the objects
        --- Can load a specific objects from a workspace 
        --- History: Shows tthe commands ran in the session
        --- It also offers a tutorial on R
  - Suggestions: auto-completion while typing
"

print('Hello R!')
# a = 10
# b = 1
# Session='Tutorial'
# session='None'


"
  Basics
  1.1 Comments:
    
    two types:
      #: used for one line comment
      double-quotes: Used for multiple lines
    
    (pay attention to the structure of this document)
    
    Comments are mainly used to document your code so whoever reads would
    understand what you were hoping to achieve.
  
  1.2 Installing and loading R packages
    packages: 
      - Set of functions/objects that help us code faster and easier.
      - These packages are written by experts and we are usign 
        their code to achieve our goals.
      - One could contribute to these packages
      
    built-in functions: Functions/Objects that are available in 
                        the R package and do not external instalation
      - sort
      - sqrt
      - sum
      - log(x=243, base=3)
      - mean
      - typeof
      - rnorm(5, mean=0, sd=1)
      - ?[object_name]:
        -- ?sort: shows Description/Usage/Arguments
    
    Installing using the editor: bottom-right/packages/
     
    Installing: Installation happens using the built-in functions in R.
    
      install.packages('package_name'):
        - install.packages('tidyverse')
        - install.packages('ggplot2')
    
    Loading:
      library('package_name'):
        - library('tidyverse')
        - library('ggplot2')
    
      Note: Library, package, and framework are used in Software Desgin and
      for most of the part, they mean the same thing. (in Some languages 
      libraries are more opinionated)
    
    Updating: Maintainers of packages tend to provide version updates 
              and bug fixes so it would be helpful to update you 
              installed packages every once in a while.
    
      - update.packages()
      - Could also use the File manager
"
library(tidyverse) # Loading the objects of tidyverse library in session
"   
    1.3 Arithmetics
      - (+ | - | / | ^)
      - Scientific notation: 
        -- 0.0000000000000001 = 1e-16
        -- Easier to follow
        -- Clear
"
10 / 5
10 + 5
10 - 5


"
  1.4 Variable declaration:
    - variable_name <- value (or variable_name = value) 
    - There are two ways to decalre variables and they have subtle differences,
    for the sake of simplicity and cohesion, we will use <- annotation
    - Two things to remember when naming variables:
      -- You can't begin an object name with a number
        --- 1my_name <- 'other words' 
      -- No spaces allowed
        --- my name <- 'some words'
"
# Exercise 1: Assign value 2 to a
a <- 2

# Exercise 2: Assign value "2" to b
b <- "2"

"
  Data types
  
  1. Numeric values:
    - Numbers such as 1,1.34, 9.2e-10
    - typeof will return double for any kind of numeric value
      (this is not the case for other programming languages)
    - Can do arithmetic operations on them
"
# Exercise 1: Identify if each of the following are numerical

# a. 1  b. 1e-12 c. "abcd", d.0 e. -100

"
  2. Logical Values:
    - The result of evaluating an expression
    - Used to build logic in the program
    - T/TRUE/1: The evaluated expression is True.
    - F/False/0: ''    ''         ''     '' False.
    - NOTE: True, False, t and f are not the logical operators
    
    eg.
      - a == 10 
      - b == 2
      - t == 1 -> cause an ERROR
      
    - Combinations:
      -- &: 
        --- AND operator
        --- All the expression seperated by && should be True
          to return True
        --- If one of the expressions ANDed is FALSE then it
          will return False
        --- eg. a == 10 && b == 2 => 1 & 0
        --- General analysis: 1 & 1 & 1, 1 & 1 & 0
      -- |: 
        --- OR oeprator
        --- At least one of the expressions should be True
        --- If all the expressions are False then it wiil return False
        --- a == 10 || b == 2
        --- eg. 1 || 0 || 0, 0 || 0 
"
# Exercise: Evaluate the following expressions (first try without running it in the console)
# a. 1 | 0

# b. 1 & 0

# c. (FALSE | TRUE) & FALSE

# d. (10 > 1e-5)

"
  3. Characters
    - Represents strings and single letters as well as other symbols
    - eg. alpha == alpha
    - Lower/Upper case:
      -- tolower(string): changes Upper letters to lower letters
      -- toupper(string): opposite of tolower, lower -> upper
      -- eg.
        --- tolower('ABCD') -> 'abcd'
        --- toupper('abcd') -> 'ABCD'
    - nchar(string): counts the number of characters in a string
    -  Concatenation:
      -- cat(R, is, Awesome!!): concatenates the strings in the given 
         order with a space in between.
      -- paste(R, is Awesome!!): Does the same thing with returning the string
      -- Difference? 
          # can do : concat = paste(R, is Awesome!!)
          # can't do: concat = cat(R, is Awesome!!)
          Since cat does not return a string, just shows it.
"
# Exercise 1: Change the "You are learning R" to all caps!
toupper("You are learning R")

# Exercise 2: What is the output of alpha == tolower("AlPha")
TRUE

# Exercise 3: Assign a variable msg to the string "I'm Learning"
msg <- "I'm Learning"

# Exercise 4: Print out "I'm learning R" using cat and msg variable
cat(msg, "R")

# Exercise 5: Update the message value using paste to "I'm Learning R"
msg <- paste(msg, "R")

# Exercise 6: Using <- or = create an object called **first_name**, which contains any name
first_name <- "SomeName"

# Exercise 7: Using <- or = create an object called **second_name**, which contains a different name
second_name <- "Lastname"

# Exercise 8: Use a function to find the number of characters in **first_name**. Save the result to a new object named **name_chrs**.
name_chrs <- nchar(first_name)

# Exercise 9: Use a **logical operator** to return TRUE if name_chrs is greater then or equal to 5, FALSE otherwise
name_chrs >= 5

# Exercise 10: Combine first_name and second_name. Hint, the paste function can be used here
paste("Hello", first_name, second_name)

"
  Getting a variable's data type:
    How can we find out about the data type of a variable?
      - typeof(variable)
      - class(variable)
      
      The difference? class tells you what kind of object the variable is, yet 
      typeof gives you the exact type of the variable. typeof and class are 
      mostly identical:
        - typeof(1) -> double, class(1) -> numeric, 1 is numerical object and it
        is a double
        
      NOTE: As a beginner, you can assume that there is no significant difference between class and typeof.
"

# Exercise1: Whats the class of something in quotes?
class("something")
class("anything in quotes")

# Exercise2: what is the typeof TRUE, FALSE, and 3 > 2?
class(FALSE)
class(TRUE)
class(3 > 2)

