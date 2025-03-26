# Homework 6
# Creating Fake Data Sets To Explore Hypotheses
# Feb 19 2025
# SMS

# Create dataset
set.seed(321)
sampleS <- floor(runif(1, min = 5, max = 20))
nic_dose <- rep(c("ctrl", "0.1", "0.5", "1.0"), each = sampleS)
means <- rep(c(3.03, 1.20, 0.86, 0.6), each = sampleS)
height <- rnorm(length(nic_dose), mean = means, sd = 0.4)

nic_data <- data.frame(nic_dose,height)
print(nic_data)

# Quick plot
library(ggplot2)
ggplot(data = nic_data, aes(x = nic_dose, y = height)) +
  geom_boxplot(fill = "#303E4E", color = "black") +
  labs(title = "Pupation Height Across Nicotine Treatments", x = "Nicotine Dose (μg/mL)", y = "Pupation Height (cm)") +
  theme_minimal()

# ANOVA analysis
nicAOV <- aov(height ~ nic_dose, data = nic_data)
nic_summary <- summary(nicAOV)
print(nic_summary)

# Extract and print p-value
p_value <- nic_summary[[1]][["Pr(>F)"]][1]
cat("ANOVA p-value:", p_value, "\n")


# For loop takes given sample sizes (i)
# recreates dataset based on i and outputs p value and boxplot
sample_sizes <- c(2, 10, 20, 50, 100)

for (i in sample_sizes) {
  cat("Sample size =", i, "\n")

  # Generate data
  nic_dose <- rep(c("ctrl", "0.1", "0.5", "1.0"), each = i)
  means <- rep(c(3.03, 1.20, 0.86, 0.6), each = i)
  height <- rnorm(length(nic_dose), mean = means, sd = 0.4)
  nic_data <- data.frame(nic_dose, height)

  # Run ANOVA and extract p-value
  nicAOV <- aov(height ~ nic_dose, data = nic_data)
  p_value <- summary(nicAOV)[[1]][["Pr(>F)"]][1]

  # Print the p-value
  cat("P-value:", p_value, "\n\n")

  # Generate and print the boxplot
  box_plot <- ggplot(nic_data, aes(x = nic_dose, y = height, fill = nic_dose)) +
    geom_boxplot(outlier.shape = NA) +
    theme_minimal() +
    theme(legend.position = "none",
          axis.title.x = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks.x = element_blank(),
          plot.margin = margin(2, 2, 2, 2)) +
    ggtitle(paste("n =", i))
  ggsave(paste0("hmk6n", i,".jpeg"), width = 3, height = 3, units = "cm")

  print(box_plot)
}



# For loop takes given mulipliers (i) and assesses the effect on SD
# recreates dataset based on i and outputs p value and boxplot
multiplier <- c(0.5, 1.5, 2.5)

for (i in multiplier) {
  cat("Standard Diviation =", 0.4*i, "\n")

  # Generate data
  nic_dose <- rep(c("ctrl", "0.1", "0.5", "1.0"), each = sampleS)
  means <- rep(c(3.03, 1.20, 0.86, 0.6), each = sampleS)
  height <- rnorm(length(nic_dose), mean = means, sd = 0.4*i)
  nic_data <- data.frame(nic_dose, height)

  # Run ANOVA and extract p-value
  nicAOV <- aov(height ~ nic_dose, data = nic_data)
  p_value <- summary(nicAOV)[[1]][["Pr(>F)"]][1]

  # Print the p-value
  cat("P-value:", p_value, "\n\n")

  # Generate and print the boxplot
  box_plot <- ggplot(nic_data, aes(x = nic_dose, y = height, fill = nic_dose)) +
    geom_boxplot(outlier.shape = NA) +
    theme_minimal() +
    theme(legend.position = "none",
          axis.title.x = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks.x = element_blank(),
          plot.margin = margin(2, 2, 2, 2)) +
    ggtitle(paste("SD =", 0.4*i))

  print(box_plot)
}






