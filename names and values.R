library(tidyverse)

# For breaking news about R, follow Hadley Wickham on twitter @hadleywickham
# I would also recommend: @dataandme @JennyBryan @drob

# For example, recently there was a new chapter added to his textbook advanced R
# https://adv-r.hadley.nz/names-values.html


# devtools::install_github("r-lib/lobstr")
library(lobstr)

x <- 1:3
y <- x

obj_addr(x)
obj_addr(y)

x <- 2:4

obj_addr(x)
obj_addr(y)

z <- 4
obj_addr(z)
z <- 5
obj_addr(z)

# What about lists? (similarly for vectors)

l1 <- list(1, 2, 3)
l2 <- l1

obj_addr(l1)
obj_addr(l2)

l2[[3]] <- 4

obj_addr(l1)
obj_addr(l2)

ref(l1, l2)
# The first address is where the list itself lives, as references to the values in it
# The next two, greyed out in l2, are the first two values which are the same in both lists
l1
l2
 
# Let's see how this affects memory usage

x <- 1:1e6
obj_size(x)

y <- list(x, x, x)
obj_size(y)

obj_size(list(NULL, NULL, NULL))
obj_size(x, y)

# When performing certain operations with lists and data frames, especially with for loops,
# R will actually copy the entire data frame several times in each iteration
# This is, as you would imagine, very slow

# The package data.table can fix some of these issues if performance is important to you


# Garbage collection
# R automatically runs garbage collection whenever it needs memory
# You never need to run gc() yourself, although you can
mem_used()
gc()

mem_used()
rm(x)

mem_used()
