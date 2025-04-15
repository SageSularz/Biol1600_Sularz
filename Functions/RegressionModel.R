# --------------------------------------
# FUNCTION regression_model
# required packages: none
# description:
# inputs:
# outputs:
########################################
regression_model <- function(data){
  model <- lm(richness ~ abundance, data = data)
  model_summary <- summary(model)

  intercept <- coef(model)["(Intercept)"]
  coef_abundance <- coef(model)["abundance"]
  r_squared <- model_summary$r.squared
  p_value_abundance <- coef(model_summary)["abundance", "Pr(>|t|)"]
  n_obs <- nrow(data)

  return(data.frame(
    coef_abundance = coef_abundance,
    intercept = intercept,
    r_squared = r_squared,
    p_value_abundance = p_value_abundance,
    n_obs = n_obs,
    stringsAsFactors = FALSE
  ))

} # end of function regression_model
# --------------------------------------
# regression_model()
