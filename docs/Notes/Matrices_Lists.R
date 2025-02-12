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

# add rows and columns to data frame
# add row with rbind
# make sure to add a list with each item cooresponding to a column

new_data <- list(var_a=13,var_b="HighN",var_c=0.668) #make new data frame
print(new_data)
str(new_data)

d_frame <- rbind(d_frame,new_data) #add a new row
str(d_frame)
tail(d_frame)

# add a new column
new_var <- runif(13)
d_frame <- cbind(d_frame,new_var)
head(d_frame)

## Imporant distinctions between lists and matrices

# create a matrix and data frame with some same structures to compare
z_mat <- matrix(data=1:30,ncol=3,byrow=TRUE)
z_dframe <- as.data.frame(z_mat) #coerce it

str(z_mat) # an atomic vector wwith 2 dems
str(z_dframe) # assigned labels, horizontal str

head(z_mat)
head(z_dframe)

#element referencing is the same in both
z_mat[3,3]
z_dframe[3,3]

z_mat[,3] # all the rows and the column specified
z_dframe[,3] # all rows and column 3
z_dframe$V3 #can also call by label in frame

z_mat[3,] # row 3 and all columns
z_dframe[3,]

z_mat[2] # takes the second element of the atomic vector (column fill)
z_dframe[2] # takes the second atomic vector (=column) from the list

z_dframe["V3"]


## Eliminating missing values ##
# R will probs get mad at NA's

zd <- runif(10)
print(zd)
zd[c(5,7)] <- NA # add in NA values in 5th and 7th spot
print(zd)

complete.cases(zd) # gives back boolean T/F values to identify missing values
zd[complete.cases(zd)] # shrinks vector by pulling out missing values
which(!complete.cases(zd)) # which of the cases are not complete? tells you where they are

# now in a matrix

m <- matrix(1:20,nrow = 5) # create and plug in NA vals
m[1,1] <- NA
m[5,4] <- NA
print(m)

m[complete.cases(m),] # keep all the colmns

# keep the whole matrix but eliminate rows that have missing vals in certain columns (not all)
m[complete.cases(m[,c(1,2)]),] # creating little matrix that has all rows and first 2 column
m[complete.cases(m[,c(2,3)]),] # no drops
m[complete.cases(m[,c(3,4)]),] # drop row 4
m[complete.cases(m[,c(1,4)]),] # drop row 1 & 4
# this is complex better to break down by steps or use dyplr

## more assignments and subsetting ##

# add names to col and row labels
m <- matrix(1:12,nrow = 3)
dimnames(m) <- list(paste("Species",LETTERS[1:nrow(m)], sep = ""), paste("Site", 1:ncol(m), sep = ""))
print(m) # names arent part of the matrix so dont take up space but will travel with the matrix

# subsetting matrix based on elements
m[1:2, 3:4]
# or
m[c("SpeciesA","SpeciesB"), c("Site3", "Site4")]

# use blanks to indecate full row or col
m[1:2, ]
m[ ,3:4]

colSums(m) > 15 # based on contents of the matrix returns boolean
m[ , colSums(m) > 15]

m[rowSums(m)==22, ] # select for all rows which the row total is 22

m[rowSums(m)!=22, ] # add in ! fot not, does the opposite

# choose all rows fro which nums fro site 1 are less than 3
# AND choose all column for which the nums for species A are less than 5
m[ ,"Site1"]<3 # first for rows
m[m[ ,"Site1"]<3, ]

m["SpeciesA", ]<5 # now for cols
m[ ,m["SpeciesA", ]<5]

m[m[ ,"Site1"]<3, m["SpeciesA", ]<5] # now combine them


# note: spimple subscripting to a vector changes the data type
z <- m[1, ]
print(z)
str(z)

# to stop this from happening...
z2 <- m[1, , drop=FALSE]
print(z2)
str(z2)

m2 <- matrix(data=runif(9),nrow=3)
print(m2)

m2[m2>0.6] <- NA
print(m2)

# read in a csv
data <- read.csv(file="antcountydata.csv", header=TRUE, sep=",")
head(data)
str(data) # 69 rows 29 cols

data[3,2]

data_names <- data[c("state", "county")]
str(data_names)



####### FEB 11 ########
# Creating datasets

# code for reading in data frame for .csv
my_data <- read.table(file = "StudyData.csv",
                      header = TRUE,
                      sep = ",",
                      comment.char = "#")
head(my_data) #now exists in the R enviroment
str(my_data) # inspect the data, note the NA was reconized as numeric
my_data$newVar <- runif(4)

write.table(x = my_data,
            file = "SampleOutputFile.csv",
            sep = ",")
# this is actually not a great method

saveRDS(my_data, file = "my_data.RDS") # RDS suffix is not required but good for clairity
restored_my_data <- readRDS("my_data.RDS")
