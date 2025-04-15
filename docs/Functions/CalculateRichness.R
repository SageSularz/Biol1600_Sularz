# --------------------------------------
# FUNCTION calculate_richness
# required packages: none
# description:
# inputs:
# outputs:
########################################
calculate_richness <- function(x=NULL,y=NULL){

  if (is.null(x)) {
    x <- data.frame(species = c("sparrow", "robin", "sparrow", "finch"))
  }

  # function body
  richness <- length(unique(x$species))

  return(richness)
} # end of function calculate_richness
# --------------------------------------
# calculate_richness()
