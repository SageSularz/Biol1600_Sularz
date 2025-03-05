# Homework 7
# Data manipulations using the dplyr package
# Feb 26 2025
# SMS

library(tidyverse)
library(dplyr)

data("iris")

# 1
str(iris) # 'data.frame':	150 obs. of  5 variables:
head(iris)

# 2
iris1 <- filter(iris, Species == "virginica" | Species ==  "versicolor", Sepal.Length > 6, Sepal.Width > 2.5)
str(iris1) #'data.frame':	56 obs. of  5 variables:

# 3
iris2 <- select(iris1, Species, Sepal.Length, Sepal.Width)
str(iris2)  # 'data.frame':	56 obs. of  3 variables:

# 4
iris3 <- arrange(iris2, by = desc(Sepal.Length))
head(iris3, n = 6)

# 5
iris4 <- mutate(iris3, Sepal.Area = Sepal.Length * Sepal.Width)
str(iris4) # 'data.frame':	56 obs. of  4 variables:

# 6
iris5 <- iris4 %>%
  summarize(
    avg_sepal_length = mean(Sepal.Length),
    avg_sepal_width = mean(Sepal.Width),
    sample_size = n()
  )

print(iris5)

# 7
iris6 <- iris4 %>%
  group_by(Species) %>%
  summarize(
    avg_sepal_length = mean(Sepal.Length),
    avg_sepal_width = mean(Sepal.Width),
    sample_size = n()
  )

print(iris6)

# 8
irisFinal <- iris %>%
  filter(Species %in% c("virginica", "versicolor"), Sepal.Length > 6, Sepal.Width > 2.5) %>%
  select(Species, Sepal.Length, Sepal.Width) %>%
  arrange(desc(Sepal.Length)) %>%
  mutate(Sepal.Area = Sepal.Length * Sepal.Width) %>%
  group_by(Species) %>%
  summarize(
    avg_sepal_length = mean(Sepal.Length),
    avg_sepal_width = mean(Sepal.Width),
    sample_size = n()
  )

print(irisFinal)

# 9
iris_long <- iris %>%
  pivot_longer(
    cols = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
    names_to = "Measure",
    values_to = "Value"
  ) %>%
  select(Species, Measure, Value)

head(iris_long)






