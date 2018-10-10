# Reading excel files with "readxl"
library(readxl)

# Define xl_file
xl_file <- file.path('..', 'files', 'urbanpop.xlsx')
cat("[  INFO  ] Main file to process in:", xl_file)

# Print the names of all worksheets
sheets <- excel_sheets(xl_file)

# Read the sheets, one by one
pop_1 <- read_excel(xl_file, sheet = 1)
pop_2 <- read_excel(xl_file, sheet = 2)
pop_3 <- read_excel(xl_file, sheet = 3)

# Put pop_1, pop_2 and pop_3 in a list: pop_list
pop_list <- list(pop_1, pop_2, pop_3)

# Display the structure of pop_list
str(pop_list)

############
# Fastest way to do it!
# Read all Excel sheets with lapply(): pop_list
pop_list <- lapply(excel_sheets(xl_file), read_excel, path = xl_file)

# Display the structure of pop_list
str(pop_list)




############ ALTERNATIVE: gdata() ############
# WARN: not so fast but stable - readxl is still in development
# Load the gdata package
library(gdata)

# Import the second sheet of urbanpop.xls: urban_pop
urban_pop <- read.xls(xl_file, sheet = 2)

# Print the first 11 observations using head()
head(urban_pop, n = 11)

# Remove rows with NAs
urban_clean <- na.omit(urban_pop)
summary(urban_clean)
