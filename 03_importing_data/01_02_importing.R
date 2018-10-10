# Import readr library
library(readr)

# define csv file: csv_file
csv_file <- file.path("..", "files", "potatoes.csv")
txt_file <- file.path("..", "files", "potatoes.txt")

# Load data
potatoes <- read_csv(csv_file)


######################################################
# Imagine a TSV with no headers
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import potatoes.txt: potatoes
potatoes <- read_tsv(txt_file, col_names = properties)

# Call head() on potatoes
head(potatoes)


######################################################
# Skip rows or columns
potatoes <- read_tsv(txt_file,  # Filename
                     col_names = properties,  # Colum names (vector)
                     skip = 6,  # Skip rows
                     n_max = 5) # Number of rows taken
potatoes  # Print it

###
# Set colum types
# "c: character, "d" double, "i" integer and "l" logical. "_" skips the column as a whole.
potatoes_char <- read_tsv(txt_file,
                          col_types = "cccccccc",
                          col_names = properties)
str(potatoes_char)

# ANOTHER EXAMPLE
# The collectors you will need to import the data
fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

# Edit the col_types argument to import the data correctly: hotdogs_factor
hotdogs_factor <- read_tsv(txt_file,
                           col_names = c("type", "calories", "sodium"),
                           col_types = list(fac, int, int))




######################################################
# Using fread() from package: data.table
library(data.table)
library(ggplot2)

potatoes <- fread(csv_file)
potatoes

# Import columns 6 and 8 of potatoes.csv: potatoes
potatoes <- fread(csv_file, select = c(6,8) )

ggplot(potatoes, aes(x = texture, y = moistness)) + geom_point()

######################################################
# To work directly on the Excel files:
# XLConnect package is the solution!
