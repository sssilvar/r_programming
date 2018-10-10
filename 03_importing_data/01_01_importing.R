# Read CSV
pools <- read.csv("../files/swimming_pools.csv")
str(pools)  # Print structure

# Import swimming_pools.csv correctly: pools
pools <- read.csv("../files/swimming_pools.csv", stringsAsFactors = FALSE)
# Check the structure of pools
str(pools)

# Read any file in table format with special separator
# read.table() / read.delim()
hotdogs <- read.delim("files/hotdogs.txt", header = FALSE)
summary(hotdogs)

# Use file.path()
path <- file.path("..", "files", "hotdogs.txt")
# Import the hotdogs.txt file: hotdogs
hotdogs <- read.table(path, 
                      sep = "\t", 
                      col.names = c("type", "calories", "sodium"))

# Call head() on hotdogs
head(hotdogs)



# A more complete and detailed way to do ir!
hotdogs <- read.delim(path, header = FALSE, col.names = c("type", "calories", "sodium"))

# Select the hot dog with the least calories: lily
lily <- hotdogs[which.min(hotdogs$calories), ]

# Select the observation with the most sodium: tom
tom <- hotdogs[which.max(hotdogs$sodium), ]

# Print findings
results <- list(Tom = tom, Lily = lily)
cat(paste("Results for", results))



#################################
# More and more complete
#################################
hotdogs <- read.delim(path, 
                      header = FALSE, 
                      col.names = c("type", "calories", "sodium"),
                      colClasses = c("factor", "NULL", "numeric"))
str(hotdogs)

