setwd("Documents//OpenDataProj")
dir.create("report")

year <- seq(1990, 2014)
for (i in 1:length(year)) {
  hr_table <- hr_tables[[i]]
  names2 <- names(hr_table)
  names2[3] <- "GID"
  names2[7] <- "BatterTeam"
  names2[9] <- "PitcherTeam"
  names(hr_table) <- names2
  head(hr_table)
  
  par(family = 'Heiti TC Light')
  m <- ggplot(hr_table, aes(x = as.numeric(GID)))
  m + geom_density(aes(fill = factor(BatterTeam), alpha = 0.01)) + 
    labs(title = paste0("HR Distribution of ", year[i]," Season 中華職棒", year[i], "賽季逐場全壘打分布")) + 
    theme(text = element_text(family="Heiti TC Light"), plot.title = element_text(size = 26), legend.text = element_text(size = 20))
  ggsave(paste0("report//HR_dist_y", year[i], ".png"), width=15, height=10)
}
