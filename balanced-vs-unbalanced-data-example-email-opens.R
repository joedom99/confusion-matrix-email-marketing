# =======================================
# Using a Confusion Matrix in Marketing 
# Creates bar plots of the two datasets to visualize balanced vs. unbalanced data
# By: Joe Domaleski, 7/11/25
# https://blog.marketingdatascience.ai
# =======================================

set.seed(123)

# Load necessary library
library(ggplot2)

# Load balanced dataset
balanced_data <- read.csv("synthetic_email_data_balanced.csv")
balanced_counts <- table(balanced_data$opened)
balanced_df <- data.frame(EmailOpened = names(balanced_counts),
                          Count = as.vector(balanced_counts),
                          Percentage = round(100 * as.vector(balanced_counts) / sum(balanced_counts), 1))

# Load unbalanced dataset
unbalanced_data <- read.csv("synthetic_email_data_unbalanced.csv")
unbalanced_counts <- table(unbalanced_data$opened)
unbalanced_df <- data.frame(EmailOpened = names(unbalanced_counts),
                            Count = as.vector(unbalanced_counts),
                            Percentage = round(100 * as.vector(unbalanced_counts) / sum(unbalanced_counts), 1))

# Plot for balanced dataset
ggplot(balanced_df, aes(x = EmailOpened, y = Count, fill = EmailOpened)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(Percentage, "%")), 
            color = "white", size = 5, fontface = "bold", vjust = 1.5) +
  ggtitle("Class Distribution: Balanced Dataset") +
  ylab("Number of Emails") +
  xlab("Email Opened") +
  theme_minimal()

# Plot for unbalanced dataset
ggplot(unbalanced_df, aes(x = EmailOpened, y = Count, fill = EmailOpened)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(Percentage, "%")), 
            color = "white", size = 5, fontface = "bold", vjust = 1.5) +
  ggtitle("Class Distribution: Unbalanced Dataset") +
  ylab("Number of Emails") +
  xlab("Email Opened") +
  theme_minimal()
