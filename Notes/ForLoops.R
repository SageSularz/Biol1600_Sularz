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


## what NOT to do

# 1 dont make loops if you dont need to









