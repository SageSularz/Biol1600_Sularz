# SQL
# Feb 27 2025
# SMS

library(sqldf)

species_clean <- read.csv("site_by_species.csv")

var_clean <- read.csv("site_by_variables.csv")

head(species_clean)
head(var_clean)

# Start with operations and functions on just one file

# how to subset rows
# dplyr method using filter()
species <- filter(species_clean, Site<30)
var <- filter(var_clean, Site<30)

# SQL method for subsetting rows
query = "SELECT Site, Sp1, Sp2, Sp3 FROM species WHERE Site<'30' "

sqldf(query)


# Method for subsetting columns
# dplyr
edit_species <- species %>%
  select(Site, Sp1, Sp2, Sp3)
# or
edit_species2 <- species %>%
  select(1, 2, 3, 4)

# SQL
# querying the entire table
query = "SELECT * FROM species"
a <- sqldf(query)

# renaming columns
# in dplyr just rename() func
species <- rename(species, Long=longitude.x., Lat=Latitude.y.) ### doesnt work!!

# pull out all numeric columns
num_species <- species %>%
  mutate(letters=rep(letters, length.out=length(species$Site)))


# Pivot longer will lengthen the data, decrease the number of columns and increse number of rows
# can also use gather() but its outdated

species_long <- pivot_longer(edit_species, cols = c(Sp1, Sp2, Sp3), names_to = "ID")
species_wide <- pivot_wider(species_long, names_from = ID)

# aggregating the data, getting some kind of calculation

# SQL method:
query = "SELECT SUM(Sp1+Sp2+Sp3) FROM species_wide GROUP BY SITE"
sqldf(query)

query = "SELECT SUM(Sp1+Sp2+Sp3) AS Occurence FROM species_wide GROUP BY SITE"
sqldf(query)

#query = "ALTER TABLE species_wide ADD new_column VARCHAR"
#sqldf(query)


# 2 file operations
# joining data sets together
# left/right/union joins

# first start with clean files. rest the species var variables and then filter them to managable size

edit_species <- species_clean %>%
  filter(Site<30) %>%
  select(Site, Sp1, Sp2, Sp3, Sp4, Longitude.x., Latitude.y.)

edit_var <- var_clean %>%
  filter(Site<30) %>%
  select(Site, Longitude.x., Latitude.y., BIO1_Annual_mean_temperature, BIO12_Annual_precipitation)

# left join left: stiching the matching rows of file B to file A
# requires a matching/marker column to link the two datasets
left <- left_join(edit_species, edit_var, by="Site")

right <- right_join(edit_species, edit_var, by="Site")

# inner joins: retains the rows that match between both files A and B
# loses a lot of info if not matched well
inner <- inner_join(edit_species, edit_var, by="Site")

# Full join: opp of inner join, retains all the values. all rows-ends with a tradeoff where you get a bunch of NAs when there is missing data
full <- full_join(edit_species, edit_var, by="Site")


# SQL method for joining data
query="SELECT BIO1_Annual_mean_temperature, BIO12_Annual_precipitation from edit_var LEFT JOIN edit_species ON edit_var.Site = edit_species.Site"
sqldf(query)












