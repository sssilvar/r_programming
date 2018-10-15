# Load packages
library(ggplot2)
library(dplyr)
library(openintro)

# load DataFrame
email <- openintro::email
email$spam <- factor(email$spam, levels = c(0, 1), labels = c("not-spam", "spam"))

# Compute summary statistics
email %>%
  group_by(spam) %>%
  summarise(median(num_char), IQR(num_char))

# Create plot
email %>%
  mutate(log_num_char = log(num_char)) %>%
  ggplot(aes(x = spam, y = log_num_char)) +
  geom_boxplot()