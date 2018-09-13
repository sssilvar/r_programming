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

# 
