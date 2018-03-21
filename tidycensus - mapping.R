
## be sure to install the development version of ggplot2
## devtools::install_github("tidyverse/ggplot2")


library(tidycensus)
library(tidyverse)
options(tigris_use_cache = TRUE)

orange <- get_acs(state = "CA", county= "orange", geography = "tract",
                  variables =  "B19013_001", geometry = TRUE)

## what kind of R object is orange?

head(orange)

library(viridis)

orange %>% ggplot(aes(fill = estimate, color = estimate)) + 
  geom_sf() +
  coord_sf(crs = 26911) +
  scale_fill_viridis(option = "magma") +
  scale_color_viridis(option = "magma")
