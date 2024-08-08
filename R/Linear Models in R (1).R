library(ggplot2)
library(gapminder)
# Model fitting in R, the Basics:

# 1 - What are linear models? ---------------------------------------------

# Intro to simple linear regression: Quantifying the relationship between GDP per-capita and life expectancy.
gapminder

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp )) + 
  geom_point()

# Make the same chart, but look at the log of gdp per capita instead
___


# Use geom_abline to guess the relationship
___

# 2: Manually creating a model with 1 x variable ---------------------------------
# https://www.dummies.com/wp-content/uploads/380996.image0.jpg


y <- ___
x <- ___

x_bar <- ___
y_bar <- ___

x_diff <- ___
y_diff <- ___

beta_1 <- ___
beta_0 <- ___

ggplot(gapminder, aes(x=log(gdpPercap), y=lifeExp )) +
  geom_point(alpha = .2) + 
  geom_abline(intercept = beta_0, slope = beta_1 )


n <- length(x)

# Making predictions with the model

# Manually calculating with the coefficients
y_hat <- ___

y_hat

# Calculating residual or error

Uhat <- ___

sigma_hat_manual <- ___

sigma_hat_manual


# 3: Model fitting in R syntax -------------------------------------------------
# There are two main ways you can make a model with the same function in R. 

# "Formula syntax" takes the form: lm(y_var ~ x_var, data = dataset)

# "xy syntax" takes the form: lm( y = y_var, x = x_var, data = dataset)

# The fomula syntax is more commonly used and we will focus on that today

# One x-variable

simple_model <- lm( lifeExp ~ gdpPercap, data = gapminder)

summary(simple_model)


# Model the log of gdp per capita instead. Save the model to the "simple_model_ln" object.

simple_model_ln <- ___
  
summary(simple_model_ln)

# Cheat sheet for interpreting regression results: https://www.scribd.com/document/339121943/Cheat-Sheet-Interpreting-Regressions-Three-Pages


# The fitted() function
y_hat2 <- ___

# The predict() function
y_hat3 <- ___

y_hat[1:10]
y_hat2[1:10]
y_hat3[1:10]


# The resid() function
Uhat2 <- ___

Uhat[1:5]
Uhat2[1:5]

# Calculating the standard error
library(arm)
sigma_hat_function <- sigma.hat(___)

sigma_hat_function
sigma_hat_manual

# Adding more variables: numeric and categorical
multiple_model <- lm(___)

# Check the model output
summary(multiple_model)


# Make a model with 2 predictiors: log GDP per-capita and population
model_number <- lm(___)

# Check the model output
summary(model_number)


# 4: Residual plots ----------------------------------------------------------
library(arm)

?arm::residual.plot

old.par <- par(no.readonly = TRUE)

x <- rnorm(100)
y <- rnorm(100)
fit <- lm(y~x)
y.hat <- fitted(fit)
u <- resid(fit)
sigma <- sigma.hat(fit)
residual.plot(y.hat, u, sigma)

par(old.par)


# Make a residual plot for simple_model_ln

y.hat_ln <- ___
u_ln <- ___
sigma_ln <- ___

residual.plot(y.hat_ln, u_ln, sigma_ln)

# Using ggplot2


# 5: The broom package ----------------------------------------------------
library(broom)
library(arm)

# tidy() gets model coefficients
tidy(simple_model_ln) 

# augment() gets model results from the data set
augment(simple_model_ln)

# glace() gets model accuracy metrics
glance(simple_model)
glance(simple_model_ln)


# Exercises ---------------------------------------------------------------

library(ggplot2)

diamonds

# 1: Using the diamonds dataset, make a simple linear model where the carat variable predicts the price variable. 

# 1b: Get the coefficients



# 2: Increase the complexity of the original model. 
# Out of the columns: depth, x, y, and z add the one with the highest correlation to the price of the diamonds 

# Check correlation values using cor()




# Add the highest correlated variable to the model


# 3: Use all the columns in the diamonds dataset to predict the diamonds price



# 4: Make a residual plot of the diamonds model
