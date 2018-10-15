#################################
# Exploratory data Analysis
#################################
library(readr)
library(ggplot2)
library(tibble)
library(dplyr)

# Path to database: comics
data_path = file.path("..", "files", "comics.csv")

# Load dataset
comics <- as_tibble(read.csv(data_path))

# Check levels in dataset
levels(comics$align)

# Create a 2-way contingency table
table(comics$align, comics$gender)

# Remove align level: Reformed criminals
comics <- comics %>%
  filter(align != "Reformed Criminals" ) %>%
  droplevels()

# Create side-by-side barchart of gender by alignment
ggplot(comics, aes(x = align, fill = gender)) + 
  geom_bar(position = "dodge")

# Create side-by-side barchart of alignment by gender
ggplot(comics, aes(x = gender, fill = align)) + 
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90))

# Proportions!
ggplot(comics, aes(x = align, fill = id)) + geom_bar(position = "fill") + ylab("Proportion")
tab <- table(comics$align, comics$gender)
options(scipen = 999, digits = 3)
prop.table(tab, 2)

# Plot of gender by align
ggplot(comics, aes(x = align, fill = gender)) + geom_bar(position = "dodge")
ggplot(comics, aes(x = align, fill = gender)) + geom_bar(position = "fill") + ylab("proportion")


# ##########################################
#  Distribution of one variable
# ##########################################

# Plot alignment changing factors order and broken down by gender
comics$align <- factor(comics$align, levels = c("Bad", "Neutral", "Good"))
ggplot(comics, aes(x = align)) + geom_bar(fill = "#B20000") + facet_wrap(~ gender)

# Some other named colors can be found at: https://css-tricks.com/snippets/css/named-colors-and-hex-equivalents/
# Remember to use only lowe cases

