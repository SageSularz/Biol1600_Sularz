## Homework 8
## Simulating and Fitting Data Distributions
## 03-19-25
## SMS

# 2024_insect_metabolism

z <- read.table("2024_insect_metabolism.csv",header=TRUE,sep=",")
str(z)
summary(z)

# check out of the library
library(ggplot2) # for graphics
library(MASS) # for maximum likelihood estimation

# generate fake data
# quick and dirty, a truncated normal distribution to work on the solution set
### z <- rnorm(n=3000,mean=0.2)
### z <- data.frame(1:3000,z)
### names(z) <- list("ID","myVar")
### z <- z[z$myVar>0,]
### str(z)
### summary(z$myVar)

# max likelihood perams for gamma distr
gamPars <- fitdistr(z$myVar,"gamma")
print(gamPars)
str(gamPars)
gamPars$estimate["shape"]
## Create new data set based on maximum likelihood perameters
z <- rgamma(n=42,shape=1.8992323,rate=1.0003482)
z <- data.frame(1:42,z)
names(z) <- list("ID","myVar")
z <- z[z$myVar>0,]
str(z)
summary(z$myVar)

# plot histogram
# Here we are switching from qplot to ggplot for more graphics options. We are also rescaling the y axis of the histogram from counts to density, so that the area under the histogram equals 1.0.
p1 <- ggplot(data=z, aes(x=myVar, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2)
print(p1)

# Add empirical density curve
# Now modify the code to add in a kernel density plot of the data. This is an empirical curve that is fitted to the data. It does not assume any particular probability distribution, but it smooths out the shape of the histogram
p1 <-  p1 +  geom_density(linetype="dotted",size=0.75)
print(p1)

# Get maximum likelihood parameters for normal
# fit a normal distribution to your data and grab the maximum likelihood estimators of the two parameters of the normal, the mean and the variance
normPars <- fitdistr(z$myVar,"normal")
print(normPars)
str(normPars)
normPars$estimate["mean"] # note structure of getting a named attribute

# Plot normal probability density
# call the dnorm function inside ggplot’s stat_function to generate the probability density for the normal distribution. Read about stat_function in the help system to see how you can use this to add a smooth function to any ggplot. Note that we first get the maximum likelihood parameters for a normal distribution fitted to thse data by calling fitdistr. Then we pass those parameters (meanML and sdML to stat_function):
meanML <- normPars$estimate["mean"]
sdML <- normPars$estimate["sd"]

xval <- seq(0,max(z$myVar),len=length(z$myVar))

stat <- stat_function(aes(x = xval, y = ..y..), fun = dnorm, colour="red", n = length(z$myVar), args = list(mean = meanML, sd = sdML))
p1 + stat


# Plot exponential probability density
expoPars <- fitdistr(z$myVar,"exponential")
rateML <- expoPars$estimate["rate"]

stat2 <- stat_function(aes(x = xval, y = ..y..), fun = dexp, colour="blue", n = length(z$myVar), args = list(rate=rateML))
p1 + stat + stat2

# Plot uniform probability density
stat3 <- stat_function(aes(x = xval, y = ..y..), fun = dunif, colour="darkgreen", n = length(z$myVar), args = list(min=min(z$myVar), max=max(z$myVar)))
p1 + stat + stat2 + stat3

# Plot gamma probability density
gammaPars <- fitdistr(z$myVar,"gamma")
shapeML <- gammaPars$estimate["shape"]
rateML <- gammaPars$estimate["rate"]

stat4 <- stat_function(aes(x = xval, y = ..y..), fun = dgamma, colour="brown", n = length(z$myVar), args = list(shape=shapeML, rate=rateML))
p1 + stat + stat2 + stat3 + stat4

# Plot beta probability density
pSpecial <- ggplot(data=z, aes(x=myVar/(max(myVar + 0.1)), y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2) +
  xlim(c(0,1)) +
  geom_density(size=0.75,linetype="dotted")

betaPars <- fitdistr(x=z$myVar/max(z$myVar + 0.1),start=list(shape1=1,shape2=2),"beta")
shape1ML <- betaPars$estimate["shape1"]
shape2ML <- betaPars$estimate["shape2"]

statSpecial <- stat_function(aes(x = xval, y = ..y..), fun = dbeta, colour="orchid", n = length(z$myVar), args = list(shape1=shape1ML,shape2=shape2ML))
pSpecial + statSpecial













