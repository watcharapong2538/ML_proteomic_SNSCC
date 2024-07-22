Methodology

Data Acquisition:  
	Proteomic data for this study were obtained from SNSCC and NP patients. Specifically, the datasets were comprised of GI number (GI), nasal polyps cases (NP), and sinonasal squamous cell carcinoma cases (SNSCC) samples. Each dataset was read into R using the read.table function with tab-delimited format, ensuring that headers were recognized and strings were not converted into factors.

Data Preparation:  
	The datasets from NP and SNSCC groups were combined for Principal Component Analysis (PCA). The combined data matrix was transposed to align the features appropriately. Subsequently, a data frame was constructed from the transposed matrix, with column names assigned based on the GI dataset. Group labels were appended to this data frame to distinguish between NP and SNSCC samples.

Principal Component Analysis:  
	PCA was conducted on the combined dataset, excluding the group labels, using the prcomp function with scaling enabled to normalize the data. The resulting principal components were extracted and formatted into a data frame. Group labels were again appended to this data frame for subsequent analysis and visualization.

Visualization:  
	A 3D PCA plot was generated using the plotly library to visualize the separation between NP and SNSCC groups. The plot_ly function was utilized to create a scatter plot with PC1, PC2, and PC3 as the axes. Data points were colored according to their group labels using a predefined color scheme. To enhance interpretability, annotations were added to mark the centroids of NP and SNSCC groups, calculated as the mean of their respective principal component scores. These annotations included arrows pointing to the centroids with text labels for NP and SNSCC.

