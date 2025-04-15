# Homework 9
# Mar 26 2025
# SMS

## Pull count data from folders
library(devtools)
library(upscaler)

stats <- data.frame(
  filename = character(),
  abundance = numeric(),
  richness = numeric(),
  year = numeric(),
  stringsAsFactors = FALSE
)

folders <- list.files(path = "~/Desktop/NEON_count-landbird", pattern = "-2025", full.names = FALSE)

countdata_list <- list()

for (i in folders) {
  files <- list.files(
    path = file.path("~/Desktop/NEON_count-landbird", i),
    pattern = "countdata",
    full.names = TRUE
  )
  print(files)

  for (j in files) {
    count_data <- read.csv(j)
    countdata_list[[j]] <- count_data

    # Extract the filename
    file_name <- basename(j)

    # Extract year from filename
    year_match <- regmatches(file_name, regexpr("20[0-9]{2}", file_name))
    year <- as.numeric(year_match)

    # Clean
    na.omit(j)

    # Calculate abundance and richness
    abundance <- sum(count_data$clusterSize, na.rm = TRUE)
    richness <- length(unique(count_data$scientificName))

    # Add row to stats data frame
    stats <- rbind(stats, data.frame(
      filename = file_name,
      abundance = abundance,
      richness = richness,
      year = year,
      stringsAsFactors = FALSE
    ))
  }
}
files
head(count_data)

# regres model

# make empty data frame
regression_summary <- data.frame(
  year = numeric(),
  coef_abundance = numeric(),
  intercept = numeric(),
  r_squared = numeric(),
  p_value_abundance = numeric(),
  stringsAsFactors = FALSE
)

# loop each row through the function
regression_summary <- regression_model(stats)
print(regression_summary)


# create histos
create_histograms(stats)


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


#Create an initial empty data frame to hold the above summary statistics-you should have columns for the file name, one for abundance, one for species richness, and one for year. You should also have a separate dataframe with only the regression model summary statistics.




