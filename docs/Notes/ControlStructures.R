# Control Structures
# Feb 13 2025
# SMS

# run each to get a boolean response
# simple inqualities
5 > 3
5 < 3
5 >= 5
5 <= 5
5 == 3
5 != 3

FALSE & FALSE
FALSE & TRUE
TRUE & TRUE

5 > 3 & 1 != 2
1 == 2 & 1 !=2

# use | for "or"
FALSE | FALSE
FALSE | TRUE
TRUE | TRUE
1 == 2 | 1 != 2

1:5 > 3 # looks at each number (1, 2, 3, 4, 5) and eval if greater than 3

# how will the order of nums effect
a <- 1:10
b <- 10:1
a > 4 & b < 4

# xor
xor(FALSE, FALSE)
xor(FALSE, TRUE)
xor(TRUE, TRUE)
a <- c(0, 0, 1)
b <- c(0, 1, 1)
xor(a, b)
a | b


# boolean algrabra on sets of atomic vectors
a <- 1:7
b <- 5:10

# union to get all the elements present
union(a, b)
# vs
c(a, b)
# union scans for repeats and culls duplicates
unique(c(a, b)) # acts like union

# intersect to get common elements
intersect(a, b)

# setdiff to get distinct elements in a (or b)
setdiff(a, b)
setdiff(b, a) # swap order

# setequal to check for identical elements
setequal(a, b)

z <- matrix(1:12, nrow = 4, byrow = TRUE)
z1 <- matrix(1:12, nrow = 4, byrow = FALSE)

# this just compares element by element
z==z1

# use identical for entire structures
identical(z, z1)
z1 <- z
identical(z,z1)

# %in%
d <- 12
d %in% union(a, b)

is.element(d, union(a, b))

d <- c(10, 12)
d %in% union(a, b)
d %in% a

## if statement ##

# 3 ways to use
{
if (condition) {expression1}

if (condition) {expression1} else {expression2}

if (condition1) {expression1} else
  if (condition2) {expression2} else
}


## Feb 18 ##

z <- signif(runif(1), digits = 2)
print(z)
z > 0.5
if (z > 0.5) cat(z, "is a bigger than average number","\n")


if (z > 0.8) {cat(z,"is a large number","\n")} else
  if (z < 0.2) {cat(z,"is a small number","\n")} else # second boolean print text if true
  {cat(z,"is a number of typical size","\n") # if neither condition is met
    cat("z^2 =",z^2,"\n")} # block of code
# like a fork with exactly 3 branches and we have to take one, there will always be output

z <- 1:10 # now have a vector

if (z > 7) print(z) # throws error due to changes in R syntax

# use subsetting
print(z[z < 7])

## ifelse to fill vectors ##

# Suppose we have an insect population in which each female lays, on average, 10.2 eggs,
# following a Poisson distribution with 𝜆=10.2. However, there is a 35% chance of parasitism,
# in which case no eggs are laid. Here is the distribution of eggs laid for 1000 individuals:

tester <- runif(1000) # start with random uniform elements
eggs <- ifelse(tester>0.35,rpois(n=1000,lambda=10.2),0) # tester looking fro true vals, 0.35 bc 35%
hist(eggs)
# first part looks like pois distribution
# the tall zero bar is both those who got parasite and those who just didnt happen to lay eggs
# " inflated zero value"

# play with lambda to ajust distribution


# Suppose we have a vector of p values (say from a simulation), and we want to
#create a vector to highlight the significant ones for plotting purposes.
pVals <- runif(1000)
z <- ifelse(pVals<=0.025,"lowerTail","nonSig") # is p val less than 0.025.. give dependent label
z[pVals>=0.975] <- "upperTail" # add in another label
table(z) # great way to find errors in set

# alt method (just preference)
z1 <- rep("nonSig",length(pVals)) # all elements are nonSig
z1[pVals<=0.025] <- "lowerTail" # now add upper and lower labels
z1[pVals>=0.975] <- "upperTail"
table(z1)



















