load("~//Documents//OpenDataProj//hr_tables.RData")
year <- seq(1990, 2014)
for (i in 1:length(year)) {
}

library(dplyr)
TEAMS <- c()
for (i in 1:length(year)) {
  TEAMS <- union(TEAMS, levels(hr_tables[[i]]$BATTERTEAM))
}

## 林仲秋
Lin <- list()
year <- seq(1990, 2014)
for (i in 1:length(year)) {
  temp <- hr_tables[[i]]
  Lin <- rbind(Lin, filter(temp, temp$BATTER == "林仲秋"))
}

##


hrs <- filter(hr_tables[[1]], BATTERTEAM == TEAMS[[1]])

hrs_all <- sapply(hr_tables, mutate, )

pat <- mutate(hr_tables[[1]], )

patterns <- sapply(hr_tables, mutate, )