# Homework 9
# Mar 26 2025
# SMS

## Pull count data from folders
library(devtools)
library(upscaler)


folders <- list.files(path = "~/Desktop/NEON_count-landbird", pattern = "-2025", full.names = FALSE)

countdata_list <- list()

for (i in folders) {
  files <- list.files(
    path = file.path("~/Desktop/NEON_count-landbird", i),
    pattern = "countdata",
    full.names = TRUE
  )
  for (j in files) {
    count_data <- read.csv(j)
    countdata_list[[j]] <- count_data
  }
}

## Outline functions

# 1) Cleaning the data for any empty/missing cases
# 2) Extract the year from each file name
# 3) Calculate Abundance for each year (Total number of individuals found)
# 4) Calculate Species Richness for each year(Number of unique species found)
# 5) Run a simple regression model for Species Richness (S) vs. Abundance for every year
# 6) Generate histograms for both Abundance and Species Richness (S) and store the plots

build_function(c("clean_data",
                 "extract_year",
                 "calculate_abundance",
                 "calculate_richness",
                 "regression_model",
                 "create_histograms"))












