library(gapminder)
library(ggplot2)
library(dplyr)

# The summarize() verb
gapminder %>%
    filter(year == 2007) %>%
    summarize(meanLifeExp = mean(lifeExp))