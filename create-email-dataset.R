# =======================================
# Using a Confusion Matrix in Marketing 
# Creates synthetic datasets for email opens (balanced and unbalanced) and saves to CSV
# By: Joe Domaleski, 7/7/25
# https://blog.marketingdatascience.ai
# =======================================

set.seed(123)

# Create 1000 rows of data
n <- 1000

# Build base dataframe (same for both datasets)
base_data <- data.frame(
  email_id = 1:n,
  subject_length = sample(20:80, n, replace = TRUE),  # Subject line length
  send_time = sample(c("morning", "afternoon", "evening"), n, replace = TRUE),
  day_of_week = sample(c("Mon", "Tue", "Wed", "Thu", "Fri"), n, replace = TRUE),
  customer_segment = sample(c("new", "loyal", "churn"), n, replace = TRUE),
  previous_opens = sample(0:10, n, replace = TRUE)
)

# =======================================
# Generate Balanced Dataset (~50% open rate)
# =======================================
balanced_data <- base_data
balanced_data$opened <- rbinom(n, 1, prob = plogis(
  -1.5 + 0.02 * balanced_data$subject_length +
    0.3 * (balanced_data$send_time == "morning") +
    0.5 * (balanced_data$customer_segment == "loyal") +
    0.1 * balanced_data$previous_opens
))
balanced_data$opened <- factor(balanced_data$opened, labels = c("No", "Yes"))

# Save to CSV
write.csv(balanced_data, "synthetic_email_data_balanced.csv", row.names = FALSE)

# =======================================
# Generate Unbalanced Dataset (~10–20% open rate, more realistic)
# =======================================
unbalanced_data <- base_data
unbalanced_data$opened <- rbinom(n, 1, prob = plogis(
  -3 + 0.02 * unbalanced_data$subject_length +
    0.3 * (unbalanced_data$send_time == "morning") +
    0.5 * (unbalanced_data$customer_segment == "loyal") +
    0.1 * unbalanced_data$previous_opens
))
unbalanced_data$opened <- factor(unbalanced_data$opened, labels = c("No", "Yes"))

# Save to CSV
write.csv(unbalanced_data, "synthetic_email_data_unbalanced.csv", row.names = FALSE)

