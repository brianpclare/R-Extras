# install.packages("usethis")
library(usethis)
# This will give you a menu option under Addins above to style your code

# For example,


x<-1:10
y<-2:11
z<-str_c(x,y)

baseball<-read_csv("Teams.csv")
good_old_teams<-baseball%>%filter(.,yearID<1900)%>%filter(.,W>L)%>%select(.,yearID,W,L,name)


# usethis also has functionality to interact with git/github

use_git_config(user.name = "Brian Clare", user.email = "brianclare.math@gmail.com")

browse_github_pat() # etc etc

