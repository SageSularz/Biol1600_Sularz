# Homework 5
# Feb 12 2025
# SMS

## Working with matrices, lists, and data frames ##

# 1. Assign to the variable n_dims a single random integer between 3 and 10.
n_dims <- floor(runif(1, min = 3, max = 10))
print(n_dims)

# a
vec <- c(seq(from = 1, to = n_dims^2))
print(vec)

# b
shuffle <- sample(vec)
print(shuffle)

# c
m <- matrix(data = shuffle, nrow = n_dims)
print(m)

# d
trans_m <- t(m)
print(trans_m)

# e
sum(trans_m[1, ])
# 35

mean(trans_m[1, ])
# 8.75

sum(trans_m[n_dims, ])
# 26

mean(trans_m[n_dims, ])
# 6.5

# f
eigen <- eigen(trans_m)
print(eigen)
# g
typeof(eigen$values)
# complex
typeof(eigen$vectors)
# complex

## 2. Create a list with the following named elements
# a
my_matrix <- matrix(runif(16), nrow = 4, ncol = 4)
print(my_matrix)

my_logical <- runif(100) > 0.5
print(my_logical)

my_letters <- sample(letters)
print(my_letters)

my_list <- list(my_matrix, my_logical, my_letters)

# b
my_list2 <- list(my_matrix[2,2], my_logical[2], my_letters[2])
print(my_list2)

typeof(my_list2[[1]])
# double

typeof(my_list2[[2]])
# logical

typeof(my_list2[[3]])
# character

my_vec <- c(my_list2[[1]], my_list2[[2]], my_list2[[3]])
print(my_vec)
typeof(my_vec)


## 3
my_data <- data.frame(
  my_unis = runif(26, min = 0, max = 10),
  my_letters = sample(LETTERS))
head(my_data)

my_data$my_unis[sample(1:26, 4)] <- NA
which(is.na(my_data$my_unis))

my_data$my_letters <- sort(my_data$my_letters)

mean(my_data$my_unis, na.rm = TRUE)
