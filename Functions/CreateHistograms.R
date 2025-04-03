# --------------------------------------
# FUNCTION create_histograms
# required packages: none
# description:
# inputs:
# outputs:
########################################
create_histograms <- function(x=NULL,y=NULL){

# assign parameter defaults
if (is.null(x) | is.null(y)) {
  x <- runif(10)
  y <- runif(10)
}

# function body

  p1 <- ggplot(x, aes(x = abundance,)) +
    geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
    ggtitle("Histogram of Abundance")

  # richness histogram
  p2 <- ggplot(x, aes(x = richness)) +
    geom_histogram(binwidth = 1, fill = "lightgreen", color = "black") +
    ggtitle("Histogram of Species Richness")

  # save plots


  return("Histograms saved")


} # end of function create_histograms
# --------------------------------------
# create_histograms()
