# For Loops
# 18 Feb 2025
# SMS

# Anatomy of a for loop
#for (var in seq) { # start of for loop
  # body of for loop

#}  # end of for loop

# simple first loop

for (i in 1:5) {
  cat("stuck in a loop", "\n")
  cat(3 + 2, "\n")
  cat(runif(1), "\n")
} # end of code and will jump back up to top and run 5 times

print(i)



my_dogs <- c("chow", "akita", "malmute", "husky", "lab")
for(i in 1:length(my_dogs)){
  cat("i =", i, "my_dogs[i] =", my_dogs[i], "\n")
}



my_bad_dogs <- NULL
for(i in 1:length(my_bad_dogs)){ # length will be zero so cant count reps but probs wont just fail
  cat("i =", i, "my_bad_dogs[i] =", my_bad_dogs[i], "\n")
}
# i = 1 my_bad_dogs[i] =
# i = 0 my_bad_dogs[i] =

for (i in seq_along(my_dogs)){
  cat("i =", i, "my_dogs[i] =", my_dogs[i], "\n")
}

for (i in seq_along(my_bad_dogs)){
  cat("i =", i, "my_bad_dogs[i] =", my_bad_dogs[i], "\n")
} # no output (not error)

# can also use a constant num
zz <- 5
for (i in seq_len(zz)){
  cat("i =", i, "my_dogs[i] =", my_dogs[i], "\n")
}


## Feb 20 ##

# use 'next' to select parts of the loop

# work with only the odd numbered elements

z <- 1:20

16/5
16 % % 5 # integer division
16 %% 5

for (i in 1:length(z)) {
  if(i %% 2==0) next # is the rep number divisable by 2? if true 'next' to stop loop and start over
  print(i) # only prints if i divides by 2
}

# same but for even nums
for (i in 1:length(z)) {
  if(i %% 2==1) next
  print(i)
}

# for evens but different approach
for (i in 1:length(z)) {
  if(i %% 2 !=0) next
  print(i)
}

# do you need a loop for this?? no
z <- 1:20
zsub <- z[z %% 2 !=0] #
length(zsub)
print(zsub)



#############################################################
# Function: ran_walk
# stochastic random walk
# Input: times = number of time steps
#        n1 = inital population size (= n[1])
#        lambda = finite rate of increase
#        noise_sd = sd of a normal distribution with mean 0
# Output: vector n with population size > 0 until extinction, then NA
#############################################################
library(ggplot2)
ran_walk <- function(times=100, n1=50, lambda=1.0, noise_sd=10) {
  n <- rep(NA, times)
  n[1] <- n1
  noise <- rnorm(n = times, mean = 0, sd = noise_sd) # above is not part of loop but is func used for set up
  for (i in 1:(times-1)) {
    n[i + 1] <- lambda*n[i] + noise[i] # the next elem in vec is found by taking the current elem * lambda + noise
    if(n[i+1] <=0) {
      n[i+1] <- NA
      cat("Population exstiction at time", i+1, "\n")
      break}
  }

  return(n)
}
#############################################################
ran_walk()
# this is some that needs to be done in for loop bc steps depend on eachother
# dont know when its going to end and so need a end point
qplot(x = 1:100, y = ran_walk(), geom = "line")
# run some test cases to make sure everything is working
qplot(x = 1:100, y = ran_walk(noise_sd = 0), geom = "line") # nice no up/dow trend as expected with no noise

qplot(x = 1:100, y = ran_walk(noise_sd = 0, lambda = 1.1), geom = "line") # nice, expo increase

qplot(x = 1:100, y = ran_walk(noise_sd = 0, lambda = 0.98), geom = "line") # nice,

qplot(x = 1:100, y = rnorm(n=100, mean = 50), geom = "line")


# using a double for loop

#for row
m <- matrix(round(runif(20), digits = 2), nrow = 5)
# loop over rows
for (i in 1:now(m)) {
  m[i,] <- m[i,] + i
}

print(m)
# for col
for (j in 1:ncol(m)) {
  m[,j] <- m[,j] + j
}
print(m)

# loop row and col
for (i in 1:nrow(m)) {
  for (j in 1:ncol(m)) {
    m[i,j] <- m[i,j] + i + j
  }
}
print(m)

# writing functions for eqs and sweeping over perameters

#############################################################
# Function: SpeciesAreaCurve
# creates power function relationship for S and A
# Input: A is a vector of island areas
#        c is the intercept constant
#        z is slope constant
# Output: S is a vector of species richness values
#############################################################
species_area_curve <- function(A = 1:5000, c = 0.5, z = 0.26) {
  S <- c*(A^z)
  return(S)
}
#############################################################

head(species_area_curve())


# make a new one to plot it
# THIS IS NOT COMPLETE
#############################################################
# Function: SpeciesAreaPlot
# plot species area curves wwith permameter vals
# Input: A is a vector of island areas
#        c is the intercept constant
#        z is slope constant
# Output: smoothed curve with perameter in graph
#############################################################
species_area_plot <- function(A = 1:5000, c = 0.5, z = 0.26) {
  plot(x+A,y=species_area_curve(A,c,z),type="l", xlab="Island Area", ylab="S",ylim=c(0,2500))
  mtext(paste("c =" c, "z =" z))
  return(S)
}
#############################################################

head(species_area_curve())

# global variables
c_pars <- c(100, 150, 175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)
par(mfrow = c(3,4))
for (i in seq_along(c_pars)) {
  for (j in seq_along(z_pars)) {
    species_area_plot(c=c_pars[i], z=z_pars[j])
  }
}






