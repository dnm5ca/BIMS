#Intro to R
#------------------------------------------------------
#this is a comment and will not be run as code
mylist <- "1, 2, 3"
#R is the underlying statistical computing environment
#RStudio sits on top of R and makes writing code a lot easier.

#Creating projects.

#R Studio Panes
#-On the top left is the script or editor window. This is where we are going to write all of our code.
#- On the lower left there's the console window. This is where R tells us what it thinks we told it and then the answer. This is basically the same kind of interface as the terminal
#- The top right has the environment and history tabs ... environment is a list of all objects that are saved in memory ... history (SHOW HISTORY) is the history of all commands that have been run ...
#- On the bottom right hand side there's a window with Files / Plots / Help

# R can be used as a calculator
2 + 2
5 * 3
2 ^ 5

# R knows order of operations
2 + 3/4 * 4 * (4+4)/4^2

# Assign objects using <-
weight_kg <- 55
weight_kg

# R is case sensitive
Weight_kg <- 60
Weight_kg <- 30

#Do not name R objects with period, spaces, or using name that is already used in R
#e.g. data() is already a function and so is a bad name for an object

#we can do arithmetic with R objects
2.2 * weight_kg

#modify R object by reassigning object to new number
weight_kg <- 57.5
2.2 * weight_kg

#we can re-name 2.2*weight_kg as weight_lb
weight_lb <- 2.2 * weight_kg

#change value of weight_kg
weight_kg <- 100

###YOUR TURN###
#What value does weight_kg have?

#What value does weight_lb have?

#list objects in environment
ls()

#remove objects from environment
rm(weight_lb, weight_kg)
ls()
weight_lb
weight_lb <- 20

rm(list = ls())
#--------------------------------------------------
#Exercise 1
# 1.	You have a patient with a height (inches) of 73 and a weight (lbs) of 203. Create r objects labeled 'height' and 'weight'.

height <- 73
weight <- 203

# 2.	Convert 'weight' to 'weight_kg' by dividing by 2.2. Convert 'height' to 'height_m' by dividing by 39.37
weight_kg <- weight /2.2
height_m <- height/39.37

# 3.	Calculate a new object 'bmi' where BMI = weight_kg / (height_m*height_m)

bmi <- weight_kg / (height_m * height_m)
bmi <- weight_kg / (height_m ^ 2)

#--------------------------------------------------

#Built-in Functions
sqrt(144)

log(1000)

#Get help with function
?log
log10(1000)
log(1000, base = 10)

#The base= part inside the parentheses is called an argument. Arguments are the inputs to functions

#We can write functions without labeling arguments as long as they come in the same order as in the help file
log(1000, 10)

#Nesting Functions
sqrt(log(1000, 10))

#Because sqrt() takes a number and because log() outputs a number we can nest the two together

#create intermediate object to make nesting easier to decipher
myval <- log(1000, 10)
sqrt(myval)

#------------------------------------------------
#Exercise 2
#See `?abs` and calculate the square root of the log-base-10 of the absolute value of `-4*(2550-50)`. Answer should be `2`.
sqrt(log(abs(-4*(2550 - 50)), 10))

#Vectors
  #Vectors are one of the most basic data types in R. They are a sequence of data elemnets of the same type. This can be numeric (2, 3.2, etc.), character ("a", "a sentence is here", "548-4241"), logical ("TRUE", "FALSE"), etc, they just all have to be of the same type.
1:5

6:10

1:5 + 6:10

1:5 + 6:8
1:6 + 6:8

1:5 + 3

#Create vectors using c() function (concatenate / combine)
c(1, 5, 6)
c(1:5, 1:6)

#What if we wanted to created a vector from to 2 to 200 by 4s?
?seq
seq(from = 2, to = 200, by = 4)

#assign vectors to object name
animal_weights <- c(50, 60, 66)
animal_weights

#vectors can also be character type
animals <- c("mouse", "rat", "dog")
animals

#Inspecting vectors
length(animals)
class(animals)
class(animal_weights)

str(animals)
str(animal_weights)

#appending to vectors using c()
animal_weights <- c(animal_weights, 80)
animal_weights <- c(49, animal_weights)
animal_weights

#sum
sum(animals)
sum(animal_weights)
mean(animal_weights)

#Indexing vectors
x <- 100:150
x[1]
animals[1]

#fifth through 10th elements
x[5:10]
animals[2:3]

#40th and 48th elements (non-sequential)
x[c(40, 48)]
animals[c(1, 3)] 

#what happens when we call an index beyond the vector
x[1:150]

animals[c(4)] <- "lizard"

animals[c(15)] <- "bat"
animals
animals[c(1500)] <- "horse"
animals
animals[c(1, 3)] <- c("anteater", "koala")

#--------------------------------------------------
#Data frames
#data frames store heterogeneous tabular data in R: tabular, meaning that individuals or observations are typically represented in rows, while variables or features are represented as columns; heterogeneous, meaning that columns/features/variables can be different classes (on variable, e.g. age, can be numeric, while another, e.g., cause of death, can be text)

#load data using read.csv
gm <- read.csv("gapminder.csv", header = TRUE)

#another option is read_csv in the readr package
#inspecting dataframes
gm
View(gm)

class(gm)

head(gm)
tail(gm, 10)

dim(gm)
nrow(gm)
ncol(gm)

names(gm)
summary(gm)
str(gm)

#Using the $ to access variables
gm$pop

mean(gm$lifeExp, na.rm = TRUE)

#would need mean(gm$lifeExp, na.rm = TRUE) if there are missing values in dataframe

#------------------------------------------------------
#Exercise 3
#1. What's the standard deviation of the life expectancy (hint: get help on the `sd` function with `?sd`).
?sd
sd(gm$lifeExp, na.rm = TRUE)

#2. What's the mean population size in millions? (hint: divide by `1000000`, or alternatively, `1e6`).
mean(gm$pop, na.rm = TRUE) / 1e6

#3. What's the range of years represented in the data? (hint: `range()`).
range(gm$year)
range(gm$pop)

#4.	Run a correlation between life expectancy and GDP per capita (hint: ?cor())
cor(gm$lifeExp, gm$gdpPercap, method = "kendall")

attach(gm)
  lifeExp
detach(gm)

#-------------------------------------------------------

#Filtering a data frame using subset()

#There are six operators in total for conditions
#-equal to ==
#-not equal to !=
#-greater than >
#-greater than or equal to >=
#-less than <
#-less than or equal to <=

#get data from 1982
  subset(gm, subset = year == 1982)
  
#Chain multiple conditions together with an AND operator & or an OR | operator
  
#get data from 1982 and USA
subset(gm, subset = year == 1982 & country == "United States")

#get data where pop is bigger than the mean(pop)
  subset(gm, subset = pop > mean(pop))

#Filtering using filter() from dplyr package
#first install dplyr
install.packages("dplyr")

#load dyplr
library(dplyr)

#get data from 1982
filter(gm, year == 1982)

#get data from US
filter(gm, country == "United States")
filter(gm, country == "United States" & year == 1982)

#data with gdpPercap was less than 300 or the life Expectancy was less than 30
filter(gm, gdpPercap < 300 | lifeExp < 30)

# what was the average GDP for the two countries in Oceania in 2002?
mean(filter(gm, continent == "Oceania" & year == 2002)$gdpPercap)

select(gm, continent, country, year)

#-------------------------------------------------------
#EXERCISE 4
  
#1. Which countries and years have life expectancies of more than 80 years (>80)?
unique(filter(gm, lifeExp > 80)$country)
unique(filter(gm, lifeExp > 80)$year)

#2. Which countries had a low GDP per capita (< 500) in 2007?
filter(gm, (gdpPercap < 500 & year == 2007))

#------------------------------------------------------
#Base plotting -- histogram and scatterplot
plot(gm$lifeExp)
hist(gm$lifeExp)

#change number of bins and color
hist(gm$lifeExp, breaks = 100, col = "blue")

#scatterplot
plot(gm$gdpPercap, gm$lifeExp)

plot(gm$gdpPercap, gm$lifeExp, pch = 16)

plot(gm$gdpPercap, gm$lifeExp, pch = 16, col = "red")

plot(gm$gdpPercap, gm$lifeExp, pch = 16, col = "red", main = "Life Exp vs. GDP")

#add axes labels
plot(gm$gdpPercap, gm$lifeExp, pch = 16, col = "red", main = "Life Exp vs. GDP", ylab = "Life Expectancy (years)", xlab = "Per-capita GDP ($)")

#if you forget how to modify a parameter ... Google it

#Write out csv file of filtered dataframe
#create filtered df
gm97 <- filter(gm, year == 1997)

#write out data frame into csv file
write.csv(gm97, file = "gm97.csv")

#-------------------------------------------------------
#EXERCISE 5

#Create a plot to show the relationship between continent and life expectancy. If there is time add color, axis labels, and a title

plot(gm$continent, gm$lifeExp)

#-------------------------------------------------------