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
# z <- rnorm(n=3000,mean=0.2)
# z <- data.frame(1:3000,z)
# names(z) <- list("ID","myVar")
# z <- z[z$myVar>0,]
# str(z)
# summary(z$myVar)

# plot histogram
p1 <- ggplot(data=z, aes(x=myVar, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2)
print(p1)

# Add empirical density curve
p1 <-  p1 +  geom_density(linetype="dotted",size=0.75)
print(p1)

# Get maximum likelihood parameters for normal
normPars <- fitdistr(z$myVar,"normal")
print(normPars)
str(normPars)
normPars$estimate["mean"] # note structure of getting a named attribute

# Plot normal probability density
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



#################################
## Generate a new Gamma dataset
#################################

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
p1 <- ggplot(data=z, aes(x=myVar, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2)
print(p1)

# Plot gamma probability density
gammaPars <- fitdistr(z$myVar,"gamma")
shapeML <- gammaPars$estimate["shape"]
rateML <- gammaPars$estimate["rate"]

stat4 <- stat_function(aes(x = xval, y = ..y..), fun = dgamma, colour="brown", n = length(z$myVar), args = list(shape=shapeML, rate=rateML))
p1 + stat4

### Compare to orginal
z <- read.table("2024_insect_metabolism.csv",header=TRUE,sep=",")
str(z)
summary(z)

# plot histogram
p1 <- ggplot(data=z, aes(x=myVar, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2)
print(p1)

# Plot gamma probability density
gammaPars <- fitdistr(z$myVar,"gamma")
shapeML <- gammaPars$estimate["shape"]
rateML <- gammaPars$estimate["rate"]

stat4 <- stat_function(aes(x = xval, y = ..y..), fun = dgamma, colour="brown", n = length(z$myVar), args = list(shape=shapeML, rate=rateML))
p1 + stat4



#################################
## Combining Plots
#################################


library("magick")
img1 <- image_read("hmk8_newdata_plot8.jpeg")
img2 <- image_read("hmk8_mydata_plot8.jpeg")

img1 <- image_annotate(img1, "   Generated Gamma Dataset", size = 25, gravity = "southwest", color = "black")
img2 <- image_annotate(img2, "             My Original Dataset", size = 25, gravity = "southwest", color = "black")

# Combine side by side
combined <- image_append(c(img1, img2))

# Save the combined image
image_write(combined, path = "hmk8_combined_plot8.jpeg", format = "jpeg")


![](~/Desktop/Test/hmk8_combined_plot8.jpeg){width="70%"}
