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
species_area_plot <- function(A=1:5000,c= 0.5,z=0.26) {
  plot(x=A,y=species_area_curve(A,c,z),type="l",xlab="Island Area",ylab="S",ylim=c(0,2500))
  mtext(paste("c =", c,"  z =",z),cex=0.7)
  #      return()
}
species_area_plot()
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

par(mfrow=c(1,1))

#############################################################
# Feb 25 2025
#############################################################

# Looping with while or repeat

# looping with for
# best way to create an op that you dont know what the end will be
cut_point <- 0.1
z <- NA
ran_data <- runif(100)
for (i in seq_along(ran_data)) {
  z <- ran_data[i]
  if (z < cut_point) break
}
print(z)
print(i)


# looping with while
#
z <- NA
cycle_number <- 0
while (is.na(z) | z >= cut_point) { # While the conditions are met....
  z <- runif(1)
  cycle_number <- cycle_number + 1

}
print(z)
print(cycle_number)

# Using the expand.grid() function to create a dataframe with parameter combinations
expand.grid(c_pars, z_pars)
# set up two variables (c_pars and z_pars) and paired up all the unique combos of the paramerters

df <- expand.grid(c_pars=c_pars, z_pars=z_pars)
head(df)
str(df) # dataframe


##################################################
# function: sa_output
# Summary stats for species-area power function
# input: vector of predicted species richness
# output: list of max-min, coefficient of variation
##################################################
sa_output <- function(S=runif(1:10)) {

  sum_stats <- list(s_gain=max(S)-min(S),s_cv=sd(S)/mean(S))

  return(sum_stats)
}
sa_output()

# Build program body with a single loop through
# the parameters in modelFrame

# Global variables
area <- 1:5000
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)

# set up model frame
model_frame <- expand.grid(c=c_pars,z=z_pars)
model_frame$s_gain <- NA
model_frame$s_cv <- NA
print(model_frame)

# cycle through model calculations
for (i in 1:nrow(model_frame)) {

  # generate S vector
  temp1 <- species_area_curve(A=area,
                              c=model_frame[i,1],
                              z=model_frame[i,2])
  # calculate output stats
  temp2 <- sa_output(temp1)
  # pass results to columns in data frame
  model_frame[i,c(3,4)] <- temp2

}
print(model_frame)

# Parameter sweeping redux with ggplot graphics
library(ggplot2)

area <- 1:5 #keep this very small initially
c_pars <- c(100,150,175)
z_pars <- c(0.10, 0.16, 0.26, 0.3)

# set up model frame
model_frame <- expand.grid(c=c_pars,z=z_pars,A=area)
model_frame$S <- NA # set as NA for now and then use op to fill in

# Multiple ways to approch this

# first way more complex double for loop
# cycles over the parameters
# hard to read
for (i in 1:length(c_pars)) {
  for (j in 1:length(z_pars)) {
    model_frame[model_frame$c==c_pars[i] & model_frame$z==z_pars[j],"S"] <- species_area_curve(A=area, c=c_pars[i], z=z_pars[j])
  }
}

# second more straight forward option
# for loop cycles over model frame structure
for (i in 1:nrow(model_frame)) {
  model_frame[i,"S"] <- species_area_curve(A=model_frame$A[i],
                                           c=model_frame$c[i],
                                           z=model_frame$z[i])
}

head(model_frame)

p1 <- ggplot(data=model_frame)
p1 + geom_line(mapping=aes(x=A,y=S)) +
  facet_grid(c~z)


p2 <- p1
p2 + geom_line(mapping=aes(x=A,y=S,group=z)) +
  facet_grid(.~c)


p3 <- p1
p3 + geom_line(mapping=aes(x=A,y=S,group=c)) +
  facet_grid(z~.)







