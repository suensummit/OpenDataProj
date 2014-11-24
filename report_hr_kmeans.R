year <- seq(1990, 2014)
for (i in 1:length(year)) {
  hr_table <- hr_tables[[i]]
  names2 <- names(hr_table)
  names2 <- c("NUMBER", "YEAR", "GID", "DATE", "STADIUM", "BATTER", "BATTERTEAM", "PITCHER", "PITCHERTEAM", "RBI", "REMARK")
  names(hr_table) <- names2
  hr_tables[[i]] <- hr_table
}