library(gapminder)
library(ggplot2)
library(dplyr)

# Save filtered DataFrame: gapminder_2007
gapminder_2007 <- gapminder %>%
    filter(year == 2007)

# Create a simple scatter plot
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + geom_point()

# Use log-scale
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + geom_point() + scale_x_log10()

# Use continent as categorical and use pop as size
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) + geom_point() + scale_x_log10()

# Population vs Life Expectancy and GDP per capita
ggplot(gapminder_2007, aes(x = pop, y = lifeExp, color = continent, size = gdpPercap)) + geom_point() + scale_x_log10()

# Faceting: Subplots
ggplot(
    gapminder, 
    aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)
    ) + geom_point() + scale_x_log10() + facet_wrap(~ year)
