## Introduction to R scripts
## Jan 28 25
## SMS

# use the assignment operator
x <- 5 # preferred
y = 4 # legal but not used except in function defaults
y = y + 1.1
print(y)
y <- y + 1.1
print(y)

## Variable names
z <- 3 # Begin with lower case letter
plantHeight <- 10 # option "camelCaseFormatting"
plant.height <- 4.2 # avoid periods
plant_height <- 3.3 # optimal "snake_case_formatting"
. <- 5.5 # reserve this for a generic temporary variable (more later)


### R's Four Data Types

## One - Dem ##

# the combine fuction
z <- c(3.2, 5, 5, 6)
print(z)
typeof(z) #output type of vector
is.numeric(z) #output logical value for all "is.____"


# c() always "flattens" to an atomic vector
z <- c(c(3, 4),c(5, 6))
print(z)


# Charactor strings with single or double quotes
z <- c("perch", "bass", 'trout')
print(z)
typeof(z)


# use both wwith an internal quote
z <- c("this is only 'one' charactor string", 'a second')
print(z)
typeof(z)
is.character(z)


# building logicals
# Boolean, not with quotes, all caps
z <- c(TRUE, TRUE, FALSE)
print(z)
typeof(z)
is.character(z)

## Three properties of a vector ##

# 1) Type
z <- c(1.1, 1.2, 3, 4.4)
typeof(z)
is.numeric(z)
z <- as.character(z) #as. coerces variable
print(z)
typeof(z)


# 2) Length
length(z) # gives number of elements
length(y) # throws error if variable does not exist


# 3) Names
z <- runif(5) # add names later afterf vairable is created
names(z) <- c("chow", "pug", "beagle", "greyhound", "other")
print(z)

print(z[2])
print(z["pug"])

# add names when variable is built
z2 <- c(gold=3.3, silver=10, lead=2)
print(z2)

# reset names
names(z2) <- c("copper", "zinc")
print(z2) # NA bc we reset names and didnt replace

# NA values for missing data
z <- c(3.2, 3.3, NA) # NA is missing
typeof(z)
length(z)
typeof(z[3])


# types of NA
z1 <- NA
typeof(z1)

is.na(z) # logical operator to finding missing vals
mean(z) # wont work because of NA
!is.na(z) # use '!' to mean NOT
mean(!is.na(z)) # wrong answer based on TRUE FALSE
mean(z[!is.na(z)]) # correct use of indexing

# NaN, -Inf, and Inf from numerical division
z <- 0/0 # NaN
typeof(z)
print(z)
z <- 1/0 # Inf
print(z)
z <- -1/0 # -Inf
print(z)


## Three notiable features of Atomic vectors ##

# 1) Coercsion
# all atomics are of the same types
# if they are different, R coerces them
# logical -> interger -> double -> charactor
a <- c(2, 2.0)
print(a)
typeof(a) # tech integer coerced to numeric
b <- c('purple', 'green')
typeof(b)

d <- c(a, b)
print(d)
typeof(d)

# Mistakes in nummeric variables convert to string
# very usefull when working with logical variables
a <- runif(10)
print(a)


# Comparison operators yeild a logical results
a > 0.5

# do math on a logical and it coerces it to integer
# how many elements are greater than 0.5
sum(a > 0.5)

# What proportion of the vector elements are greater than 0.5
mean(a > 0.5)
# break down the results
. <- a > 0.5
print(.)
print(sum(.))

# IDK but im typing it out
mean(rnorm(1000) > 2)
mean(rnorm(100000000) > 2) # larger sample size stand


# 2) Vectorization

# adding a constant to a vector
z <- c(10, 20, 30)
z + 1


# what happens when vectors are added
y <- c(1, 2, 3)
z + y # matching up elements in each slot of vector and adding them up

z^2

# 3) Recycling

# but what if vector lengths are not equal
z <- c(10, 20, 30)
x <- c(1, 2)
z + x # 10 + 1, 20 + 2, 30 + 1
