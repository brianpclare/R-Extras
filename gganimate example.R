library(babynames)
library(tidyverse)

# devtools::install_github('thomasp85/gganimate')
library(gganimate)

data()
babynames


top_2015 <- babynames %>% filter(year == 2015) %>% group_by(sex) %>% top_n(5, prop) %>% 
  ungroup()

names_history <- babynames %>% filter(name %in% top_2015$name)

g <- ggplot(data = names_history) + geom_col(aes(x = name, y = prop, fill = sex)) +
  labs(title = 'The top 2015 names in the year {frame_time}') +
  transition_time(year) + ease_aes("linear")

animate(g, nframes = 136, fps = 4)
