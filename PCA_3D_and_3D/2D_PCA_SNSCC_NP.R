# Import necessary libraries
library(ggplot2)
library(ggfortify)
library(jpeg)
library(grid)
library(gridExtra)

# Import data from each group (GI,NP,SNSCC,Group file)
GI <- read.table("/.../GI.txt", sep = "\t", quote = "", stringsAsFactors = FALSE, header = TRUE)
NP <- read.table("/.../NP.txt", sep = "\t", quote = "", stringsAsFactors = FALSE, header = TRUE)
SNSCC <- read.table("/.../SNSCC.txt", sep = "\t", quote = "", stringsAsFactors = FALSE, header = TRUE)
Group <- read.table("/.../Group.txt", sep = "\t", quote = "", stringsAsFactors = FALSE, header = TRUE)

# Combine data for PCA analysis
PCA_data <- cbind(NP, SNSCC)

# Transpose data
PCA_transposed <- t(PCA_data)

# Convert to data frame and add column names and group information
PCA_df <- as.data.frame(PCA_transposed)
colnames(PCA_df) <- GI[, 1]
PCA_df$Groups <- Group[, 1]

# Run PCA and plot
pca_results <- prcomp(PCA_df[, -ncol(PCA_df)], scale. = TRUE)

# Plot PCA results
pca_plot1 <- autoplot(pca_results, data = PCA_df, frame = TRUE, colour = "Groups",
                      main = 'PCA_2D_NP_vs_NSCC')
pca_plot2 <- autoplot(pca_results, data = PCA_df, frame = TRUE, colour = 'Groups',
                      frame.type = 'norm', main = 'PCA_2D_NP_vs_NSCC')

# Display plots
print(pca_plot1)
print(pca_plot2)

# Export image with high resolution
output_file <- "/Users/watchara.p/Desktop/PCA_NP_vs_NSCC.jpeg"
jpeg(height = 3200, width = 3900, file = output_file, res = 500)
grid.arrange(pca_plot2, ncol = 1, nrow = 1)
dev.off()
