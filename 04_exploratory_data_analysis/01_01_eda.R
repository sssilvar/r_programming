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
