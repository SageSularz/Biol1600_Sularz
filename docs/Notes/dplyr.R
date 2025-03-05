# Feb 26 2025
# dplyr
# SMS

# start with built in dataset
library(tidyverse)

data("starwars")
class(starwars)
# [1] "tbl_df"     "tbl"        "data.frame"
# tbl = tibble
# in general tibble do "less" as a tradeoff to make code simpler and less prone to crashing

glimpse(starwars) # 87r 14c mixed data types
# glimpse similar to str() or head()

# cleaning up the data set
# base R > complete.cases() to remove rows with NA
starwarsClean <- starwars[complete.cases(starwars[,1:10]),]

# you can manually check for NA
is.na(starwarsClean[,1])

anyNA(starwarsClean[,1:10])


# filter() function
filter(starwarsClean, gender == "masculine" & height < 180)

filter(starwars, gender == "masculine" & height < 180 & height >100 )

filter(starwars, eye_color %in% c("blue", "brown"))


# arrange()
arrange(starwarsClean, by = height) # defaults to acending order

arrange(starwarsClean, by = desc(height)) # put into decending order

arrange(starwarsClean, height, desc(mass)) # any additional columns will break ties in preceeding column

starwars1 <- arrange(starwars, height)
tail(starwars1)

#select()

# can do in base R
starwarsClean[1:10,]

# or
select(starwarsClean, 1:10)
select(starwarsClean, name:species)
select(starwarsClean, -(films:starships)) # subset everything execpt specific variables

#rearagnge columns
select(starwarsClean, homeworld, name, gender, species, everything())

select(starwarsClean, contains("color"))
# also helpful for this include: ends_with, starts_with, matches(reg ex), num_range

# rename columns
select(starwars, haircolor=hair_color)
rename(starwarsClean, haircolor=hair_color)


# Mutate()

#create column that's height divided by mass
mutate(starwarsClean, ratio = height / mass)

starwars_lbs <- mutate(starwarsClean, mass_lbs=mass * 2.2)

select(starwars_lbs, 1:3, mass_lbs, everything())

# if you only want the new variable
transmute(starwarsClean, mass_lbs=mass * 2.2)

transmute(starwarsClean, mass, mass_lbs=mass * 2.2)


# summarize() and group_by()
summarize(starwarsClean, meanHeight = mean(height))

summarize(starwars, meanHeight = mean(height)) # does not work right if data isnt clean

summarize(starwars, meanHeight = mean(height, na.rm = TRUE), TotalNumber = n())

# group_by()
starwarsGender <- group_by(starwars, gender)

summarize(starwarsGender, meanHeight = mean(height, na.rm = TRUE), number = n())


# pipe statments
starwarsClean %>%
  group_by(gender) %>%
  summarize(meanHeight = mean(height, na.rm = T), number = n())

# case_when() is useful for multiple conditional ifelse statments
starwarsClean %>%
  mutate(sp = case_when(species == "Human" ~ "Human", TRUE ~ "Non-human")) %>%
  select(name, sp, everything())

# long to wide format and vice-versa
glimpse(starwarsClean)

# make dataset wider
wideSW <- starwarsClean %>%
  select(name, sex, height) %>%
  pivot_wider(names_from = sex, values_from = height, values_fill = NA)
wideSW

pivotSW <- starwars %>%
  select(name, homeworld) %>%
  group_by(homeworld) %>%
  mutate(rn = row_number()) %>%
  ungroup() %>%
  pivot_wider(names_from = homeworld, values_from = name, values_fill = NA)
pivotSW

# make dataset longer
glimpse(wideSW)
wideSW %>%
  pivot_longer(cols = male:female, names_to = "sex", values_to = "height", values_drop_na = T)














