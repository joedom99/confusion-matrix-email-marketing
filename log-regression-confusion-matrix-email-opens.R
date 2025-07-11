# =======================================
# Using a Confusion Matrix in Marketing - Main Program
# Logistic Regression on Synthetic Email Data (Balanced and Unbalanced)
# By: Joe Domaleski, 7/7/25
# https://blog.marketingdatascience.ai
# =======================================

# Step 0: Load Libraries and Set Seed

# Load necessary library
library(caret)

# For reproducibility across both datasets
set.seed(123)  

# =======================================
# Function to Evaluate Dataset
# =======================================
evaluate_dataset <- function(filename, dataset_name) {
  cat("\n=======================================\n")
  cat("Evaluating Dataset:", dataset_name, "\n")
  cat("=======================================\n")
  
  # Step 1: Load the Dataset
  data <- read.csv(filename)
  data$opened <- as.factor(data$opened)
  print(head(data))
  
  # Step 2: Split Data into Training and Testing Sets (80/20 Split)
  train_index <- createDataPartition(data$opened, p = 0.8, list = FALSE)
  train_data <- data[train_index, ]
  test_data <- data[-train_index, ]
  
  # Step 3: Fit Logistic Regression Model
  model <- glm(opened ~ subject_length + send_time + day_of_week + 
                 customer_segment + previous_opens,
               data = train_data, family = binomial)
  
  # Step 4: Predict on Test Data
  pred_probs <- predict(model, test_data, type = "response")
  pred_class <- ifelse(pred_probs > 0.5, "Yes", "No")
  pred_class <- factor(pred_class, levels = levels(test_data$opened))
  
  # Step 5: Generate Confusion Matrix and Performance Metrics
  conf_mat <- confusionMatrix(pred_class, test_data$opened, positive = "Yes")
  print(conf_mat)
  
  # Step 6: Manually Calculate Metrics
  cm_table <- conf_mat$table
  TP <- cm_table["Yes", "Yes"]
  TN <- cm_table["No", "No"]
  FP <- cm_table["Yes", "No"]
  FN <- cm_table["No", "Yes"]
  
  accuracy <- (TP + TN) / sum(cm_table)
  sensitivity <- TP / (TP + FN)  # Recall, Sensitivity
  precision <- TP / (TP + FP)    # Positive Predictive Value (Precision)
  specificity <- TN / (TN + FP)
  
  cat("\nAdditional Metrics (Manually Calculated from Confusion Matrix):\n")
  cat(sprintf("Accuracy: %.3f\n", accuracy))
  cat(sprintf("Sensitivity (Recall): %.3f\n", sensitivity))  # This matches caret Sensitivity
  cat(sprintf("Positive Predictive Value (Precision): %.3f\n", precision))  # This matches caret Pos Pred Value
  cat(sprintf("Specificity: %.3f\n", specificity))
}

# =======================================
# Evaluate Balanced Dataset First (Simpler Case)
# =======================================
evaluate_dataset("synthetic_email_data_balanced.csv", "Balanced Dataset (Simplified Case)")

# =======================================
# Evaluate Unbalanced Dataset Second (Realistic Case)
# =======================================
evaluate_dataset("synthetic_email_data_unbalanced.csv", "Unbalanced Dataset (Realistic Case)")
