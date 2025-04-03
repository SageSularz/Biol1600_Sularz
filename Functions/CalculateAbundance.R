# --------------------------------------
# FUNCTION calculate_abundance
# required packages: none
# description:
# inputs:
# outputs:
########################################
calculate_abundance <- function(x=NULL,y=NULL){

  if (is.null(x)) {
    x <- data.frame(bird_count = c(1, 2, 3, 4))
  }

  # function body
  total <- sum(x$bird_count, na.rm = TRUE)

  return(total)
} # end of function calculate_abundance
# --------------------------------------
# calculate_abundance()
