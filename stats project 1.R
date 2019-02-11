library(readr)
library(dplyr)
NCAA_data = read.table("https://daviddalpiaz.github.io/stat3202-sp19/project/proj-01/data/basketball_use.dat")
names(NCAA_data) = c("year", "school_home", "score_home", "school_away", "score_away")
NCAA_data$total _score= NCAA_data$score_home + NCAA_data$score_away
