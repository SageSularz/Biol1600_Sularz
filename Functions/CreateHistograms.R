# --------------------------------------
# FUNCTION create_histograms
# required packages: none
# description:
# inputs:
# outputs:
########################################
create_histograms <- function(data){

# assign parameter defaults

# function body

  # abundace
    ggplot(data, aes(x = abundance)) +
    geom_histogram(binwidth = 50, fill = "steelblue", color = "black") +
    labs(
      title = paste("Bird Abundance from", data[1, 4], "through", data[10, 4]),
      x = "Abundance",
      y = "Frequency" ) +
    theme_bw()

  ggsave("abundance_histogram_HMK9.png")

    ggplot(data, aes(x = richness)) +
    geom_histogram(binwidth = 50, fill = "steelblue", color = "black") +
    labs(
      title = "Histogram of Bird Richness Across All Years",
      x = "Richness",
      y = "Frequency"
    ) +
    theme_minimal()

  ggsave("richness_histogram_HMK9.png")

  return("Histograms saved")


} # end of function create_histograms
# --------------------------------------
# create_histograms()
