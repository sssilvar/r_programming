# Import packages
library(gapminder)
library(dplyr)

##########################
# The VERBS!
##########################

# Filtering data: filter()
gapminder %>%
    filter(year == 2007)

gapminder %>%
    filter(country == "United States")

gapminder %>%
    filter(year == 2007, country == "United States")


# The arrange() verb
gapminder %>%
    arrange(gdpPercap)

# or descending
gapminder %>%
    arrange(desc(gdpPercap))

# Combine!
gapminder %>%
    filter(year==2007) %>%
    arrange(desc(gdpPercap))


# The mutate() verb
gapminder %>%
    mutate(pop = pop / 1e6)

# Total GDP = gdpPercap * pop
gapminder %>%
    mutate(gdp = gdpPercap * pop)

# highest total GDP in 2007
gapminder %>%
    filter(year == 2007) %>%
    mutate(gdp = gdpPercap * pop) %>%
    arrange(desc(gdp))