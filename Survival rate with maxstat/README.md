This methodology provides a rigorous framework for performing survival analysis using the maxstat test and Kaplan-Meier method, ensuring that the results are statistically robust and visually interpretable.

    Data Preparation
        The survival dataset, which includes the columns time, status, and expression, was imported into the R environment. An example of the dataset structure is as follows:
        time = c(5, 8, 12, 7, 15, 10, 20, 6, 4, 11)
        status = c(1, 1, 0, 1, 0, 1, 1, 0, 1, 0)
        expression = c(2.3, 2.8, 1.6, 3.0, 1.8, 2.5, 3.5, 1.7, 2.2, 2.9)
    data <- data.frame(time, status, expression)

    Maximal Chi-Square Method
        To determine the optimal cutoff value for the expression variable, the maximal chi-square (maxstat) test was performed using the maxstat.test function. The test employed the Log-Rank method (smethod = "LogRank") for survival analysis and the "HL" method for p-value calculation (pmethod = "HL").

    Determination of Optimal Cutoff
        The optimal cutoff value for the expression variable was extracted from the maxstat test results.
    optimal_cutoff <- maxstat_result$estimate
    print(paste("Optimal Cutoff:", optimal_cutoff))

    Group Classification
        Based on the optimal cutoff value, a new variable group was created to classify the data into "High" and "Low" expression groups.
    data$group <- ifelse(data$expression > optimal_cutoff, "High", "Low")


    Kaplan-Meier Survival Analysis
        Kaplan-Meier survival analysis was performed using the survfit function to estimate the survival curves for the "High" and "Low" expression groups.
    surv_obj <- Surv(time = data$time, event = data$status) 
    fit <- survfit(surv_obj ~ data$group)

    Log-Rank Test
        A log-rank test was conducted to compare the survival distributions between the "High" and "Low" expression groups. The p-value of the log-rank test was calculated to assess the statistical significance of the difference.
    logrank_test <- survdiff(surv_obj ~ data$group) 
    p_value <- 1 - pchisq(logrank_test$chisq, df = 1) 
    print(paste("Log-rank test p-value:", p_value))


    Visualization of Survival Curves
        The survival curves for the "High" and "Low" expression groups were plotted using the plot function. The plot included a legend, the optimal cutoff value, and the p-value from the log-rank test.
    plot(fit, col = c("red", "blue"), lty = 1:2, xlab = "Time", ylab = "Survival Probability") legend("topright", legend = c("High Expression", "Low Expression"), col = c("red", "blue"), lty = 1:1) title(main = paste("Optimal Cutoff:", optimal_cutoff, "\nP-value (Log-rank):", format.pval(p_value)))
