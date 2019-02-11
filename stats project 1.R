library(readr)
library(dplyr)
NCAA_data = read.table("~/Desktop/Stats Project 1/basketball_use.dat")
names(NCAA_data) = c("year", "school_home", "score_home", "school_away", "score_away")
NCAA_data$newcolumn = NCAA_data$score_home + NCAA_data$score_away
