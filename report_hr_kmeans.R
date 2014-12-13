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
NAME <- "林 仲 秋"
NAME <- "張 泰 山"
NAME <- "陳 金 鋒"
BatterHistory <- list()
year <- seq(1990, 2014)
for (i in 1:length(year)) {
  BatterHistory <- rbind(BatterHistory, filter(hr_tables[[i]], BATTER == NAME))
}

head(BatterHistory)

fig <- ggplot(data = BatterHistory, aes(x = RBI, fill = factor(PITCHERTEAM)))
fig + geom_bar(stat = "bin", position="dodge") + 
  theme(text = element_text(family="Heiti TC Light"), plot.title = element_text(size = 26), legend.text = element_text(size = 20))

##


hrs <- filter(hr_tables[[1]], BATTERTEAM == TEAMS[[1]])

hrs_all <- sapply(hr_tables, mutate, )

pat <- mutate(hr_tables[[1]], )

patterns <- sapply(hr_tables, mutate, )