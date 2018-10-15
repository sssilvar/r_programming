# Measures of center 
library(ggplot2)
library(readr)
library(dplyr)
library(gapminder)

# Load dataset
gapminder <- gapminder::gapminder

# Filter 2007 observations
gap2007 <- filter(gapminder, year ==2007)

# Using gap2007, calculate the mean and median 
# life expectancy for each continent. 
# Don't worry about naming the new columns produced by summarize().
gap2007 %>%
  group_by(continent) %>%
  summarise(mean = mean(lifeExp), median = median(lifeExp))

# Generate box plots of lifeExp for each continent
gap2007 %>%
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot()

# Compute groupwise measures of spread
gap2007 %>%
  group_by(continent) %>%
  summarize(sd(lifeExp),
            IQR(lifeExp),
            n() )

# Generate overlaid density plots
gap2007 %>%
  ggplot(aes(x = lifeExp, fill = continent)) +
  geom_density(alpha = 0.3)

# Transforming the data can show better what's going on
gap2007 %>%
  ggplot(aes(x = log(pop))) + geom_density()


# ############
# Outliers!
# ############
gap_asia_2007 <- gap2007 %>%
  filter(continent == "Asia") %>%
  mutate(is_outlier = lifeExp < 50)

# Plot removing outliers
gap_asia_2007 %>%
  filter(!is_outlier) %>%
  ggplot(aes(x = 1, y = lifeExp)) + geom_boxplot()
