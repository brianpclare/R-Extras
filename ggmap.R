library(ggmap)

map <- get_googlemap('bude', zoom = 15)
ggmap(map, extent = 'device')

gglocator(n = 1, message = FALSE, xexpand = c(0.05, 0),
          yexpand = c(0.05, 0))
