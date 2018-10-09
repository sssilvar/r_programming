# #### VARIABLES ####
# Variable types
num_var <- 10.5
str_var <- "Test"
bool_var <- TRUE

# Simple print
num_var
str_var
bool_var

# #### VECTORS ####
# Create vectors
poker_vector <- c(140, -50, 20 ,-120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign a nname per each element (day of the week)
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Print how much you won/lost per day
total_win <- poker_vector + roulette_vector
total_win

# Print the total you won/lost in the week
sum(total_win)

# How much did you win/lose in poker on Wednesday?
# Indexes start at 1 (not like Python which starts at 0)
poker_vector[3]

# Assign the poker results of Tuesday, Wednesday and Thursday 
# to the variable poker_midweek. (Vector selection)
poker_midweek <- poker_vector[c(2, 3, 4)]
poker_midweek

# Vector slicing
roulette_selection_vector <- roulette_vector[2:5]
roulette_selection_vector

# Selection by using the names
# Select poker results for Monday, Tuesday and Wednesday
poker_start <- poker_vector[c("Monday", "Tuesday", "Wednesday")]
  
# Calculate the average of the elements in poker_start
mean(poker_start)

# Which days did you make money on poker?
selection_vector <- poker_vector > 0

# Selection by comparison - Step 2
print("Days when you won:")
poker_vector[selection_vector]


# ############################################################
# ######################### MATRICES #########################
# ############################################################

# Construct a matrix with 3 rows that contain the numbers 1 up to 9
matrix(1:9, byrow=TRUE, nrow=3)

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create box_office
box_office <- c(new_hope, empire_strikes, return_jedi)

# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, nrow=3, byrow=TRUE)

# Naming a Matrix:
# rownames(my_matrix) <- row_names_vector
# colnames(my_matrix) <- col_names_vector

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
colnames(star_wars_matrix) <- region

# Name the rows with titles
rownames(star_wars_matrix) <- titles

# Print out star_wars_matrix
star_wars_matrix

# ANOTHER WAY!
# Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE,
                           dimnames = list(c("A New Hope", "The Empire Strikes Back", "Return of the Jedi"), 
                                           c("US", "non-US")))

# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)
all_wars_matrix

# Matrix with data from prequels trilogy.
box_office_2 <- c(474.5, 552.5, 310.7, 338.7, 380.3, 468.5)
star_wars_matrix_2 <- matrix(box_office_2, nrow=3, byrow=TRUE,
                            dimnames=list(c("The Phantom Menace", "Attack of the clones", "Revenge of the Sith"),
                                          c("US", "non-US")))
star_wars_matrix_2

# Combine both info matrices
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix_2)

# Total revenue for US and non-US
total_revenue_vector <- colSums(all_wars_matrix)
total_revenue_vector

# Select the non-US revenue for all movies
non_us_all <- all_wars_matrix[,2]
  
# Average non-US revenue
mean(non_us_all)
  
# Select the non-US revenue for first two movies 
# (HERE the last index is inclusive!!!!)
non_us_some <- all_wars_matrix[1:2, 2]
  
# Average non-US revenue for first two movies
mean(non_us_some)

# Estimate the visitors (US $5 / person)
visitors <- all_wars_matrix / 5
visitors

# Estimate the mean US visitors
us_visitors <- visitors[,1]
mean(us_visitors)