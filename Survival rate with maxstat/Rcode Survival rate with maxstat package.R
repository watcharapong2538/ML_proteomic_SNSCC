library(maxstat)
library(survival)

# import survival dataset (Example dataset should be column time,status,expression)
#time = c(5, 8, 12, 7, 15, 10, 20, 6, 4, 11),
#status = c(1, 1, 0, 1, 0, 1, 1, 0, 1, 0),
#expression = c(2.3, 2.8, 1.6, 3.0, 1.8, 2.5, 3.5, 1.7, 2.2, 2.9)

data <- data.frame(raw_survival)
# Perform maxstat test
# You can use "exactGauss" or "HL" for different methods of p-value calculation
maxstat_result <- maxstat.test(
  Surv(time, status) ~ expression,
  data = data,
  smethod = "LogRank",
  pmethod = "HL"
)

# Display the result
print(maxstat_result)

# Extract the optimal cutoff
optimal_cutoff <- maxstat_result$estimate
print(paste("Optimal Cutoff:", optimal_cutoff))


# Create a new variable for the groups based on the cutoff
data$group <- ifelse(data$expression > optimal_cutoff, "High", "Low")

# Perform Kaplan-Meier survival analysis
surv_obj <- Surv(time = data$time, event = data$status)
fit <- survfit(surv_obj ~ data$group)

# Log-rank test
logrank_test <- survdiff(surv_obj ~ data$group)
p_value <- 1 - pchisq(logrank_test$chisq, df = 1)

print(paste("Log-rank test p-value:", p_value))

# Plot the survival curves
plot(fit, col = c("red", "blue"), lty = 1:2, xlab = "Time", ylab = "Survival Probability")
legend("topright", legend = c("High Expression", "Low Expression"), col = c("red", "blue"), lty = 1:1)

# Add the p-value and HR to the plot
title(main = paste("Optimal Cutoff:", optimal_cutoff, 
                   "\nP-value (Log-rank):", format.pval(p_value)))

