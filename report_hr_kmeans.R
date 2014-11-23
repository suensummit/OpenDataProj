year <- seq(1990, 2014)
for (i in 1:length(year)) {
  hr_table <- hr_tables[[i]]
  names2 <- names(hr_table)
  names2 <- hr_table[1,]
  names2[3] <- "GID"
  names2[7] <- "BatterTeam"
  names2[9] <- "PitcherTeam"
  names(hr_table) <- names2
  hr_tables[[i]] <- hr_table
}