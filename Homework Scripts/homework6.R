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
  geom_boxplot()

# Analyze (anova)
nicAOV <- summary(aov(height ~ nic_dose, data = nic_data))
print(nicAOV)
dim(nicAOV)
nicAOV[1,5]

# For
for (i in c(2, 10, 20, 50, 100)) {
  cat("Sample size =", i, "\n")
  nic_dose <- rep(c("ctrl", "0.1", "0.5", "1.0"), each = i)
  means <- rep(c(3.03, 1.20, 0.86, 0.6), each = i)
  height <- rnorm(length(nic_dose), mean = means, sd = 0.4)
  nic_data <- data.frame(nic_dose,height)
  nicAOV <- aov(height ~ nic_dose, data = nic_data)
  print(summary(nicAOV))
}



for (i in c(0.5, 1.5, 2.5)) {
  sampleS <- floor(runif(1, min = 5, max = 20))
  nic_dose <- rep(c("ctrl", "0.1", "0.5", "1.0"), each = sampleS)
  means <- rep(c(3.03, 1.20, 0.86, 0.6), each = sampleS)
  height <- rnorm(length(nic_dose), mean = means, sd = 0.4*i)
  nic_data <- data.frame(nic_dose,height)
  cat("The SD is", 0.4*i, "\n")
  nicAOV <- aov(height ~ nic_dose, data = nic_data)
  print(summary(nicAOV))
}











