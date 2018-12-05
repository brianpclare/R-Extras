# install.packages(c("devtools", "htmltools", "shiny", 
                   "miniUI", "formatR", "wrapr"))

# devtools::install_github("WinVector/addinexamples")
# this adds the  %<>% shortcut to addins
# we can assign it a keyboard shortcut now, I'm using Ctrl+Shift+P
                   
                   
library(tidyverse)
library(magrittr)

data()

class(sleep)

?sleep

sleep %<>% arrange(desc(extra))

sleep_means <- sleep %>% group_by(group) %>% summarize(num = n(), mean = mean(extra))
sleep_means$group %<>% as.factor()

# if I want to save this new dataframe, I could use write_csv and then read_csv later
# and that's probably for the best if I wanted to share this with someone else

# But if it's just something I'm going to want to refer to again later on my machine,
# it's better to use write_rds and read_rds

write_csv(sleep_means, "sleep csv.csv")
write_rds(sleep_means, "sleep rds")

# let's clear away everything here and pretend it's a new session in a new script

library(tidyverse)
library(magrittr)

sleep_csv <- read_csv("sleep csv.csv")
# It had to figure out the column classes all over again, and it took group as an integer instead of a factor

sleep_rds <- read_rds("sleep rds")
# This remembers exactly what the R object I saved was
