# Import necessary libraries
library(ggplot2)
library(ggfortify)
library(plotly)

# Import data from each group
GI <- read.table(GI, sep = "\t", quote = "", stringsAsFactors = FALSE, header = TRUE)
NP <- read.table(NP, sep = "\t", quote = "", stringsAsFactors = FALSE, header = TRUE)
SNSCC <- read.table(SNSCC, sep = "\t", quote = "", stringsAsFactors = FALSE, header = TRUE)
Group <- read.table(Group, sep = "\t", quote = "", stringsAsFactors = FALSE, header = TRUE)

# Combine data for PCA analysis
PCA_data <- cbind(NP, SNSCC)

# Transpose data
PCA_transposed <- t(PCA_data)

# Convert to data frame and add column names and group information
PCA_df <- as.data.frame(PCA_transposed)
colnames(PCA_df) <- GI[, 1]
PCA_df$Groups <- Group[, 1]

# Run PCA
pca_results <- prcomp(PCA_df[, -ncol(PCA_df)], scale. = TRUE)

# Extract PCA components for 3D plotting
pca_data <- as.data.frame(pca_results$x)
pca_data$Groups <- PCA_df$Groups

# Plot 3D PCA using plotly
fig <- plot_ly(pca_data, x = ~PC1, y = ~PC2, z = ~PC3, color = ~Groups, colors = "Set1",
               type = 'scatter3d', mode = 'markers',
               marker = list(size = 5, symbol = 'circle', opacity = 0.6)) %>%
  layout(title = '3D PCA',
         scene = list(xaxis = list(title = 'PC1'),
                      yaxis = list(title = 'PC2'),
                      zaxis = list(title = 'PC3'),
         annotations = list(
                       list(x = mean(pca_data$PC1[pca_data$Groups == "NP"]),
                             y = mean(pca_data$PC2[pca_data$Groups == "NP"]),
                             z = mean(pca_data$PC3[pca_data$Groups == "NP"]),
                             text = 'NP',
                             showarrow = TRUE,
                             ax = 0, ay = 0),
                       list(x = mean(pca_data$PC1[pca_data$Groups == "SNSCC"]),
                             y = mean(pca_data$PC2[pca_data$Groups == "SNSCC"]),
                             z = mean(pca_data$PC3[pca_data$Groups == "SNSCC"]),
                             text = 'SNSCC',
                             showarrow = TRUE,
                             ax = 0, ay = 0)
                      )))
                      
                  

# Display the plot
fig
