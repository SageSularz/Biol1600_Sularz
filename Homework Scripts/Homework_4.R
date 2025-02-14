# Homework 4
# 5 Feb 2025
# SMS

## 1 ##
x <- 1.1
a <- 2.2
b <- 3.3

#a
z = x^{a^b}
print(z)

#b
z = (x^a)^b
print(z)

#c
z = 3*x^3 + 2*x^2 + 1
print(z)

## 2 ##

# Using the rep and seq functions, create the following vectors
z <- c(seq(1:8), seq(from = 7, to = 1))
print(z)

z <- c(1:5)
z <- rep(x=z,times=z)
print(z)


z <- c(1:5)
z <- rep(x=5:1,times=z)
print(z)

## 3 ##

set.seed(2)
cartesian <- runif(2)

polar <- c(sqrt(cartesian[1]^2 + cartesian[2]^2), atan(cartesian[2] / cartesian[1]))
print(polar)

## 4 ##

queue <- c("sheep", "fox", "owl", "ant")
print(queue)
# a
queue <- c(queue, "serpent")
print(queue)

# b
queue <- queue[-1]
print(queue)

# c
queue <- c("donkey", queue)
print(queue)

# d
queue <- queue[-5]
print(queue)

# e
queue <- queue[-3]
print(queue)

# f
queue <- c(queue[1:2],"aphid",queue[3])
print(queue)

# g
aphid_pos <- which(queue=="aphid")
print(aphid_pos)

## 5 ##
num <- seq(1, 100, by = 1)
num_filt <- num[!(num %% 2 == 0 | num %% 3 == 0 | num %% 7 == 0)]
print(num_filt)
