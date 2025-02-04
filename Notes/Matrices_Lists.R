# Matrices and Lists
# 4 Feb 2025
# SMS

## Creating a Matrix ##

my_vec <- 1:12
m <- matrix(data=my_vec, nrow=4)
print(m)
# dem as defined by nrow or ncol

m <- matrix(data=my_vec, ncol=3)
print(m)
# filled vertically down each row

m <- matrix(data=my_vec, ncol=3, byrow=TRUE) #default byrow is false but can change
print(m)

## Lists ##
  # Lists are atomic vectors but each element
  # can hold things of different types and different sizes

my_list <- list(1:10,
                matrix(1:8,nrow=4,byrow=TRUE),
                letters[1:3],
                pi)
#first item is your matix 2nd is some charactors, 3rd is just pi (3.1415)

str(my_list)
print(my_list)
# easy to make list harder to manipulate and pull from it

#  using [] gives you a single item, which is of the type list
my_list[4]
my_list[4] - 3 # nope, cant subtract a number from list
# not the actual number or whatever it just showing list
# like grocery list... writing OJ is just a word on paper not actual juice

# to grab the object itself use double brackets [[]]
my_list[[4]]
my_list[[4]] - 3

# if a list has 10 elements it is like train with 10 cars
# [[5]] gives contents of car 5
# [c(4,5,6)] gives a little train with cars 4, 5 6

# once double bracket is called you can access indevidual elements as before
my_list[[2]]
my_list[[2]][4,1]

# name list items when they are created

my_list2 <- list(tester=FALSE,
                 little_m=matrix(1:9,nrow=3))

my_list2$little_m[2,3] # get row 2 column 3
my_list2$little_m # show the whole matrix
my_list2$little_m[2,] # show second row, all columns
my_list2$little_m[,2] # show all the rows, only second column
my_list2$little_m[,] # all
my_list2$little_m[]
my_list2$little_m[2] # bc only single dimention R turns it back to vector and gives
                     # whatever in second position... Not super kosher

# the "unlist" strings everything back into a single atomic vector;
# coercion is used if there are mixed data types
unrolled <- unlist(my_list2)
print(unrolled)

# the most common use of list: output from a linear model is a list
library(ggplot2)
y_var <- runif(10)
x_var <- runif(10)
my_model <- lm(y_var~x_var)
qplot(x=x_var,y=y_var)

# look at output in my_model
print(my_model) # cool but there should be more we can get from this
print(summary(my_model))

str(summary(my_model))
summary(my_model)$coefficients

summary(my_model)$coefficients["x_var","Pr(>|t|)"] # pull something specific
summary(my_model)$coefficients[2,4]

u <- unlist(summary(my_model))
print(u)

my_slope <- u$coefficients2
my_pval <- u$coefficients8


## Data Frames ##
# a data frame is a list of equal length vectors

var_a <- 1:12
var_b <- rep(c("Con", "LowN", "HighN"), each=4)
var_c <- runif(12)
d_frame <- data.frame(var_a,var_b,var_c)
print(d_frame)
str(d_frame)














