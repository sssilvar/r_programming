library(gapminder)
library(ggplot2)
library(dplyr)

# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap = median(gdpPercap) )
  
# Line plot
ggplot( by_year_continent, aes(x=year, y=medianGdpPercap, color=continent) ) + geom_line() + expand_limits(y=0)

# Bar plot
ggplot(by_year_continent, aes(x=continent, y=medianGdpPercap)) + geom_col()

# Histogram
gapminder_2007 <- gapminder %>%
    filter(year == 2007)
ggplot(gapminder_2007, aes(x=lifeExp)) + geom_histogram(binwidth=1)

# Box plot
ggplot(gapminder_2007, aes(x=continent, y=lifeExp)) + geom_boxplot()
# With title :D
# Add a title to this graph: "Comparing GDP per capita across continents"
ggplot(gapminder_2007, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() + 
  ggtitle("Comparing GDP per capita across continents in 2007")