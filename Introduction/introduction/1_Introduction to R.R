#### 
##A very basic introduction to R
####
##R for Political Science Grad Students course 2024-25
####


# This file is an R script file. 
# Every line here is a command to R, unless you put # before 
# To tell R to execute (or "run"), just Click "run" (or Ctrl+Enter). 

# R is a smart calculator. 
1+1
4*4
0.5^2
sqrt(0.25)
log(2)
rnorm(10)#rnorm represent a sample of n values from a normal distribution (by default mean=0 and SD=1).
set.seed(2021)
rnorm(100,100,10)

# You can create and name "objects" and they will be saved in your "environment". 
# To create an "object" use the sign "<-"
my_first_object <- 1

#From now on, when you type "my_first_object" R will read the value of it:
my_first_object

# Now try this:
my_first_object + 2

# You can also "override" objects:
my_first_object <- my_first_object + 2

my_first_object


# Almost anything can be an object. 
# For example, an object can be a single value, or a "vector" (series of values)

my_first_vector <- c(1,2,3,4,5,6,7,8,9,10)
my_first_vector

my_second_vector <- c("a","b","c","a","b","c","a","b","c","x")
my_second_vector

my_third_vector <- c(TRUE,TRUE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE)
#Notice how c() is used to represent a series of values.
my_third_vector

my_fourth_vector <- rnorm(10)
my_fourth_vector

my_fifth_vector <- 0.5*my_fourth_vector + rnorm(10,mean=0,sd=0.5)
my_fifth_vector



#  Another important type of object is a data table, called "data frame". 

my_first_dataframe <- data.frame(my_first_vector,
                                 my_second_vector,
                                 my_third_vector,
                                 my_fourth_vector,
                                 my_fifth_vector)

my_first_dataframe

# In a data frame, each column is a "variable" and each row is an "observation".

# To extract a variable of a data frame you can use the $ sign:
my_first_dataframe$my_first_vector

#Here is another way to do that:
my_first_dataframe[,"my_first_vector"]

#And here is another way:
my_first_dataframe[,1]

#The [,] structure enables you to extract an observation:
my_first_dataframe[1,]

#And also a specific value of observation on a specific variable:
my_first_dataframe[1,1]

#Now try these and see what happens: 
my_first_dataframe[1,1:2]
my_first_dataframe[1:2,c(1,3)]



# There are three main data types: 
# 1. Numerics (numerics/integers/doubles). (Data represent numeric values)
# 2. Characters. (Such as text. Data does not represent numeric value)
# 3. Logicals (TRUE/FALSE)

# Data frames typically consist of different types of variable. 



#One of the great things about R is that you can work with endless data frames (and other objects) at the same time (by comparison with other software).

#For examples, let's import another data frame. We will import now a CSV data file from our shared dropbox library. 
gapminder = read.csv("https://raw.githubusercontent.com/saaralonbarkat/r-poliscience-grad-students-course-/refs/heads/main/data/gapminder/gapminder.csv")

head(gapminder)

#You will later learn how to import data files from your computer. Noteworthy that R can also import all data types (csv, xls, dta, sav...).




# R has operators. We will get to know some of them. 
#== means "equal"
1+2==2+1
3+2==2+1
my_first_dataframe$my_second_vector=="a"


#!= means "not equal"
3+2!=2+1

#| means "or"
my_first_dataframe[1,2]=="b"|my_first_dataframe[1,2]=="c"
#You can also use the %in% operator:
my_first_dataframe[1,2] %in% c("b","c")


# >,<,<=,>= greater / smaller than signs 
my_first_dataframe$my_fourth_vector >= 0


#Let's use the `==` operator to filter the data (next meeting we will learn other ways to do it):
gapminder_2007 <- gapminder[gapminder$year==2007,]


#R has multiple built-in functions. Here are some examples:
round(1.168,1)
mean(gapminder_2007$lifeExp) # Mean of a variable
table(gapminder_2007$continent) # Frequency table
summary(gapminder_2007) 
boxplot(gapminder_2007$gdpPercap)
hist(gapminder_2007$gdpPercap)
plot(gapminder_2007$gdpPercap,gapminder_2007$lifeExp)
cor.test(gapminder_2007$gdpPercap,gapminder_2007$lifeExp) # Correlation coefficient test


model1 <- lm(lifeExp~gdpPercap,data=gapminder_2007) # Linear OLS regression model
summary(model1)

# Notice that `summary` and `plot` are versatile functions. They do different things depending on the type of data. 

#These ready to use functions are called "base R" functions. 


#R also let's you create your own functions. e.g. - this function will extract the sum of two numbers  
myfunction <- function(x, y) {
  z = x + y
  print(z)
}

myfunction(2,4)



# But, one of the things that are great in R is that there are 
# endless extensions that you can download (like apps in your smartphone). 
# These extensions are called "packages" or "libraries".

# We will work with the very useful set of packages in `tidyverse`.
# In the first time you are using a package you need to download and install it
# with `install.packages`
# install.packages("tidyverse")

# Then, you need to open it - and it is ready.
library(tidyverse)


# Tidyverse is a set of packages that provide solutions to all of the stages in 
# the workflow (import, tidy, transform, visualize, model, communicate).
# It uses a unified simple, intuitive human language where functions are verbs. 

#For example, instead of `gapminder_2007 <- gapminder[gapminder$year==2007,]` - you can write:
gapminder %>% 
  filter(year==2007)

#The `%\>%` operator is called "pipe". It is an important element in Tidyverse and it is extremely useful. It makes tidyverse code very elegant - intuitive and easy to read, understand and learn.
#Last year, R also implemented a "base pipe" that can also work: `|>`. So you can either use `%>%` or `|>`

gapminder %>% 
  filter(year==2007) %>% 
  select(continent,country,lifeExp) %>% 
  arrange(lifeExp)


# We will often use tidyverse in the course. 
# We recommend you to get used to working with it (but you prefer to use base R that's also ok). 
# In the end you will develop your own habits and coding style.


# Again, this file is an R script. Scripts are great if you just want R to run
# a list of commands. But there's another very effective way to work with R, 
# with Quarto files (previously called RMarkdown). 
