# The Tidy Tuesday community: https://github.com/rfordatascience/tidytuesday

# https://fivethirtyeight.com/features/scary-movies-are-the-best-investment-in-hollywood/
# https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-10-23

library(palmerpenguins)
library(ggplot2)
library(gcookbook) # Additional Datasets

spotify_songs <- read.csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv')
movie_profit <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-10-23/movie_profit.csv")
penguins <- palmerpenguins::penguins

"
  For further readings: http://www.cookbook-r.com/Graphs/
  
  Data Visualization 
    - We will be using ggplot2 for graphing, other options are possible in R
    - We will cover different type of charts:
      -- Histograms
      -- Bar Charts
      -- Box plots
      -- Scatter Plots
  
  Note: it could be helpgul to use View(data_frame) to choose which columns to
  use as x and y.
"

View(movie_profit)

"
  plot(x, y):
    - built-in R function, means we do not have to import any external packages
    - making a scatter plot -> plot(df$colA, df$colB)
    - By tweaking some of the parameters different charts can be made
    - ggplot is a much more beter alternative to this function
"
plot(housing_df$MSSubClass, housing_df$LotArea)

# Exercise 1: Scatter plot of domestic_gross (x) vs worldwide_gross (y)
plot(movie_profit$domestic_gross, movie_profit$worldwide_gross)

# Exercise 2: Scatter plot of MasVnrArea (x) vs LotArea (y)
plot(housing_df$MasVnrArea, housing_df$LotArea)


"
  Scatter Plot:
  
  ggplot(data_frame, aes(x,y)) + geom_point():
    - First argument is the dataframe we are graphing
    - Second argument identifies the x and y coordinates using the aes fucntion
    - Then different type of properties are adding by adding to the initial definiton
    
  The same scatter plot that we graphed using plot:
      ggplot(housing_df, aes(x=MSSubClass, y=LotArea)) + geom_point()
    this is the same as: plot(housing_df$MSSubClass, housing_df$LotArea)

"
# Redo the previous exercises using ggplot
ggplot(housing_df, aes(x=MSSubClass, y=LotArea)) + geom_point()

# Can you see a relation between energy and track_popularity?
ggplot(spotify_songs, aes(x=energy, y=track_popularity)) + geom_point()

# Exercise 1: Scatter plot of domestic_gross (x) vs worldwide_gross (y)
ggplot(housing_df, aes(x=domestic_gross, y=worldwide_gross)) + geom_point()

# Exercise 2: Scatter plot of MasVnrArea (x) vs LotArea (y)
ggplot(housing_df, aes(x=MasVnrArea, y=LotArea)) + geom_point()

"
  Line Chart:
    - When we connect the lines of the scatterplot
    - Ex1: ggplot(housing_df, aes(x=YearBuilt, y=SalePrice)) + geom_line()
      -- The geom_line() is the part which identifies the chart as a line chart.
      -- The rest of the function is the same, we specify the dataframe and x,y 
        columns.
      -- Plotting the data YearBuilt as x and SalePrice as y.
"
# Ex1:
ggplot(housing_df, aes(x=YearBuilt, y=SalePrice)) + geom_line()

# Exercise 1: Plot the line chart flipper_length_mm as x and body_mass_g as y
ggplot(penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_line()

# Exercise 2: Plot the line chart carat as x and price as y
ggplot(diamonds, aes(x=carat, y=price)) + geom_line()


"
  Bar Chart:
    - Ex1: ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat='identity')
      
      it has the same structure but instead of geom_point we use
      geom_bar() with its identity parameter set to identity
    
    - Counting repition: We are interested to know which movie genre has the
      most movies (which genre has the highest repition):
        Ex2: ggplot(movie_profit, aes(x = genre )) + geom_bar()
        
        1. First we pass movie_profit as the dataframe
        2. We choose genre as our x since we are interested in knowing 
           the repition
        3. We add geom_bar() to identify the graph as a bar chart
    
    - Now imagine that we want to within each genre, what are the repitions of
      the rating types. We could do this using an attribute called fill:
      
      Ex3: ggplot(movie_profit, aes(x = genre, fill = mpaa_rating )) + geom_bar()
        
        1-3. We have followed the same process for steps 1 to 3.
        4. What does fill do? It groups data based on rating. We have already 
          grouped data into genres, fill will group each genre group based on
          its ratings.
"
# Ex1: Time as x and demand as y
ggplot(BOD, aes(x=Time, y=demand)) + 
  geom_bar(stat='identity')

# Exercise 1: Plot LotShape as x for SalePrice bar chart
ggplot(housing_df, aes(x=LotShape, y=SalePrice))+ 
  geom_bar(stat='identity')

# Ex2: Which genre has the most repetitions
ggplot(movie_profit, aes(x = genre )) + 
  geom_bar()

# Ex3: Adding the filter to
ggplot(movie_profit, aes(x = genre, fill = mpaa_rating )) + 
  geom_bar()

# Ex4: Scaling the graph to look normalized
ggplot(movie_profit, aes(x = genre, fill = mpaa_rating )) + 
  geom_bar(position = "fill")

# Ex5: Using fill with position dodge to make seperate graphs
ggplot(movie_profit, aes(x = genre, fill = mpaa_rating )) +
  geom_bar(position = "dodge")

# HINT: The position value with geom_bar() should either be dodge or fill
# Exercise 1: plot clarity column of diamonds dataframe with cut as the fill
ggplot(diamonds, aes(x = clarity, fill = cut )) +
  geom_bar(position = "fill")

# Exercise 2: plot clarity column of diamonds dataframe with color as the fill
ggplot(diamonds, aes(x = clarity, fill = color )) +
  geom_bar(position = "fill")

"
  Histograms:
    - Bar charts with connected bars
    - ggplot(movie_profit, aes(x=log(worldwide_gross) )) 
      + geom_histogram(binwidth = 2)
      
      1. dataframe: we specify which dataframe we are interested in
      2. aes(x=log(worldwide_gross)): mapping the needed x and y values
      3. + geom_histogram(): Generates a histogram 
      
      Note: That single variable charts will only use x, not y
      
    - One Parameter bar chart: Imagine that we want to break a column 
      in to ranges and check to see which range has the most repition
      (frequency).
      
      ggplot(housing_df, aes(x=log(SalePrice))) + geom_histogram(binwidth = 0.3)
      
      we are setting binwidth to .3, this value will break the data into its given pieces

"
# Ex1:
ggplot(movie_profit, aes(x = log(worldwide_gross) )) + 
  geom_histogram()

# Ex2:
ggplot(housing_df, aes(x=log(SalePrice))) + 
  geom_histogram(binwidth = 0.3)

# Ex3: What difference does a higher binwidth value make?
ggplot(diamonds, aes(x=carat)) + geom_histogram(binwidth = 0.25)
ggplot(diamonds, aes(x=carat)) + geom_histogram(binwidth = 0.15)

# Exercise 1: Make a histogram of body_mass_g from penguins
ggplot(penguins, aes(x=body_mass_g)) + geom_histogram()

# Exercise 2: Make a histogram of body_mass_g from penguins with binwidth=500
ggplot(penguins, aes(x=body_mass_g)) + geom_histogram(binwidth = 500)

"
  Density:
    - Used to graph continous data
"
# Density plot and adding aesthetic layers:
ggplot(movie_profit, aes(x = log(worldwide_gross), colour = genre )) +
  geom_density()


# Exercise 1: Make a density plot of body_mass_g, colour the plot by species
ggplot(penguins, aes(x = body_mass_g, colour = species )) +
  geom_density()


## For two numbers: scatter plots (or dot/point plots)

ggplot(movie_profit, aes(x = production_budget,  y = worldwide_gross - production_budget )) +
  geom_point() +
  geom_smooth()


# Adding an aesthetic layer
ggplot(movie_profit, aes(x = production_budget,  
                         y = worldwide_gross - production_budget, colour = genre )) +
  geom_point(alpha = .35)

# Interactive plots with plotly
library(plotly)

plt <- ggplot(movie_profit, aes(x = production_budget,  
                                y = worldwide_gross - production_budget, colour = genre )) +
  geom_point(alpha = .35, aes(label = movie))

plt

ggplotly(plt)







