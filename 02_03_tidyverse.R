library(gapminder)
library(ggplot2)
library(dplyr)

# The summarize() verb
# Mean life expectancy in 2009
gapminder %>%
    filter(year == 2007) %>%
    summarize(meanLifeExp = mean(lifeExp))

gapminder %>%
    filter(year == 2007) %>%
    summarize(meanLifeExp = mean(lifeExp), maxGdpPercap = max(gdpPercap))

# group_by()
# Sumarize per year
gapminder %>%
    mutate(pop = pop / 1e6) %>%
    group_by(year) %>%
    summarize(meanLifeExp = mean(lifeExp), totalPop = sum(pop))

# Summarizing per continent in 2007
gapminder %>%
    filter(year == 2007) %>%
    mutate(pop = pop / 1e6) %>%
    group_by(continent) %>%
    summarize(meanLifeExp = mean(lifeExp), totalPop = sum(pop))

# Summarizing per continent in 2007
gapminder %>%
    mutate(pop = pop / 1e6) %>%
    group_by(year, continent) %>%
    summarize(meanLifeExp = mean(lifeExp), totalPop = sum(pop))