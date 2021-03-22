# Dairon Andrés Benites Aldaz
# Polytechnic University of Valencia

# Quantile-Quantile Plots

library(tidyverse)
library(dslabs)
data(heights)
index <- heights$sex == "Male"
x <- heights$height[index]
z <- scale(x)

# Proportion data below 69.5

mean(x <= 69.5)

# Calculate observed and theoreical quantiles
p <- seq(0.05, 0.95, 0.05)
observed_quantiles <- quantile(x, p)
theoretical_quantiles <- qnorm(p, mean = mean(x), sd = sd(x))

plot(observed_quantiles, theoretical_quantiles, main = "Plot I: Quantiles", xlab = "Observed", ylab = "Theoretical")
abline(0, 1)

# Make QQ-plot with scaled values

observed_quantiles <- quantile(z, p)
theoretical_quantiles <- qnorm(p)
plot(theoretical_quantiles, observed_quantiles, xlab = "Theoretical Quantiles", ylab = "Observed Quantiles")
abline(0,1)
