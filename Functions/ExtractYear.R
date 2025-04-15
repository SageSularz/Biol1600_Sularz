# --------------------------------------
# FUNCTION extract_year
# required packages: none
# description:
# inputs:
# outputs:
########################################
extract_year <- function(x=NULL){

# assign parameter defaults
  #if (is.null(x)) {
  #  x <- data.frame(species = c("sparrow", NA, "robin"), bird_count = c(3, 2, NA))
 # }

# function body
  for (filename in names(countdata_list)) {
    year_string <- grep("[\d{4}]")
    year <- as.numeric(year_string)
  }

return(print(year))

} # end of function extract_year
# --------------------------------------
# extract_year()
