# install devtools
install.packages('devtools')

# install dependency of scales package
install.packages(c("RColorBrewer", "stringr", "dichromat", "munsell", "plyr", "colorspace"))

# Open devtools package
library(devtools)

# move to development mode
# scales and ggplot2 are installed in "~/R-dev" directory, so official version of ggplot2 are not removed.
dev_mode(TRUE)

install_github("hadley/scales", force=TRUE)
# main branch of development
install_github("hadley/ggplot2")
# (Optional) install_github("ggplot2", "kohske", "feature/new-guides-with-gtable")

# Exit dev mode
dev_mode(FALSE)

# load development version of ggplot2
library(ggplot2, lib.loc = "~/R-dev")

# library(ggplot2) will still load the regular (non-dev) version
