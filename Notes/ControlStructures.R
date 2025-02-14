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

if (condition) {expression1}

if (condition) {expression1} else {expression2}

if (condition1) {expression1} else
  if (condition2) {expression2} else










