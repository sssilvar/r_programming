# ##############################
# Numerical data
# ##############################

library(readr)
library(ggplot2)
library(dplyr)

# Load dataset: cars
cars <- read_csv("../files/cars04.csv")

# Learn data structure
str(cars)

# Create faceted histogram (launches a warning)
ggplot(cars, aes(x = city_mpg)) +
  geom_histogram() +
  facet_wrap(~ suv)

# Filter cars with 4, 6, 8 cylinders
common_cyl <- filter(cars, ncyl %in% c(4,6,8))

# Create box plots of city mpg by ncyl
ggplot(common_cyl, aes(x = as.factor(ncyl), y = city_mpg)) +
  geom_boxplot()

# Create overlaid density plots for same data
ggplot(common_cyl, aes(x = city_mpg, fill = as.factor(ncyl))) +
  geom_density(alpha = .3)

# Using into dplyr
# Create hist of horsepwr
cars %>%
  ggplot(aes(x = horsepwr)) +
  geom_histogram() +
  ggtitle("Horsepower Distribution")

# Create hist of horsepwr for affordable cars
cars %>% 
  filter(msrp < 25000) %>%
  ggplot(aes(x = horsepwr)) +
  geom_histogram() +
  xlim(c(90, 550)) +
  ggtitle("Cheap cars - Horsepower distribution")


# Multivariable faceting
cars %>%
  filter(ncyl %in% c(4, 6, 8)) %>%
  ggplot(aes(x = hwy_mpg)) +
  geom_histogram() +
  facet_grid(ncyl ~ suv) +
  ggtitle("Milleage for SUVs and N. of Cyl.")

