# Working with functions and creating user defined functions
# 11 Feb 2025
# SMS

sum(3,2) # a "prefix" functions
3 + 2 # an "oporater" but is actually a function
`+`(3,2)

y <- 3
print(y)
`<-`(yy,3)
print(yy)

sd # shows the code
sd(c(3,2)) # call the funtion with parameters
sd() # call function with default values for parameter
    # not all functions have a "default" so this will turn up an error

# set default perameters in case unser has not
# curly brackets open marks the start of the function body
functionName <- function(parX = defaultX, parY = defaultY, parZ = defaultZ) {
  # body of function goes here
  # lines of code and annos
  # may also call functions
  # may also create functions
  # may also create local variables
  return(z) # returns from the function a single element (z could be list)
} # close function

######################################################
# Function: HardyWeinberg
# Input: an alle frequency p (0,1)
# Output: p and the frequencies of the 3 genotypes AA, AB, BB
#--------------------------------------------------------
HardyWeinberg <- function(p = runif(1)) { # p = default.. wont use if user supply their own
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits = 3)
  return(vecOut)
}
# nothing happens when you just run it we just created the function now we can call it to use

# lets call it from memory
HardyWeinberg()
#     p     AA     AB     BB
# 0.2560 0.0656 0.3810 0.5530

pp <- 0.6 # # variable pp is stored in global enviroment
HardyWeinberg(p=pp)


# More complex ex
# added return statement

#############################################################
# Function: HardyWeinberg2
# Input: an allele frequency p (0,1)
# Output: p and the frequencies of the 3 genotypes AA, AB, BB
#--------------------------------------------------------
HardyWeinberg2 <- function(p = runif(1)) {
  if (p > 1.0 | p<0.0) {
    return("Function failure: p must be >= 0.0 and <= 1.0")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits = 3)
  return(vecOut)
}
#############################################################
HardyWeinberg2()
HardyWeinberg2(1.1) # ok, print error
z <- HardyWeinberg2(1.1) # no error message printed on screen rather saved to z
print(z)
# [1] "Function failure: p must be >= 0.0 and <= 1.0"


# lets fix that error on the error

#############################################################
# Function: HardyWeinberg3
# Input: an allele frequency p (0,1)
# Output: p and the frequencies of the 3 genotypes AA, AB, BB
#--------------------------------------------------------
HardyWeinberg3 <- function(p = runif(1)) {
  if (p > 1.0 | p<0.0) {
    stop("Function failure: p must be >= 0.0 and <= 1.0")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p, AA=fAA, AB=fAB, BB=fBB), digits = 3)
  return(vecOut)
}
#############################################################


######### FEB 13 ########
###########################

my_func <- function(a = 3, b = 4) {
  z <- a + b
  return(z)
}

my_func()


# second function
# it will load into memory but throw errors when run
my_func_bad <- function(a = 3) {
  z <- a + b
  return(z)
}

my_func_bad()
# Error in my_func_bad() : object 'b' not found

b <- 100 # add global variable for b and rerun

# third function
# better than the last
my_func_ok <- function(a = 3) {
  bb <- 100
  z <- a + bb
  return(z)
}

my_func_ok() # no more problems

print(bb) # bb only exists inside the function can not be called or used


# 4th function
#############################################################
# Function: fit_linear
# fits simple regression line
# Input: numeric vector of predictor (x) and response (y)
# Output: slope and p-value
#--------------------------------------------------------
fit_linear <- function(x = runif(20), y = runif(20)) {
 my_mod <- lm(y~x) # fit the model
 my_out <- c(slope = summary(my_mod)$coefficients[2,1],
             p_value = summary(my_mod)$coefficients[2,4])
 plot(x = x, y = y) # quick plot to check output
  return(my_out)
}
#############################################################
fit_linear()


# 5th function- similar but with more complexities
#############################################################
# Function: fit_linear
# fits simple regression line
# Input: numeric vector of predictor (x) and response (y)
# Output: slope and p-value
#--------------------------------------------------------
fit_linear2 <- function(p = NULL) {
  if(is.null(p)) {
    p <- list(x = runif(20), y = runif(20)) # if user provides input func will skip this
  }
  my_mod <- lm(p$y~p$x) # fit the model
  my_out <- c(slope = summary(my_mod)$coefficients[2,1],
              p_value = summary(my_mod)$coefficients[2,4])
  plot(x = p$x, y = p$y) # quick plot to check output
  return(my_out)
}
#############################################################
fit_linear2()

# add some perameters and rerun
# will now skip if statement
my_pars <- list(x = 1:10, y = sort(runif(10)))
fit_linear2(p = my_pars) # need to feed to function so it understands


# function 6
# using do.call to pass a list of perameters to function

z <- c(runif(99),NA)
mean(z) # mean doesnt work bc NA
mean(x = z, na.rm=TRUE) # change the default value for na.rm
mean(x = z, na.rm=TRUE, trim = 0.05)
l <- list(x = z, na.rm=TRUE, trim = 0.5) # bundle parameters as a list
do.call(mean, l) # use the do.call function with the function name and parameter list









