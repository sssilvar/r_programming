# Functions
triple <- function(x) {
    3 * x  # Returns by default the last line
}

# using function triple
a <- 5
triple(a)

# You can use also the function return
check_speed <- function(speed) {
    if ( speed > 80 ){
        print("Slow down Toreto!")
        return(FALSE)
    } else if ( speed < 10 ) {
        print("You're causing a traffic jam!")
        return(FALSE)
    } else {
        print("You are doing great bud!")
        return(TRUE)
    }
}

# Check how good I am
sp <- 5
am_i_good <- check_speed(sp)

print(paste("Am I good? : ", am_i_good))

# lapply applies a function on a whole list
# Usage: lapply(list, function)
# Always returns a list! unlist() can make it a vector

oil_prices <- list(2.37, 2.49, 2.18, 2.22, 2.47, 2.32)
oil_tripple <- unlist(lapply(oil_prices, triple))
cat(paste("Tripple oil prices:", oil_tripple, "\n"))

# More than one argument functions
by_factor <- function(x, factor) {
    x * factor
}

oil_ten <- unlist(lapply(oil_prices, by_factor, factor = 10))
print(oil_ten)

###############
# sapply()
###############
cities <- c("New york", "Paris", "London", "Tokyo", "Rio de Janeiro", "Cape Town")
sapply(cities, nchar)
sapply(cities, nchar, USE.NAMES=FALSE)


# Temperatures
temp <- list(
    c(3,7,9,6,-1),
    c(6,9,12,13,5),
    c(4,8,3,-1,-3),
    c(1,4,7,2,-2),
    c(5,7,9,4,2),
    c(-3,5,8,9,4),
    c(3,6,9,4,1)
)

extremes <- function(x) {
    c(min=min(x), max=max(x))
}

# Definition of print_info()
print_info <- function(x) {
  cat("The average temperature is", mean(x), "\n")
}

# Check the differences!
lapply(temp, extremes)
sapply(temp, extremes)

lapply(temp, print_info)
sapply(temp, print_info) # PAY ATTENTION TO THIS ONE

###############
# vapply()
###############
sapply(cities, nchar)
vapply(cities, nchar, numeric(1))  # You need to define the output type and length (more safe)


 ##########################
 # OFTEN USED FUNCTIONS!
 ##########################
 # Math related
 v1 <- runif(10, min=-1)
 v2 <- runif(10, min=-5, max=5)

 mean(c(
     sum(round(abs(v1))),
     sum(round(abs(v2)))
 ))

sort( # Pretty obious
    rep( # Repeat several "times"
        seq(8, 2, by = -2),  # Create sequence (vector)
        times = 2
    ),
    decreasing = TRUE
)

# Check classes
is.list(v1)
is.vector(v1)

# Add elements to vector or list
str(append(v1, 0.3))
reversed_seq = rev(seq(10))
append(v1, reversed_seq)


#################################
# REGULAR EXPRESSIONS
#################################
# grepl()
animals <- c("cat", "moose", "impala", "ant", "kiwi")

grepl(pattern="a", x=animals)  # Contains 'a'
grepl(pattern="^a", x=animals)  # Starts with 'a'
grepl(pattern="a$", x=animals)  # Ends with 'a'

# if you use grep() you get the indices
grep(pattern="a", x=animals)  # Contains 'a'
grep(pattern="^a", x=animals)  # Starts with 'a'
grep(pattern="a$", x=animals)  # Ends with 'a'

# sub() and gsub()
sub(pattern="a", replacement="o", x=animals) # Replace the first match
gsub(pattern="a", replacement="o", x=animals) # Replace the every match
gsub(pattern="a|i|o", replacement="-", x=animals) # Replace match based on regular exp


#################################
# DATES
#################################
my_date = as.Date("24-12-2016", format="%d-%m-%Y")
print(my_date)