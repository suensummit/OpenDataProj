load("Documents//OpenDataProj//hr_tables.RData")
year <- seq(1990, 2014)
for (i in 1:length(year)) {
}

library(dplyr)
TEAMS <- c()
for (i in 1:length(year)) {
  TEAMS <- union(TEAMS, levels(hr_tables[[i]]$BATTERTEAM))
}


hrs <- filter(hr_tables[[1]], BATTERTEAM == "三商")

pat <- mutate(hr_tables[[1]], )

patterns <- sapply(hr_tables, mutate())