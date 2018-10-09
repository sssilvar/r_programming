library(gapminder)
library(ggplot2)
library(dplyr)

# The summarize() verb
gapminder %>%
    filter(year == 2007) %>%
    summarize(meanLifeExp = mean(lifeExp))

# The group_by
gapminder %>%
    group_by(continent, year) %>%
    summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# Plot summarized data
by_year <- gapminder %>%
    mutate(pop = pop / 1e6) %>%
    group_by(year) %>%
    summarize(totalPop = sum(pop), meanLifeExp = mean(lifeExp))

ggplot(by_year, aes(x = year, y = totalPop)) + geom_point() + expand_limits(y = 0)

# Do it by year and continent
by_year_continent <- gapminder %>%
    mutate(pop = pop /1e6) %>%
    group_by(year, continent) %>%
    summarize(totalPop = sum(pop), meanLifeExp = mean(lifeExp))

ggplot(by_year_continent, aes(x = year, y = totalPop, color = continent)) + geom_point() + expand_limits(y = 0)

# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap = median(gdpPercap) )
  
ggplot( by_year_continent, aes(x=year, y=medianGdpPercap, color=continent) ) + geom_point() + expand_limits(y=0)