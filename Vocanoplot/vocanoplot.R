# Load necessary libraries
library(ggplot2)
library(jpeg)
library(grid)
library(gridExtra)


# importdata (Vocanolplot.input) and convert to data frame
Vocanoplot <- data.frame(Vocanolplot.input)

# Add threshold column based on fold change and p-value criteria
Vocanoplot$threshold <- as.factor(abs(Vocanoplot$FC) > 1.5 & Vocanoplot$P.value < 0.05)

# Prepare data for plotting
df <- data.frame(log10p.value = -log10(Vocanoplot$P.value), FC = Vocanoplot$FC)

# Create volcano plot
GG <- ggplot(df, aes(x = FC, y = log10p.value, colour = Vocanoplot$threshold)) +
  geom_point(alpha = 0.4, size = 2) +
  theme(legend.position = "none") +
  xlab("Fold change") +
  ylab("-log10 p-value")

# Display plot
print(GG)

# Save the modified data to a file
write.table(Vocanoplot, "/..../output.txt", sep = "\t", row.names = FALSE)

# Export plot as a high-resolution image
jpeg(height = 2500, width = 2000, file = "/..../vocanoplot.jpeg", res = 500)
print(GG)
dev.off()


