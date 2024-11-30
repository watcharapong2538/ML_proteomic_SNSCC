Methodology

	Python 3.12.0
 	1	Data Loading and Preprocessing:
		◦	The proteomic data is loaded into a pandas DataFrame.
		◦	Features and labels are separated.
		◦	Data is normalized using StandardScaler.
		◦	Divides samples into sequential groups of 3 
		◦	Data is split into training and testing sets. Splits the data into training (80%) and testing (20%) sets

	2	Model Training and Evaluation:
		◦	Various classifiers (RandomForest, SVM, LogisticRegression, GradientBoosting) are defined and trained on the training data.
		◦	Models are evaluated on the testing data using accuracy, precision, recall, F1-score, AUROC, AUPRC, specificity, and sensitivity.
 		◦	Feature importances are saved for interpretability.
		◦	Leave-one-group-out cross validation (LOGO-CV) was applied to the entire dataset, and the accuracy score was reported.

	3	Results Compilation:
		◦	The performance metrics for each model are compiled into a DataFrame.
		◦	Feature importances are saved to CSV files.
	

	Model Evaluation on Testing Set
	After training the models using the training set, the following steps are taken to evaluate the performance of each model on the testing set:
	1	Model Predictions:
		◦	The model makes predictions on the testing set (X_test).
		◦	These predictions are compared to the true labels (Y_test) to compute various performance metrics.

	2	Accuracy Score:
		◦	The accuracy of the model is calculated using the accuracy_score function from sklearn.metrics, which measures the proportion of correctly predicted instances.

	3	Precision, Recall, and F1-Score:
		◦	Precision: The ratio of true positive predictions to the total predicted positives.
		◦	Recall: The ratio of true positive predictions to the total actual positives.
		◦	F1-Score: The harmonic mean of precision and recall.

	4	ROC Curve and AUC:
		◦	The Receiver Operating Characteristic (ROC) curve is plotted, and the Area Under the ROC Curve (AUROC) is calculated. The ROC curve shows the trade-off between sensitivity and specificity.

	5	Precision-Recall Curve and AUC:
		◦	The Precision-Recall curve is plotted, and the Area Under the Precision-Recall Curve (AUPRC) is calculated. This curve is useful when dealing with imbalanced datasets.

	6	Confusion Matrix:
		◦	The confusion matrix is generated, showing the counts of true positives, true negatives, false positives, and false negatives.

	7	Specificity and Sensitivity:
		◦	Specificity: The ratio of true negative predictions to the total actual negatives.
		◦	Sensitivity (Recall): The ratio of true positive predictions to the total actual positives.

	8	Standard Deviation of Cross-Validation Scores:
		◦	The standard deviation of the cross-validation scores (KFold and LOGO-CV) is calculated to assess the model's stability.

	9	Cross-Validation Scores: Provides an estimate of model performance on all dataset.
