# --------------------------------------
# FUNCTION clean_data
# required packages: none
# description: Cleaning the data for any empty/missing cases
# inputs:
# outputs:
########################################
clean_data <-function(x=NULL,y=NULL) {

  if (is.null(x)) {
    x <- data.frame(species = c("sparrow", NA, "robin"), bird_count = c(3, 2, NA))
  }

  # function body
  x <- na.omit(x)
  x <- x[x$bird_count > 0, ]

  return(x)

} # end of function clean_data
# --------------------------------------
# clean_data()
